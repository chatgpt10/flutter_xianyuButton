import 'package:flutter/material.dart';

import 'tabs/Category.dart';
import 'tabs/Home.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key? key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;
  _TabsState(this._currentIndex);

  List _pageList = [HomePage(), CategoryPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XianYu-Button"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, //当前选中的按钮
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
            print(index);
          });
        },
        iconSize: 36.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new_sharp),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "分类",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置",
          ),
        ],
      ),
    );
  }
}
