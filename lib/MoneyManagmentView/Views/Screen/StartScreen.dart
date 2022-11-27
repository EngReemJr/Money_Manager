//import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 135.h),
        Center(
          child: Container(
            width: 300.w,
            height: 300.h,
            decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(109),
              color: Color.fromARGB(255, 249, 250, 244),
              image: DecorationImage(
                image: AssetImage('image/DollarSign2.png'),
                
                
              ),
            ),
          ),
        ),
        SizedBox(
          height: 136.h,
        ),
        Text(
          ' ! مرحباً بك في مدير المال ',
          style: TextStyle(
            fontSize: 31,
            color: Color.fromARGB(255, 32, 126, 89),
            fontFamily: 'Noto Naskh Arabic',
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        Center(
            child: Text(
          'مديرالمال - تطبيق لتتبع الإيرادات',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 77, 79, 66),
            fontFamily: 'Noto Naskh Arabic',
          ),
        )),
        Center(
            child: Text(
          'والمصروفات بسهولة',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 77, 79, 66),
            fontFamily: 'Noto Naskh Arabic',
          ),
        )),
        SizedBox(
          height: 131.h,
        ),
        Center(
            child: Container(
          width: 409.w,
          height: 89.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41),
              color: Color.fromARGB(255, 249, 250, 244),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 228, 234, 224),
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(41),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:
                      Color.fromARGB(255, 253, 194, 42), // Background color
                  // Text Color (Foreground color)
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('CurrencyScreen');
                },
                child: Text(
                  'بداية',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 77, 79, 66),
                    fontFamily: 'Noto Naskh Arabic',
                  ),
                ),
              )),
        ))
      ]),
    ));
  }
}
