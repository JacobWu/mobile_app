import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/widget/my_drawer_widget.dart';

class TeamPage extends StatefulWidget {
  TeamPage({Key key}) : super(key: key);

  TeamPageState createState() => TeamPageState();
}

class TeamPageState extends State<TeamPage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List _tabList = ["产量信息", "能源消耗", "剔废信息","换辊信息", "停机信息"];
  TabController _tabController;

  _onItemTapped(index){
    setState(() {
      _currentIndex = index;
    });
    Navigator.of(context).popAndPushNamed("new_page", arguments: _currentIndex);
  }

  @override
  void initState() {
    super.initState();
    this._tabController = new TabController(vsync: this, length: _tabList.length);
    // this._tabController.addListener(() {
    //   var index = _tabController.index;
    //   var previousIndex = _tabController.previousIndex;
    //   print("index: $index");
    //   print('previousIndex: $previousIndex');
    // });
  }

  @override
  void dispose() {
    super.dispose();
    if (_tabController != null) {
      _tabController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff55dbab),
        brightness: Brightness.light,
        title:  Text(
          "在线设备",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Material(
            color:Colors.white,
            elevation: 5,
            child:TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelColor: Color(0xfff8b551),
              unselectedLabelColor: Color(0xff000000),
              labelStyle: TextStyle(fontSize: 14.0),
              labelPadding: EdgeInsets.only(left:11.3,right:11.3),
              tabs: _tabList.map((item) {
                return Tab(text: item);
              }).toList(),
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            Text('a'),
            Text('b'),
            Text('c'),
            Text('d'),
            Text('e'),
          ]
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
        elevation: 0,
        backgroundColor: Color(0xff55dbab),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black87,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}