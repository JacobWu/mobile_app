import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/navigator/tab_navigator.dart';
import 'package:test_app/model/alarm_model.dart';

class AlarmPage extends StatefulWidget {
  AlarmPage({Key key}) : super(key: key);

  _AlarmPageState createState() => _AlarmPageState();
}


class _AlarmPageState extends State<AlarmPage> {
  String _id = ' ';
  String _businessId = ' ';
  String _time = ' ';
  num _timeDuration = -1;
  num _zone = -1;
  String _device = ' ';
  String _reason = ' ';
  num _status = -1;
  List<int> mList;   //组成一个int类型数组，用来控制索引
  List<AlarmStateBean> expandStateList;  //开展开的状态列表,ExpandStateBean是自定义的类

  //构造方法，调用这个类的时候自动执行
  _AlarmPageState(){
    mList=new List();
    expandStateList=new List();
    //遍历两个List进行赋值
    for(int i=0;i<19;i++){
      mList.add(i);
      expandStateList.add(AlarmStateBean(i,false));//item初始状态为闭着的
    }
  }

  //修改展开与闭合的内部方法
  _setCurrentIndex(int index,isExpand){
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item){
        if(item.index==index){
          //取反，经典取反方法
          item.isOpen=!isExpand;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAlarmInfo();
  }

  Timer _countdownTimer;  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;super.dispose();
  }

  Future<void> getAlarmInfo() async {
    var response = await Dio().get("http://172.16.202.194:5050/api/ReportManage/L2Event",options: Options(responseType: ResponseType.plain));
    print(response.toString());
    final dynamic list = json.decode(response.toString());
    print(list);
    print(list[0]["f_TIME"]);
    // var result = list.asMap();
    //     print(result);
    // Map<String, dynamic> dataMap = json.decode(response.toString());
    // print(dataMap);
    var alarm = AlarmList.fromJson(list);
    print(alarm.toString());
    print('name, ${alarm.alarms.toString()}!');
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {if (mounted){
      setState(() {
        // _id = alarm.f_ID;
        // _businessId = alarm.f_BUSINESSID;
        // _time = alarm.f_TIME;
        // _timeDuration = alarm.f_TIMEDURATION;
        // _zone = alarm.f_ZONE;
        // _device = alarm.f_DEVICE;
        // _reason = alarm.f_REASON;
        // _status = alarm.f_STATUS;
      });
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(
          child: SingleChildScrollView(
              child: ExpansionPanelList(
                //交互回调属性，里面是个匿名函数
                expansionCallback: (index,bol){
                  //调用内部方法
                  _setCurrentIndex(index, bol);
                },
                //进行map操作，然后用toList再次组成List
                children: mList.map((index){
                  //返回一个组成的ExpansionPanel
                  return ExpansionPanel(
                      headerBuilder: (context,isExpanded){
                        return ListTile(
                          title: Text('事件号：  $index'),
                        );
                      },
                      body: ListTile(
                        title: Text('expansion no.$index'),
                      ),
                      isExpanded: expandStateList[index].isOpen
                  );
                }).toList(),
              ),
            ),
          )
      );
    }
  }

class AlarmStateBean{
  var isOpen;
  var index;
  AlarmStateBean(this.index,this.isOpen);
}