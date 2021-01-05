import 'package:events_app/ui/colors.dart';
import 'package:events_app/ui/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class EventsForYouTab extends StatefulWidget {
  @override
  _EventsForYouTabState createState() => _EventsForYouTabState();
}

class _EventsForYouTabState extends State<EventsForYouTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> _tabs = [Tab(text: 'FOR YOU'), Tab(text: 'TRENDING')];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TabBar(
              indicatorColor: START_COLOR,
              labelColor: START_COLOR,
              unselectedLabelColor: GREY,
              controller: _tabController,
              tabs: _tabs),
          Expanded(
              child: TabBarView(controller: _tabController, children: [
            ForYouTabPage(),
            TrendingTabPage(),
          ]))
        ],
      ),
    );
  }
}

class ForYouTabPage extends StatefulWidget {
  @override
  _ForYouTabPageState createState() => _ForYouTabPageState();
}

class _ForYouTabPageState extends State<ForYouTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/ic_around_you.svg'),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'See all events around you - 10km',
                    style: TextStyle(
                        color: START_COLOR, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: EventItem())
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TrendingTabPage extends StatefulWidget {
  @override
  _TrendingTabPageState createState() => _TrendingTabPageState();
}

class _TrendingTabPageState extends State<TrendingTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: EventItem(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
