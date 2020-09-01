import 'package:flutter/material.dart';
import 'package:test_app/mainpage/alarm_page.dart';
import 'package:test_app/mainpage/home_page.dart';
import 'package:test_app/mainpage/my_page.dart';
import 'package:test_app/widget/my_drawer_widget.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyNavigator extends StatefulWidget {
  MyNavigator({Key key}) : super(key: key);

//  static GlobalKey<NavigatorState> _globalKey = new GlobalKey();
//
//  @override
//  State<StatefulWidget> createState() {
////    _globalKey.currentState.appBarTitle
//    return NavigatorState();
//  }
  NavigatorState createState() => NavigatorState();
}

class NavigatorState extends State<MyNavigator> {
  String appBarTitle = "高线生产管理系统";
  int _currentIndex = 0;
  PageController _pageController;
  List<Widget> _pageList = [HomePage(), AlarmPage(), MyPage()];

  String content = '';

  scan() async {
    var options = ScanOptions();

    ScanResult result = await BarcodeScanner.scan(options: options);
    print(result.type);
    print(result.rawContent);
    setState(() {
      content = result.rawContent;
    });
    String url = result.rawContent;
    RegExp reg = RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    if (reg.firstMatch(content) != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return WebviewScaffold(
          appBar: AppBar(
            title: Text(url),
          ),
          url: url,
        );
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void didChangeDependencies() {
    setPara();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // setPara();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff55dbab),
        brightness: Brightness.light,
        elevation: 0,
        title: Text(appBarTitle, textAlign: TextAlign.center),
        actions: <Widget>[
          new IconButton(
            icon: ImageIcon(AssetImage("images/扫一扫.png")),
            iconSize: 30.0,
            tooltip: '扫描二维码 $_currentIndex',
            onPressed: () {
              scan();
            },
          ),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30.0,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: '打开侧菜单栏',
            // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
      ),
      drawer: MyDrawer(),
      body: PageView(
        controller: _pageController,
        children: _pageList,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _setAppBarTitle();
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(_currentIndex);
            });
          },
          elevation: 72,
          backgroundColor: Color(0xff55dbab),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black87,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("首页"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_alert),
                title: Text("告警"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("我的"),
                backgroundColor: Colors.white)
          ]
      ),
    );
  }

  void _setAppBarTitle() {
    if (_currentIndex == 0) {
      this.appBarTitle = "高线生产管理系统";
    } else if (_currentIndex == 1) {
      this.appBarTitle = "告警";
    } else if (_currentIndex == 2) {
      this.appBarTitle = "我的";
    }
  }

  void setPara() async {
    int para = ModalRoute.of(context).settings.arguments;
    if (para != null) {
      _pageController = PageController(initialPage: para);
      _currentIndex = para;
      // print('para:$para');
    }// print('newpara:$para');
  }

}
