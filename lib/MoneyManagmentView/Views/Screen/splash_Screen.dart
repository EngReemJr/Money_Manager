import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/Views/Screen/Expenses.dart';
import 'package:helloworld/MoneyManagmentView/providers/money_provider.dart';
import 'package:provider/provider.dart';

import '../../data_reposeitory/sharedPrefernce.dart';
import 'StartScreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  navigationMethod() async {
    await Future.delayed(Duration(seconds: 2));
  }

  _SplashscreenState() {
    makeDelay();
  }
  navigateUser() async{
    bool isFirstTime = FileHelper.getFirstTime();
  
    if (isFirstTime) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return StartScreen();
      }));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return ExpensesScreen();
      }));
    }
  }

  makeDelay() async {
    await Future.delayed(Duration(seconds: 3));
    navigateUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 137, 96),
      body: Center(
        child: Container(
          width: 218.w,
          height: 223.h,
          decoration: BoxDecoration(
            //  borderRadius: BorderRadius.circular(109),
            color: Color.fromARGB(255, 249, 250, 244),
            image: DecorationImage(
              image: AssetImage('image/Dollarsign3.png'),
              fit: BoxFit.cover,
              //scale: 1
            ),
          ),
        ),
      ),
    );
  }
}
