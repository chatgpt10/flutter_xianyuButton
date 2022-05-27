import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RaisedButton(
          child: Text('点击跳转到按钮演示页面'),
          onPressed: () {
            Navigator.pushNamed(context, '/httpPage');
          },
        ),
        Container(
          width: 100,
          height: 10,
        ),
        RaisedButton(
          child: Text('点击跳转到按钮演示页面2'),
          onPressed: () {
            Navigator.pushNamed(context, '/httpBaiDu');
          },
        ),
      ]),
    );
  }
}
