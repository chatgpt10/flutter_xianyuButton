// 核心库
import 'package:flutter/material.dart';
// 引入页面
import '../pages/Tabs.dart';

// 配置路由
final Map<String, Function> routes = {'/': (context) => Tabs()};

//固定写法 统一处理 路由
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
