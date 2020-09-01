import 'package:flutter/material.dart';
import 'package:test_app/page/device_page.dart';
import 'package:test_app/page/team_page.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/表头图形.png"),
                    fit:BoxFit.cover
                  )
                ),
                alignment: Alignment.topLeft,
                height: 180,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 40),
                        child: Image.asset('images/ht1.png',
                          height: 70,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                    ),
                    // Padding(
                    //     padding: EdgeInsets.only(left: 15, top: 10),
                    //     child: Text(
                    //       "中冶华天",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.bold),
                    //     ))
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("综合看板"),
                  onTap:() =>
                  Navigator.push(context,
                      new MaterialPageRoute(
                        builder: (context) => new DevicePage(),
                      )
                  ),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("在线设备"),
                onTap:() =>
                    Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => new DevicePage(),
                        )
                    ),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("班组实绩"),
                onTap:() =>
                    Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => new TeamPage(),
                        )
                    ),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("钢坯跟踪"),
                onTap:() =>
                    Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => new DevicePage(),
                        )
                    ),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("轧制计划"),
                onTap:() =>
                    Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => new DevicePage(),
                        )
                    ),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("历史查询"),
                onTap:() =>
                    Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => new DevicePage(),
                        )
                    ),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("可视化分析"),
                onTap:() =>
                    Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => new DevicePage(),
                        )
                    ),
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text("关闭"),
                onTap:() => Navigator.pop(context),
              )
            ],
          )),
    );
  }
}
