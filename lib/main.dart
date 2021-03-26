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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 1.0,
            child: Stack(
              children: [
                // 배경을 넣을까 ?
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.25,
                //   // color: Colors.black12
                //   decoration: BoxDecoration(
                //     // gradient: LinearGradient( // 그라데이션은 안어울림...
                //     //   colors: _colors,
                //     //   stops: _stops,
                //     // ),
                //     // image: DecorationImage(
                //     //   image: NetworkImage('https://cdn.pixabay.com/photo/2017/10/23/02/19/beach-2879929__340.jpg'),
                //     //   fit: BoxFit.fill
                //     // )
                //   )
                // ),
                // Location info
                Container(
                  height: 30,
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  // color: Colors.black12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.location_on_sharp),
                      SizedBox(width: 5.0,),
                      Text('서울시 광진구')
                    ],
                  )
                ),
                // Main WD Info
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  // color: Colors.black26,
                  child: MainWDInfoBox(),
                ),
              ],
            ),
          ),
          // Today's WD
          Card(
            elevation: 1.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5.0),
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardTitle('시간대별 날씨'),
                  SizedBox(height: 3.0,),
                  // 시간별 날씨 횡스크롤 Area
                  Container(
                    height: 60.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // the Container that has wd info by each time
                        WDDayInfo('08시', 8, Icon(Icons.wb_sunny, color: Colors.yellow,),),
                        WDDayInfo('09시', 9, Icon(Icons.wb_sunny, color: Colors.yellow,),),
                        WDDayInfo('10시', 11, Icon(Icons.wb_sunny, color: Colors.yellow,),),
                        WDDayInfo('11시', 12, Icon(Icons.wb_sunny, color: Colors.yellow,),),
                        WDDayInfo('12시', 12, Icon(Icons.wb_sunny, color: Colors.yellow,),),
                        WDDayInfo('13시', 14, Icon(Icons.wb_sunny, color: Colors.yellow,),),
                        WDDayInfo('14시', 17, Icon(Icons.wb_cloudy, color: Colors.black54),),
                        WDDayInfo('15시', 17, Icon(Icons.wb_cloudy, color: Colors.black54,),),
                        WDDayInfo('16시', 14, Icon(Icons.wb_cloudy, color: Colors.black54,),),
                        WDDayInfo('17시', 13, Icon(Icons.wb_cloudy, color: Colors.black54,),),
                        WDDayInfo('18시', 13, Icon(Icons.wb_cloudy, color: Colors.black54,),),
                        WDDayInfo('19시', 10, Icon(Icons.wb_cloudy, color: Colors.black54,),),
                        WDDayInfo('20시', 7, Icon(Icons.wb_cloudy, color: Colors.black54,),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // 주간 날씨
          Card(
            elevation: 1.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5.0),
              height: 120,
              child: Column(
                children: [
                  CardTitle('주간 날씨'),
                  SizedBox(height: 3.0,),
                  // 주간 날씨 횡스크롤 Area
                  Container(
                    height: 80.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          // Etc
          Expanded(
              child: Container(
              // color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Container(
                  // color: Colors.black45,
                  child: ListView.builder(
                    itemCount: weather_info.length,
                    itemBuilder: (context, index) {
                      var item = weather_info[index];
                      return _card(
                        wtime: item['time'],
                        condition: item['condition'],
                      );
                    },
                  ),
                ) 
              )
            ),
          )
        ],
      )
    );
  }
}
