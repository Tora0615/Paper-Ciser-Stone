import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    )
);




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  //-----------預設顏色及參數------------
  Color _computerScissorsStateColor = Colors.grey[200];
  Color _computerStoneStateColor = Colors.grey[200];
  Color _computerPaperStateColor = Colors.grey[200];

  Color _playerScissorsStateColor = Colors.grey[200];
  Color _playerStoneStateColor = Colors.grey[200];
  Color _playerPaperStateColor = Colors.grey[200];
  int computerWin = 0;
  int playerWin = 0;
  int computer;  //隨機數字
  String whoWin = '無';
  //-----------------------
  getGameState(player){
    //剪刀1,石頭2,布3
    computer = Random().nextInt(3)+1;  //抽取1~3隨機數字

    //-----------設定電腦剪刀石頭布狀態的顏色------------
    if(computer==1){
        _computerScissorsStateColor =  Colors.amber;
        _computerStoneStateColor = Colors.grey[200];
        _computerPaperStateColor = Colors.grey[200];
    }
    else if(computer==2){
        _computerScissorsStateColor =  Colors.grey[200];
        _computerStoneStateColor = Colors.amber;
        _computerPaperStateColor = Colors.grey[200];
    }
    else if(computer==3){
        _computerScissorsStateColor =  Colors.grey[200];
        _computerStoneStateColor = Colors.grey[200];
        _computerPaperStateColor = Colors.amber;
    }
    //-----------------------


    //----------上方狀態欄文字 & 輸贏計數-------------
    if(player == computer){
      whoWin = '兩者平手';
    }
    else if((player == 1 && computer == 2)||
            (player == 2 && computer == 3)||
            (player == 3 && computer == 1)){
      whoWin = '電腦';
      computerWin += 1;
    }
    else if((player == 2 && computer == 1)||
            (player == 3 && computer == 2)||
            (player == 1 && computer == 3)){
      whoWin = '玩家';
      playerWin += 1;
    }
  }



  @override   //原本StatelessWidget也有他的建構函數，下面將其複寫掉
  Widget build(BuildContext context) {
    //複寫的建構函數
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '剪刀  石頭  布',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: <Widget>[
          //系統文字的容器
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Container(
                padding: EdgeInsets.fromLTRB(105,15,105,15),
                margin: EdgeInsets.fromLTRB(0,15,0,10),
                color: Colors.blueGrey[100],
                child: Text(
                  '勝利者 : $whoWin',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),

            ],
          ),

          //戰況跟猜拳的容器
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  //玩家電腦文字
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Text(
                          '電腦',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink[300],
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      SizedBox(width: 190),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        //color: Colors.amber,
                        child: Text(
                          '玩家',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink[300],
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ],
                  ),

                  //勝利狀態文字
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        //color: Colors.red,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          '勝利 : $computerWin 場',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple[500],
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      SizedBox(width: 110),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        //color: Colors.amber,
                        child: Text(
                          '勝利 : $playerWin 場',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple[500],
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ],
                  ),

                  //剪刀
                  Row(
                    children: <Widget>[
                      Container(
                        color: _computerScissorsStateColor,
                        padding: EdgeInsets.fromLTRB(5, 45, 5, 45),
                        margin: EdgeInsets.fromLTRB(0, 0, 75, 0),
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: (){
                            //print('(pressed)剪刀, $computer');
                            setState(() {
                              _playerScissorsStateColor = Colors.amber;
                              _playerStoneStateColor = Colors.grey[200];
                              _playerPaperStateColor = Colors.grey[200];
                              getGameState(1);
                            });

                          },
                          padding: EdgeInsets.all(0.0),
                          child: Image(
                            color: Colors.red[500],
                            image: AssetImage('assets/scissors.png'),
                          ),
                        ),
                      ),
                      Container(
                        color: _playerScissorsStateColor,
                        padding: EdgeInsets.fromLTRB(5, 45, 5, 45),
                        margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
                      ),
                    ],
                  ),

                  //石頭
                  Row(
                    children: <Widget>[
                      Container(
                        color: _computerStoneStateColor,
                        padding: EdgeInsets.fromLTRB(5, 45, 5, 45),
                        margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: (){
                            //print('(pressed)石頭, $computer');
                            setState(() {
                              _playerScissorsStateColor = Colors.grey[200];
                              _playerStoneStateColor = Colors.amber;
                              _playerPaperStateColor = Colors.grey[200];
                              getGameState(2);
                            });

                          },
                          padding: EdgeInsets.all(0.0),
                          child: Image(
                            color: Colors.green[500],
                            image: AssetImage('assets/stone.png'),
                          ),
                        ),
                      ),
                      Container(
                        color: _playerStoneStateColor,
                        padding: EdgeInsets.fromLTRB(5, 45, 5, 45),
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                      ),
                    ],
                  ),

                  //布
                  Row(
                    children: <Widget>[
                      Container(
                        color: _computerPaperStateColor,
                        padding: EdgeInsets.fromLTRB(5, 45, 5, 45),
                        margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: (){
                            //print('(pressed)布, $computer');
                            setState(() {
                              _playerScissorsStateColor = Colors.grey[200];
                              _playerStoneStateColor = Colors.grey[200];
                              _playerPaperStateColor = Colors.amber;
                              getGameState(3);
                            });

                          },
                          padding: EdgeInsets.all(0.0),
                          child: Image(
                            color: Colors.cyan[500],
                            image: AssetImage('assets/paper.png'),
                          ),
                        ),
                      ),
                      Container(
                        color: _playerPaperStateColor,
                        padding: EdgeInsets.fromLTRB(5, 45, 5, 45),
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                      ),
                    ],
                  ),



                ],
              ),
            ],
          ),
        ],
      ),


        floatingActionButton: FlatButton(
            color: Colors.purple[400],
            onPressed: (){
              setState(() {
                _playerScissorsStateColor = Colors.grey[200];
                _playerStoneStateColor = Colors.grey[200];
                _playerPaperStateColor = Colors.grey[200];

                _computerScissorsStateColor = Colors.grey[200];
                _computerStoneStateColor = Colors.grey[200];
                _computerPaperStateColor = Colors.grey[200];

                computerWin = 0;
                playerWin = 0;
                whoWin = '無';
              });
            },
            child: Text(
              '重置紀錄',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
        ),
    );
  }
}


//- assets/scissors.png
//- assets/paper.png
//- assets/stone.png