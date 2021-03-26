import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:developer';

class WDWeekInfo extends StatelessWidget {
  const WDWeekInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class WDDayInfo extends StatelessWidget {
  const WDDayInfo(this.timestr, this.temp, this.icon, {Key key, this.markSize:8.0}) : super(key: key);

  final String timestr;
  final int temp;
  final double markSize;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          WDDegree(temp: this.temp, markSize: this.markSize, fontSize: 13,),
          SizedBox(height: 2.0,),
          Text(this.timestr, style: TextStyle(fontSize: 11.0),)
        ],
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle(this.title, {Key key, this.icon:Icons.arrow_right_rounded, this.iconColor: Colors.black54}) : super(key: key);

  final String title;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Icon(icon, color: iconColor,),
          Text(title, style: TextStyle(fontSize: 14.0, color: iconColor))
        ],
      ),
    );
  }
}

class WDDegree extends StatelessWidget {
  WDDegree({Key key, this.fontSize:15.0, this.type:'N', this.temp, this.markSize:17.0, this.isTempBold:false}) : super(key: key);

  final int temp;
  final String type;
  final double fontSize;
  final double markSize;
  final bool isTempBold;

  @override
  Widget build(BuildContext context) {

    String _degreeMark = this.type == 'C' ? '℃' : '˚' ;

    // debugger(when: true);
    // log('type ${this.type}', name: 'wd_widget');

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(temp.toString(), style: TextStyle(fontSize: fontSize, fontWeight: isTempBold?FontWeight.bold:FontWeight.normal)),
          Column(
            children: [
              SizedBox(height: 2.0,),
              Container(
                child: Text(_degreeMark, style: TextStyle(fontSize: markSize, fontWeight: isTempBold?FontWeight.bold:FontWeight.normal)),
              ),
              Container(
                
              )
            ],
          )
        ]
      ),
    );
  }
}

class MainWDInfoBox extends StatelessWidget {

  const MainWDInfoBox({Key key}) : super(key: key);

  void initState() {
    
  }

  Widget _etcInfo({String title, String np, String grade, Color color, Icon icon}) {

    const _fontSize = 12.0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: color, fontSize: _fontSize),),
          Text(np, style: TextStyle(color: color, fontSize: _fontSize),),
          Text(grade, style: TextStyle(color: color, fontSize: _fontSize),),
          icon
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    // TODO: Need a builder function that makes _etcInfo widget by each data that given from Web scraping
    var _etcInfos = [
      _etcInfo(title: '미세먼지', np: '132㎍/㎥', grade: '나쁨', color: Colors.orange, icon: Icon(Icons.sentiment_dissatisfied, color: Colors.orange)),
      _etcInfo(title: '초미세먼지', np: '93㎍/㎥', grade: '매우나쁨', color: Colors.red, icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red)),
      _etcInfo(title: '오존지수', np: '0.009ppm', grade: '좋음', color: Colors.blue, icon: Icon(Icons.sentiment_satisfied, color: Colors.blue)),
    ];

    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: NetworkImage('https://cdn.pixabay.com/photo/2016/01/02/00/42/cloud-1117279__340.jpg'),
        //   fit: BoxFit.none
        // )
        // color: Colors.blue,
        // border: Border.all(
        //   // color: Colors.black38,
        //   width: 0
        // )
      ),
      child: Row(
        children: [
          // Main Left: 위치(지역명, 위치아이콘), 날씨아이콘, 시간, 온도(섭씨)
          Container(
            width: MediaQuery.of(context).size.width * 0.45,  // 날씨아이콘 너비 폭 45%
            // color: Colors.black26,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 날씨 아이콘
                Image.network('https://pics.freeicons.io/uploads/icons/png/3474895151556279796-512.png', color: Colors.yellow, scale: 8.0,),
                SizedBox(height: 5.0,),
                // 현재 기온
                WDDegree(temp: 15, fontSize: 28.0, type: 'C',),
                SizedBox(height: 3.0,),
                // 최저/최고 기온
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('6˚', style: TextStyle(fontSize: 15.0, color: Colors.blue,)),
                    Text('/', style: TextStyle(fontSize: 15.0, color: Colors.black,)),
                    Text('18˚', style: TextStyle(fontSize: 15.0, color: Colors.red,)),
                  ],
                ),
              ],
            ),
          ),
          // Main Right: 미세먼지 정보, 오늘의 날씨 종합 코멘트
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Main contents
                  return Container(
                    height: constraints.maxHeight * 0.5,  // Border-left height
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 0.5)
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _etcInfos
                    ),
                  );

                },
              )
            ),
          )

        ],
      ),
    );
  }
}