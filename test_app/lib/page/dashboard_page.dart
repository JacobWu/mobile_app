import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/navigator/tab_navigator.dart';
import 'package:test_app/widget/my_drawer_widget.dart';
import 'package:test_app/widget/my_botnavibar_widget.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {

   int _currentIndex = 0;
  _onItemTapped(index){
    setState(() {
      _currentIndex = index;
    });
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new MyNavigator(),
//        builder: (context) => _pageList[_currentIndex],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff55dbab),
        brightness: Brightness.light,
        title:  Text(
          "综合看板",
        ),
      ),
      drawer: MyDrawer(),
      body: new Center(
        child:(
        new Text(' aaa ')
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              title: Text("告警"),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("我的"),
              backgroundColor: Colors.white)
        ],
        fixedColor: Color(0xff55dbab),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}