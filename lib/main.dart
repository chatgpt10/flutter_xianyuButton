// 核心库
import 'package:flutter/material.dart';
// 获取路由文件
import 'routes/Routes.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug样式
      initialRoute: '/', //初试加载路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}
