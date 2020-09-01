import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:test_app/model/zj_model.dart';
import 'package:test_app/model/sx_model.dart';
import 'package:test_app/model/fj_model.dart';

class ZjInfo extends StatefulWidget {
  ZjInfo({Key key}) : super(key: key);
  @override
  _ZjInfoState createState() => _ZjInfoState();
}

class _ZjInfoState extends State<ZjInfo> {

  int _zjNo = 1;
  int _sxNo = 1;
  int _fjNo = 1;
  var currentPanelIndex=-1;
  List<ExpansionPanelItem> _expansionPanelItems;
  List<JsonTableColumn> columnsZJ;
  List<JsonTableColumn> columnsSX;
  List<JsonTableColumn> columnsFJ;
  List<JsonTableColumn> columnsSMK;
  bool toggle = true;
  final String jsonSample =
      '[{"f_Section": 0,"f_No":1,"f_Status": 1,"f_Dl": 2.20,"f_Zs": 6.5},'
      '{"f_Section": 0,f_No": 2,"f_Status": 2,"f_Dl": 3.50,"f_Zs": 8.3},'
      '{"f_Section": 1,f_No": 2,"f_Status": 1,"f_Dl": 3.50,"f_Zs": 8.3},'
      '{"f_Section": 1,f_No": 3,"f_Status": 2,"f_Dl": 3.50,"f_Zs": 8.3},'
      '{"f_Section": 2,f_No": 1,"f_Status": 2,"f_Dl": 3.50,"f_Zs": 8.3},'
      '{"f_Section": 2,f_No": 2,"f_Status": 1,"f_Dl": 3.50,"f_Zs": 8.3},'
      '{"f_Section": 3,f_No": 1,"f_Status": 2,"f_Dl": 3.50,"f_Zs": 8.3},'
      '{"f_Section": 3,f_No": 2,"f_Status": 1,"f_Dl": 3.50,"f_Zs": 8.3},'
      ']';

  Future<dynamic> getZjInfo() async {
    var response = await Dio().get("http://172.16.202.194:5050/api/SectionInfoManage/ZJ");
    print(response.toString());
    Map dataMapZJ = jsonDecode(response.toString());
    var zj = ZJDetailsEntity.fromJson(dataMapZJ);
    print(dataMapZJ);
    var json = jsonDecode(jsonSample);
    print(json);
    var datacj = [];
    var datazz = [];
    var datayjz = [];
    var datajj = [];
//    for (var i = 0; i < json.length; i++) {
//      if (json.[i].f_Section == 0){
//        var vote = {};
//        vote.f_No = json[i].f_No;
//        vote.f_Status = json[i].f_Status;
//        vote.f_Dl = json[i].f_Dl;
//        vote.f_Zs = json[i].f_Zs;
//        datacj.push(vote);}
//    }
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {if (mounted){
      setState(() {
        _zjNo = zj.f_No;
      });
    }
    });
    return zj;
  }

  Future<dynamic> getSxInfo() async {
    var response = await Dio().get("http://172.16.202.194:5050/api/SectionInfoManage/SX");
    print(response.toString());
    Map dataMapSX = jsonDecode(response.toString());
    var sx = SXDetailsEntity.fromJson(dataMapSX);
    print(dataMapSX);
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {if (mounted){
      setState(() {
        _sxNo = sx.f_No;
      });
    }
    });
    return sx;
  }

  Future<dynamic> getFjInfo() async {
    var response = await Dio().get("http://172.16.202.194:5050/api/SectionInfoManage/FJ");
    print(response.toString());
    Map dataMapFJ = jsonDecode(response.toString());
    var fj = FJDetailsEntity.fromJson(dataMapFJ);
    print(dataMapFJ);
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {if (mounted){
      setState(() {
        _fjNo = fj.f_No;
      });
    }
    });
    return fj;
  }

  var jsonZj;
  var jsonSx;
  var jsonFj;
  setData() async {
    jsonZj = await getZjInfo();    //延迟执行后赋值给data
    jsonSx = await getSxInfo();
    jsonFj = await getFjInfo();
  }

  @override
  void initState() {
    super.initState();
    getZjInfo();
    getSxInfo();
    getFjInfo();
    //轧机表格
    columnsZJ = [
      JsonTableColumn("f_No", label: "轧机位"),
      JsonTableColumn("f_Status", label: "运行状态"),
      JsonTableColumn("f_Dl", label: "电流(A)"),
      JsonTableColumn("f_Zs", label: "转速(m/s)"),
    ];

    //水箱表格
    columnsSX = [
      JsonTableColumn("f_No", label: "水箱号"),
      JsonTableColumn("f_Temp", label: "水温（摄氏度）"),
      JsonTableColumn("f_Flow", label: "水流量（m^3/h）"),
//      JsonTableColumn("f_SXQPRESSURE", label: "水箱前压力"),
//      JsonTableColumn("f_SXHPRESSURE", label: "水箱前压力"),
    ];

    //飞剪表格
    columnsFJ = [
      JsonTableColumn("f_No", label: "飞剪编号"),
      JsonTableColumn("f_Dl", label: "电流（A)"),
      JsonTableColumn("f_JTTIMESET", label: "剪头时间设定"),
      JsonTableColumn("f_JWTIMESET", label: "剪尾时间设定"),
//      JsonTableColumn("f_FJJTSPEED", label: "飞剪剪头速度"),
//      JsonTableColumn("f_FJJWSPEED", label: "飞剪剪尾速度"),
    ];

    //双模块表格

    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: '粗轧轧机信息',
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
                children: <Widget>[
//                Divider(height: 1.0,color: Colors.black,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        JsonTable(
                          jsonZj,
                          columns: columnsZJ,
                          showColumnToggle: false,
                          allowRowHighlight: true,
                          rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                      ],
                    )
                  )
                ]
            )
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '中轧轧机信息',
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
                children: <Widget>[
//                Divider(height: 1.0,color: Colors.black,),
                  Container(
                      child: Column(
                        children: <Widget>[
                          JsonTable(
                            jsonZj,
                            columns: columnsZJ,
                            showColumnToggle: false,
                            allowRowHighlight: true,
                            rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      )
                  )
                ]
            )
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '预精轧轧机信息',
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
                children: <Widget>[
//                Divider(height: 1.0,color: Colors.black,),
                  Container(
                      child: Column(
                        children: <Widget>[
                          JsonTable(
                            jsonZj,
                            columns: columnsZJ,
                            showColumnToggle: false,
                            allowRowHighlight: true,
                            rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      )
                  )
                ]
            )
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '精轧轧机信息',
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
                children: <Widget>[
//                Divider(height: 1.0,color: Colors.black,),
                  Container(
                      child: Column(
                        children: <Widget>[
                          JsonTable(
                            jsonZj,
                            columns: columnsZJ,
                            showColumnToggle: false,
                            allowRowHighlight: true,
                            rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      )
                  )
                ]
            )
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '水箱信息',
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
                children: <Widget>[
//                Divider(height: 1.0,color: Colors.black,),
                  Container(
                      child: Column(
                        children: <Widget>[
                          JsonTable(
                            jsonSx,
                            columns: columnsSX,
                            showColumnToggle: false,
                            allowRowHighlight: true,
                            rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      )
                  )
                ]
            )
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '飞剪信息',
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
                children: <Widget>[
//                Divider(height: 1.0,color: Colors.black,),
                  Container(
                      child: Column(
                        children: <Widget>[
                          JsonTable(
                            jsonFj,
                            columns: columnsFJ,
                            showColumnToggle: false,
                            allowRowHighlight: true,
                            rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      )
                  )
                ]
            )
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: '双模块信息',
        body: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Divider(height: 1.0,color: Colors.black,),
              Container(
                child: Text('Content for Panel.'),
              )
            ]
          )
        ),
        isExpanded: false,
      ),
    ];
  }

  Timer _countdownTimer;  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;super.dispose();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:SingleChildScrollView(
          child:Center(
              child:DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: "SimSun",
                  ),
                  textAlign:TextAlign.left,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textDirection: TextDirection.ltr,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Container(
                          margin:EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Column(
                            mainAxisAlignment:  MainAxisAlignment.center,
                            children: <Widget>[
                              ExpansionPanelList(
                                expansionCallback: (int panelIndex, bool isExpanded) {
                                  setState(() {
                                    _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                                  });
                                },
                                children: _expansionPanelItems.map(
                                        (ExpansionPanelItem item) {
                                      return ExpansionPanel(
                                          isExpanded: item.isExpanded,
                                          body: item.body,
                                          headerBuilder: (BuildContext context, bool isExpanded) {
                                            return Container(
                                              padding: EdgeInsets.all(30),
                                              child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      alignment: Alignment(-0.75, 0),
                                                      child: Text(
                                                        item.headerText,
                                                        style: Theme.of(context).textTheme.title,
                                                      ),
                                                    ),
                                                  ]
                                              )
                                            );
                                          }
                                      );
                                    }
                                ).toList(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40.0,
                        ),
                ],
             ),
           ),
        )

      )
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.headerText, this.body, this.isExpanded});
}

//String getPrettyJSONString(jsonObject) {
//  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String jsonString = encoder.convert(json.decode(jsonObject));
//  return jsonString;
//}