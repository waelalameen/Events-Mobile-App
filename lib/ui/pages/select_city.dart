import 'package:events_app/ui/colors.dart';
import 'package:events_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final _checkedList = List<bool>();
  bool _clearIconVisible = false;
  bool _clearPressed = false;
  bool _showSuggestions = false;

  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    for (var i = 0; i < 9; i++) {
      _checkedList.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height - kToolbarHeight - 180) / 2;

    return Container(
      color: BACKGROUND,
      child: Stack(fit: StackFit.expand, children: [
        Column(
          children: [
            _buildSearchInput(),
            _buildSuggestionsView(),
            Visibility(
              visible: !_showSuggestions,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildGridView(itemWidth, itemHeight),
                ),
              ),
            ),
            _buildCityNotFoundView(itemWidth)
          ],
        ),
        _buildNextButton()
      ]),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      color: Colors.white,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        cursorColor: BLACK_100,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          labelText: 'Search city ...',
          labelStyle: TextStyle(fontWeight: FontWeight.w300),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(
            Icons.search,
            size: 28.0,
            color: BLACK_100,
          ),
          suffixIcon: _clearIconVisible
              ? IconButton(
                  icon: Icon(Icons.clear),
                  iconSize: 28.0,
                  color: START_COLOR,
                  onPressed: () {
                    _controller.clear();
                    _focusNode.unfocus();
                    setState(() {
                      _showSuggestions = false;
                      _clearIconVisible = false;
                      _clearPressed = true;

                      Future.delayed(Duration(seconds: 1), () {
                        _clearPressed = false;
                      });
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        onTap: () {
          setState(() {
            if (_clearPressed) return;
            _showSuggestions = true;
            _clearIconVisible = true;
          });
        },
      ),
    );
  }

  Widget _buildGridView(itemWidth, itemHeight) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: itemWidth / itemHeight),
        physics: ScrollPhysics(),
        itemCount: 9,
        primary: true,
        itemBuilder: (context, index) {
          return _buildCityItem(context, index);
        });
  }

  Widget _buildCityItem(context, index) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 0,
      color: BACKGROUND,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: size.width / 1.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    image: AssetImage('images/img.png'),
                    fit: BoxFit.cover,
                    colorFilter: _checkedList[index] == true
                        ? ColorFilter.mode(
                            END_COLOR.withOpacity(0.7), BlendMode.srcOver)
                        : null)),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {
                setState(() {
                  _checkedList[index] = !_checkedList[index];
                  for (var i = 0; i < _checkedList.length; i++) {
                    if (i != index) _checkedList[i] = false;
                  }
                });
              },
              child: _checkedList[index] == true
                  ? Center(
                      child: SvgPicture.asset('images/ic_uncheck.svg'),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
              child: Text(
            'Paris',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ))
        ],
      ),
    );
  }

  Widget _buildSuggestionsView() {
    return Visibility(
      visible: _showSuggestions,
      child: Expanded(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () {
                      print('location');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('images/ic_your_location.svg'),
                          SizedBox(width: 16.0),
                          Text('Use your current location')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'POPULAR CITIES',
                  style: TextStyle(color: GREY),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Text(
                            'London',
                            style: TextStyle(
                                color: BLACK_100,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Visibility(
      visible: !_showSuggestions,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: PrimaryButton(
            title: 'NEXT',
            onPressed: () {
              print('object');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCityNotFoundView(itemWidth) {
    return Visibility(
        visible: false,
        child: Expanded(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 124.0),
                  SvgPicture.asset('images/ic_earth.svg'),
                  SizedBox(height: 32.0),
                  Text(
                    'We could not find that city, try a new one',
                    style: TextStyle(
                        color: BLACK_100,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    '—————————— OR ——————————',
                    style: TextStyle(
                        color: BLACK_100,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Do you want to request a new city?',
                    style: TextStyle(
                        color: BLACK_100,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 24.0),
                  PrimaryButton(
                    title: 'Request',
                    width: itemWidth,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
