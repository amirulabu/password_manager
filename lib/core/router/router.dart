import 'package:flutter/material.dart';
import 'package:password_manager/core/model/info.dart';
import 'package:password_manager/ui/view/new_item.dart';
import 'package:password_manager/ui/view/user_info.dart';

class NavRouter {
  static const String newitem = 'newitem';
  static const String userinfo = 'userinfo';

  static MaterialPageRoute _pageRoute(Widget page, settings) {
    return MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
        settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newitem:
        return _pageRoute(NewItem(), settings);
      case userinfo:
        return _pageRoute(
            UserInfoView(info: (settings.arguments as Info)), settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
