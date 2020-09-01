import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/page/device_page.dart';
import 'package:test_app/page/dashboard_page.dart';
import 'package:test_app/page/team_page.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  HomePageState createState() => HomePageState();
}


class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          body: GridView.builder(
            itemCount: 7,
            itemBuilder: _getWidget,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 25,
                childAspectRatio: 1),
          ),
        )
    );
  }
}

Widget _getWidget(BuildContext c, int index) {
  if (index == 0) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: IconButton(icon: Image.asset('images/icons/圆-综合看板.png'),
                  tooltip: '查看综合图表数据',
                  color: Colors.cyan,
                  highlightColor: Colors.deepPurple.withOpacity(0.4),
                  splashColor: Colors.redAccent,
                  iconSize: 80.0,
                  onPressed: () {
                    Navigator.of(c).push(
                        MaterialPageRoute(builder: (c) => DashboardPage()));
                  }
              )
          ),
          SizedBox(width: 10),
          Container(
              child: Text('综合看板')
          )
        ],
      ),
    );
  }
  else if (index == 1) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: IconButton(icon: Image.asset('images/icons/圆-钢坯跟踪.png'),
                  tooltip: '查看钢坯详细信息',
                  color: Colors.cyan,
                  highlightColor: Colors.deepPurple.withOpacity(0.4),
                  splashColor: Colors.redAccent,
                  iconSize: 80.0,
                  onPressed: () {
                    Navigator.of(c).push(
                        MaterialPageRoute(builder: (c) => DevicePage()));
                  }
              )
          ),
          SizedBox(width: 10),
          Container(
              child: Text('钢坯跟踪')
          )
        ],
      ),
    );
  }
  else if (index == 2) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: IconButton(icon: Image.asset('images/icons/圆-轧制计划.png'),
                  tooltip: '查看轧制计划信息',
                  color: Colors.cyan,
                  highlightColor: Colors.deepPurple.withOpacity(0.4),
                  splashColor: Colors.redAccent,
                  iconSize: 80.0,
                  onPressed: () {
                    Navigator.of(c).push(
                        MaterialPageRoute(builder: (c) => DevicePage()));
                  }
              )
          ),
          SizedBox(width: 10),
          Container(
              child: Text('轧制计划')
          )
        ],
      ),
    );
  }
  else if (index == 3) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: IconButton(icon: Image.asset('images/icons/圆-班组实绩.png'),
                  tooltip: '查看班组生产信息',
                  color: Colors.cyan,
                  highlightColor: Colors.deepPurple.withOpacity(0.4),
                  splashColor: Colors.redAccent,
                  iconSize: 80.0,
                  onPressed: () {
                    Navigator.of(c).push(
                        MaterialPageRoute(builder: (c) => TeamPage()));
                  }
              )
          ),
          SizedBox(width: 10),
          Container(
              child: Text('班组实绩')
          )
        ],
      ),
    );
  }
  else if (index == 4) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: IconButton(icon: Image.asset('images/icons/圆-在线设备.png'),
                  tooltip: '查看在线设备信息',
                  color: Colors.cyan,
                  highlightColor: Colors.deepPurple.withOpacity(0.4),
                  splashColor: Colors.redAccent,
                  iconSize: 80.0,
                  onPressed: () {
                    Navigator.of(c).push(
                        MaterialPageRoute(builder: (c) => DevicePage()));
                  }
              )
          ),
          SizedBox(width: 10),
          Container(
              child: Text('在线设备')
          )
        ],
      ),
    );
  }
  else if (index == 5) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: IconButton(icon: Image.asset('images/icons/圆-历史查询.png'),
                  tooltip: '查看历史生产信息',
                  color: Colors.cyan,
                  highlightColor: Colors.deepPurple.withOpacity(0.4),
                  splashColor: Colors.redAccent,
                  iconSize: 80.0,
                  onPressed: () {
                    Navigator.of(c).push(
                        MaterialPageRoute(builder: (c) => DevicePage()));
                  }
              )
          ),
          SizedBox(width: 10),
          Container(
              child: Text('历史查询')
          )
        ],
      ),
    );
  }
  else if (index == 6) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: IconButton(icon: Image.asset('images/icons/圆-可视化分析.png'),
                  tooltip: '查看可视化数据图表',
                  color: Colors.cyan,
                  highlightColor: Colors.deepPurple.withOpacity(0.4),
                  splashColor: Colors.redAccent,
                  iconSize: 80.0,
                  onPressed: () {
                    Navigator.of(c).push(
                        MaterialPageRoute(builder: (c) => DevicePage()));
                  }
              )
          ),
          SizedBox(width: 10),
          Container(
              child: Text('可视化分析')
          )
        ],
      ),
    );
  }
}