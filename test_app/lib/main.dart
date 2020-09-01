import 'package:flutter/material.dart';
import 'package:test_app/navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '高线管理系统',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNavigator(),
      routes:{
        "new_page":(context)=>MyNavigator(),
      } ,
    );
  }
}
