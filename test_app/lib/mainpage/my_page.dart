import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/mainpage/home_page.dart';

class MyPage extends StatefulWidget {
MyPage({Key key}) : super(key: key);

MyPageState createState() => MyPageState();
}


class MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 155,
                width: double.infinity,
                color:Colors.white,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 10.0,
                          bottom: 15.0,
                        ),
                        child: Container(
                          child: Image.asset('images/ht1.png',
                            width: 117.0,
                            height: 90.0,),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 30.0,
                                bottom: 15.0,
                               ),
                              child: Text(
                                '超级管理员',
                                  style: TextStyle(
                                  color: Color(0xff55dbab),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36.0),
                            ),
                          ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30.0,
                                bottom: 30.0,
                              ),
                              child: Text(
                              'admin',
                              style: TextStyle(
                                  color: Color(0xff55dbab), fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
                width: double.infinity,
              ),
              Container(
                height: 335,
                width: double.infinity,
                color:Colors.white,
                child: Column(
                  children: <Widget>[
                    _myListTitle('班组'),
                    _myListTitle('手机'),
                    _myListTitle('微信'),
                    _myListTitle('邮箱'),
                    _myListTitle('类型'),
                    _myListTitle('备注'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
                width: double.infinity,
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text('切换账号'),
                    color:Colors.white,
                    textColor: Colors.black,
                    elevation: 10,
                    onPressed: (){},
                )
              ),
              SizedBox(
                height: 5,
                width: double.infinity,
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text('退出登录'),
                    color:Colors.white,
                    textColor: Colors.black,
                    elevation: 5,
                    onPressed: (){},
                  )
              ),
            ],
          )
        )
    );
  }
}

Widget _myListTitle(String title) {
  return Container(
    height: 55,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
    child: ListTile(
      // leading: Icon(Icons.blur_on),
      title: Text('         $title'),
      // trailing: Icon(Icons.chevron_right),
    ),
  );
}