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
      // 底部导航
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
      //  侧边抽屉显示个人信息
      drawer: Drawer(
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: UserAccountsDrawerHeader(
                  accountName: Text("我是咸鱼"),
                  accountEmail: Text("191369883@qq.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202106%2F16%2F20210616221014_875a8.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1655951852&t=4f79946c719c0cacfed49fc93cb61edb"),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202106%2F16%2F20210616100831_818e8.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1655951852&t=e25f2fb683945a21bff550cb911fce2f"),
                        fit: BoxFit.cover),
                  ),
                  // otherAccountsPictures: <Widget>[
                  //   Image.network(
                  //       "https://www.itying.com/images/flutter/4.png"),
                  //   Image.network(
                  //       "https://www.itying.com/images/flutter/5.png"),
                  // ],
                ),
              ),
            ],
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.home)),
            title: Text("我的空间"),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.people)),
            title: Text("用户中心"),
            onTap: () {
              Navigator.of(context).pop(); //隐藏侧边栏
              Navigator.pushNamed(context, '/user');
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings)),
            title: Text("设置中心"),
          ),
          Divider(),
        ]),
      ),
      // 模拟悬浮按钮
      floatingActionButton: Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              this._currentIndex = 1;
            });
          },
          backgroundColor: this._currentIndex == 1 ? Colors.red : Colors.yellow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
