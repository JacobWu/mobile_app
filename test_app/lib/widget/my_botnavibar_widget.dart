import 'package:flutter/material.dart';
import 'package:test_app/navigator/tab_navigator.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key key}) : super(key: key);

  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  String appBarTitle = "高线生产管理系统";
  int _currentIndex = 0;
  PageController _pageController;
  // List<Widget> _pageList = [HomePage(), AlarmPage(), MyPage()];

  _onItemTapped(index){
    setState(() {
      _currentIndex = index;
    });
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new MyNavigator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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