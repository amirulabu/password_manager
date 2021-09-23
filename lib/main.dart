import 'package:flutter/material.dart';
import 'package:password_manager/core/locator/locator.dart';
import 'package:password_manager/core/router/router.dart';
import 'package:password_manager/core/service/navigator/navigation_service.dart';
import 'package:password_manager/ui/view/landing_screen.dart';

void main() {
  setupLocator();
  runApp(
    PasswordManagerApp(),
  );
}

class PasswordManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: NavRouter.generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
      home: LandingScreen(),
    );
  }
}
