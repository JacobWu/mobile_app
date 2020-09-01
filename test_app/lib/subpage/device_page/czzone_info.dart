import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:test_app/model/czzone_model.dart';


class CzzoneInfo extends StatefulWidget {
  CzzoneInfo({Key key}) : super(key: key);
  @override
  _CzzoneInfoState createState() => _CzzoneInfoState();
}

class _CzzoneInfoState extends State<CzzoneInfo> {

  String _czzoneTime = ' -- ';
  num _cStatus1to32 = 1;
  num _cStatus33to64 = 1;
  num _cStatus65to96 = 1;
  num _pfSpeed = 1.0;
  num _pfDl = 1.0;
  num _cNumIsCz = 1.0;
  num _gjWeight = 1.0;
  num _cNumIsDk = 1.0;
  num _cNumIsZg = 1.0;
  num _cNumIsXg = 1.0;
  var currentPanelIndex=-1;
  List<ExpansionPanelItem> _expansionPanelItems;
  List<JsonTableColumn> columns;
  bool toggle = true;
  final String jsonSample =
  '[{"f_TIME":null,"f_CSTATUS1TO32":0,"f_CSTATUS33TO64":0,"f_CSTATUS65TO96":0,"f_PFSPEED":0,"f_PFDL":0,"f_CNUMISCZ":0,"f_GJWEIGHT":0,"f_CNUMISDK":0,"f_CNUMISZG":0,"f_CNUMISXG":0}]';
  final String jsonC =
      '[{"f_No":1,"f_Status":0},{"f_No":2,"f_Status":1}]';

  @override
  void initState() {
    super.initState();
    getCzzoneInfo();
    var json = jsonDecode(jsonC);

    columns = [
      JsonTableColumn("f_No", label: "C型钩钩号"),
      JsonTableColumn("f_Status", label: "状态"),
    ];

    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'C型钩状态',
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
                            json,
                            columns: columns,
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
    ];
  }

  Timer _countdownTimer;  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;super.dispose();
  }

  Future<void> getCzzoneInfo() async {
    var response = await Dio().get("http://172.16.202.194:5050/api/SectionInfoManage/CzZone");
    print(response.toString());
    Map dataMap = jsonDecode(response.toString());
    var czzone = CZZoneDetailsEntity.fromJson(dataMap);
    print(dataMap);
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {if (mounted){
      setState(() {
        _czzoneTime = czzone.f_TIME;
        _cStatus1to32 = czzone.f_CSTATUS1TO32;
        _cStatus33to64 = czzone.f_CSTATUS33TO64;
        _cStatus33to64 = czzone.f_CSTATUS65TO96;
        _pfSpeed = czzone.f_PFSPEED;
        _pfDl = czzone.f_PFDL;
        _cNumIsCz = czzone.f_CNUMISCZ;
        _gjWeight = czzone.f_GJWEIGHT;
        _cNumIsDk = czzone.f_CNUMISDK;
        _cNumIsXg = czzone.f_CNUMISXG;
        _cNumIsZg = czzone.f_CNUMISZG;
       });
      }
    });
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
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              height: 10.0,
                            ),
                            Container(
                                alignment: Alignment(-0.75, 0),
                                height: 35.0,
                                width: 500,
                                child: Text('记录时间：   $_czzoneTime')
                            ),
                            SizedBox(
                              width: 500,
                              height: 20.0,
                            ),
                            Container(
                                alignment: Alignment(-0.75, 0),
                                height: 35.0,
                                width: 500,
                                child: Text('PF线速度：   $_pfSpeed')
                            ),
                            Container(
                                alignment: Alignment(-0.75, 0),
                                height: 35.0,
                                width: 500,
                                child: Text('PF线电流：   $_pfDl')
                            ),
                            SizedBox(
                              width: 500,
                              height: 20.0,
                            ),
                            Container(
                                alignment: Alignment(-0.68, 0),
                                height: 35.0,
                                width: 500,
                                child: Text('上次完成称重的钩号：   $_cNumIsCz')
                            ),
                            Container(
                                alignment: Alignment(-0.63, 0),
                                height: 35.0,
                                width: 500,
                                child: Text('上次完成称重的钢卷重量：   $_gjWeight')
                            ),
                            Container(
                                alignment: Alignment(-0.70, 0),
                                height: 35.0,
                                width: 500,
                                child: Text('上次完成打捆的钩号：   $_cNumIsDk')
                            ),
                            Container(
                                alignment: Alignment(-0.40, 0),
                                height: 35,
                                width: 500,
                                child: Text('上次完成从集卷小车装钢的钩号：   $_cNumIsXg')
                            ),
                            Container(
                                alignment: Alignment(-0.40, 0),
                                height: 35.0,
                                width: 500,
                                child: Text('上次完成从卸卷小车卸钢的钩号：   $_cNumIsZg')
                            ),
                          ],
                      )
                    ),
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
