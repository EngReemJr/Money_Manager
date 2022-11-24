import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:helloworld/MoneyManagmentView/Views/Screen/StartScreen.dart';
import 'package:helloworld/MoneyManagmentView/providers/money_provider.dart';
import 'package:provider/provider.dart';

import 'MoneyManagmentView/Views/Screen/Account.dart';
import 'MoneyManagmentView/Views/Screen/CategoryScreen.dart';
import 'MoneyManagmentView/Views/Screen/Currency.dart';
import 'MoneyManagmentView/Views/Screen/Expenses.dart';
import 'MoneyManagmentView/Views/Screen/MainScreen.dart';
import 'MoneyManagmentView/Views/Screen/Matters.dart';
import 'MoneyManagmentView/data_reposeitory/db_helper.dart';
import 'MoneyManagmentView/data_reposeitory/sharedPrefernce.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  await FileHelper.initSp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<MoneyProvider>(
        create: (context) {
          return MoneyProvider();
        },
        child: AppInit());
  }
}

class AppInit extends StatefulWidget {
  @override
  State<AppInit> createState() => _MyAppState();
}

class _MyAppState extends State<AppInit> {
  String type = '';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(625, 1151),
        builder: (context, child) {
          return MaterialApp(
            home: MoneyManagement(),
            debugShowCheckedModeBanner: false,
            routes: {
              'StartScreen': (context) => StartScreen(),
              'CurrencyScreen': (context) => Currency(),
              //'AccountScreen': (context) => AccountScreen(),
              'ExpensesScreen': (context) => ExpensesScreen(),
              'CategoryScreen': (context) => CategoryScreen(type),
              'MattersScreen': (context) => MattersScreen()
            },
          );
          //);
        });
  }
}
