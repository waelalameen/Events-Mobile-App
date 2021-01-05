import 'package:flutter/material.dart';

import 'ui/colors.dart';
import 'ui/pages/event_details.dart';
import 'ui/pages/purchase_complete.dart';
import 'ui/pages/purchase_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Events',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Events'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                START_COLOR,
                END_COLOR
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Purchase Details',
          style: TextStyle(
            fontWeight: FontWeight.w400
          ),
        ),
      ),
      body: PurchaseComplete() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
