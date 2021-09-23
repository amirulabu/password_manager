import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop({dynamic result}) {
    return _navigationKey.currentState!.pop(result);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  /// if removeUntilNamed is null,
  /// remove all screen and make [pushNamed] screen become root
  Future<dynamic> pushAndRemoveUntil(String pushNamed,
      {String? removeUntilNamed, Object? arguments}) async {
    if (removeUntilNamed != null) {
      print('not null');
      return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        pushNamed,
        ModalRoute.withName(removeUntilNamed),
        arguments: arguments,
      );
    } else {
      return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        pushNamed,
        (route) => false,
        arguments: arguments,
      );
    }
  }

  void popUntilFirstRoute() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _navigationKey.currentState!.popUntil((route) => route.isFirst);
    });
  }

  void navigateWithTransparent(Widget routeName) {
    _navigationKey.currentState!.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => routeName,
      ),
    );
  }
}
