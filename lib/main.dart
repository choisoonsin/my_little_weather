import 'package:app/screen/1st_tab_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widget/wd_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My little Weather',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My little Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum WEATHER {
  SUNNY, CLOUDY, RAINY, SNOWY
}

class _MyHomePageState extends State<MyHomePage> {
  
  Icon iconByCondition(WEATHER condition) {
    var icon;
    switch (condition) {
      case WEATHER.SUNNY:
        icon = Icon(Icons.wb_sunny, color: Colors.yellow, size: 30.0);
        break;
      case WEATHER.CLOUDY:
        icon = Icon(Icons.wb_cloudy, color: Colors.black38, size: 30.0);
        break;
      case WEATHER.RAINY:
        icon = Icon(Icons.umbrella, color: Colors.blue, size: 30.0);
        break;
      case WEATHER.SNOWY:
        icon = Icon(Icons.sick, color: Colors.red, size: 30.0);
        break;
      default:
    }
    return icon;
  }

  Padding _card({String wtime, WEATHER condition}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(130, 196, 232, 1),
          // color: Colors.black,
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(
          //   color: Colors.black26,
          //   width: 1,
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconByCondition(condition),
            Text(wtime, style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final weather_info = [
      {'time': '08', 'condition': WEATHER.SUNNY},
      {'time': '10', 'condition': WEATHER.SUNNY},
      {'time': '12', 'condition': WEATHER.CLOUDY},
      {'time': '14', 'condition': WEATHER.CLOUDY},
      {'time': '16', 'condition': WEATHER.RAINY},
      {'time': '18', 'condition': WEATHER.SNOWY},
      {'time': '20', 'condition': WEATHER.SNOWY},
      {'time': '22', 'condition': WEATHER.SNOWY},
      {'time': '08', 'condition': WEATHER.SUNNY},
      {'time': '10', 'condition': WEATHER.SUNNY},
      {'time': '12', 'condition': WEATHER.CLOUDY},
      {'time': '14', 'condition': WEATHER.CLOUDY},
      {'time': '16', 'condition': WEATHER.RAINY},
      {'time': '18', 'condition': WEATHER.SNOWY},
      {'time': '20', 'condition': WEATHER.SNOWY},
      {'time': '22', 'condition': WEATHER.SNOWY}
    ];

    List<Color> _colors = [Colors.deepOrange, Colors.yellow];
    List<double> _stops = [0.0, 0.9];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          titleSpacing: 20.0,
          backgroundColor: Colors.purple,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.blueAccent],
                begin: Alignment.topCenter,
                end:Alignment.bottomCenter,
              )
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.donut_small)),
              Tab(icon: Icon(Icons.new_releases)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {

            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {

              },
            )
          ],
        ),
        body: TabBarView(
          children: [
            tab1st(),
            Text('2nd'),
            Text('3rd'),
            Text('4th'),
          ],
        )
      )
    );
  }
}
