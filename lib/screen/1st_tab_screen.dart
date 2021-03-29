
import 'package:flutter/material.dart';

class tab1st extends StatefulWidget {
  tab1st({Key key}) : super(key: key);

  @override
  _tab1stState createState() => _tab1stState();
}

class _tab1stState extends State<tab1st> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: NetworkImage('https://cdn.pixabay.com/photo/2018/07/20/13/52/sunflower-3550693_960_720.jpg'),
              image: NetworkImage('https://cdn.pixabay.com/photo/2015/11/02/18/32/water-1018808_960_720.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop)
            )
          )
          // color: Colors.black38,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.blue],
                  begin: Alignment.bottomRight,
                  end:Alignment.topLeft,
                ),
                color: Colors.white54
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Icon(Icons.location_on_sharp, color: Colors.white),
                          Text("서울시 광진구", style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold))
                        ]
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Text('15˚', style: TextStyle(fontSize: 60.0, color: Colors.white, fontWeight: FontWeight.bold),),
                          SizedBox(width: 5.0,),
                          Image.network('https://pics.freeicons.io/uploads/icons/png/12105862511596027200-512.png', color: Colors.yellow, scale: 8.0,),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 5.0,),
                  Expanded(
                    child: Container(
                      // color: Colors.black54,
                      margin: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.0,),
                          Center(
                            child: Text("오늘은 어제보다 4˚ 높아요", style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w300))
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.network('https://pics.freeicons.io/uploads/icons/png/4845584041548329956-512.png', color: Colors.white, scale: 12.0,),
                                  Text("최저 12˚", style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w300)),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.network('https://pics.freeicons.io/uploads/icons/png/4845584041548329956-512.png', color: Colors.white, scale: 12.0,),
                                  Text("최고 16˚", style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w300)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )   
                ]  
              ) 
            ),
            // 시간대별 날씨
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              padding: EdgeInsets.all(3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                // color: Colors.white,
                gradient: LinearGradient(
                  colors: [Colors.white54, Colors.white70],
                  begin: Alignment.bottomRight,
                  end:Alignment.topLeft,
                )
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // TODO: To make widget
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3.0),
                    width: 100,
                    // color: Colors.,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('오전 1시', style: TextStyle(fontSize: 13.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                        Image.network('https://pics.freeicons.io/uploads/icons/png/12229045061548329625-512.png', scale: 12.0, color: Colors.blueGrey,),
                        Text('15˚', style: TextStyle(fontSize: 14.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.opacity, size: 10.0, color: Colors.blue,),
                            Text('30%', style: TextStyle(fontSize: 10.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: Colors.white38
                      // ),
                      // color: Colors.white30,
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.blue],
                        begin: Alignment.centerLeft,
                        end:Alignment.centerRight,
                        stops: [0.0, 0.4]
                      )
                    ),
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Text('목요일', style: TextStyle(fontSize: 16.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          // color: Colors.black45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network('https://pics.freeicons.io/uploads/icons/png/12229045061548329625-512.png', scale: 12.0, color: Colors.blueGrey,),
                              SizedBox(width: 5.0,),
                              Image.network('https://pics.freeicons.io/uploads/icons/png/12229045061548329625-512.png', scale: 12.0, color: Colors.blueGrey,),
                            ],
                          ),
                        ),
                        Text('15˚/ 8˚', style: TextStyle(fontSize: 20.0, color: Colors.white,),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: Colors.white38
                      // ),
                      // color: Colors.white30,
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.blue],
                        begin: Alignment.centerLeft,
                        end:Alignment.centerRight,
                        stops: [0.0, 0.6]
                      )
                    ),
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Text('금요일', style: TextStyle(fontSize: 16.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          // color: Colors.black45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network('https://pics.freeicons.io/uploads/icons/png/12229045061548329625-512.png', scale: 12.0, color: Colors.blueGrey,),
                              SizedBox(width: 5.0,),
                              Image.network('https://pics.freeicons.io/uploads/icons/png/12229045061548329625-512.png', scale: 12.0, color: Colors.blueGrey,),
                            ],
                          ),
                        ),
                        Text('20˚/ 13˚', style: TextStyle(fontSize: 20.0, color: Colors.white,),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: Colors.white38
                      // ),
                      // color: Colors.white30,
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.blue],
                        begin: Alignment.centerLeft,
                        end:Alignment.centerRight,
                        stops: [0.0, 0.9]
                      )
                    ),
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Text('토요일', style: TextStyle(fontSize: 16.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          // color: Colors.black45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network('https://pics.freeicons.io/uploads/icons/png/18653925091605833501-512.png', color: Colors.yellow,),
                              SizedBox(width: 5.0,),
                              Image.network('https://pics.freeicons.io/uploads/icons/png/6328502301605833501-512.png', color: Colors.yellow,),
                            ],
                          ),
                        ),
                        Text('23˚/ 15˚', style: TextStyle(fontSize: 20.0, color: Colors.white,),),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]
    );
  }
}