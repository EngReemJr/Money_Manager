import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/Views/Screen/splash_Screen.dart';

import 'StartScreen.dart';

class MoneyManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Splashscreen();
    // navigatorKey: AppRouter.navigationKey,
    // routes: {
    //   '/': (context) => WelcomeScreen(),
    //   'page1': (context) => Page1(),
    //   'newTaskScreen': (context) => NewTaskScreen(
    //       (ModalRoute.of(context)!.settings.arguments) as Function),
    //   'page2': (context) => Page2(
    //       ModalRoute.of(context)?.settings.arguments.toString() ?? '')
    // },
    // onGenerateRoute: (RouteSettings settings) {
    //   String routeName = settings.name ?? '';
    //   dynamic routeArguments = settings.arguments;
    //   switch (routeName) {
    //     case "screen2":
    //       return MaterialPageRoute(builder: (context) {
    //         return Page2(routeArguments.toString());
    //       });
    //   }
    // },
    // onUnknownRoute: (RouteSettings RouteSettings) {
    //   return MaterialPageRoute(builder: (context) {
    //     return Scaffold(
    //         backgroundColor: Colors.red,
    //         body: Center(
    //           child: Text('Route ${RouteSettings.name ?? ''} not found'),
    //         ));
    //   });
    // },
    // localizationsDelegates: context.localizationDelegates,
    // supportedLocales: context.supportedLocales,
    // locale: context.locale,
  }
}
