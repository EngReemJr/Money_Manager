import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/dummy_data.dart';
import '../Widgets/CurrencyWidget.dart';
import 'Account.dart';

class Currency extends StatefulWidget {
  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  TextEditingController controller = TextEditingController();
  late int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 71.h),
        Center(
            child: Text(
          'اختر عملتك الافتراضية',
          style: TextStyle(
            fontSize: 35,
            //color: Color.fromARGB(255, 77, 79, 66),
            fontFamily: 'Noto Naskh Arabic',
          ),
        )),
        Container(
            margin: EdgeInsets.all(25),
            child: Form(
                child: TextFormField(
              textAlign: TextAlign.end,
              controller: controller,
              style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Noto Naskh Arabic",
                  fontSize: 28.0),
              decoration: InputDecoration(
                hintText: 'بحث',
                hintStyle: TextStyle(
                    fontFamily: "Noto Naskh Arabic",
                    fontSize: 28.0,
                    color: Color.fromARGB(255, 204, 205, 197)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 163, 173, 165),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Color.fromARGB(255, 158, 175, 176)),
                ),
              ),
            ))),
        Expanded(
            child: ListView.builder(
                itemCount: currency.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      trailing: Text(currency[index].currencyName,
                          style: TextStyle(
                              fontFamily: "Noto Naskh Arabic",
                              fontSize: 24.0,
                              color: Color.fromARGB(255, 36, 37, 31))),
                      leading: Text(currency[index].currencyCode,
                          style: TextStyle(
                              fontFamily: "Noto Naskh Arabic",
                              fontSize: 24.0,
                              color: Color.fromARGB(255, 36, 37, 31))),
                      tileColor:
                          selectedIndex == index ? Color(0xff58e7a0) : null,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      });
                })),
        Center(
            child: Container(
              margin: EdgeInsets.only(top: 47),
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
                //  Navigator.of(context).pushNamed('AccountScreen',[selectedIndex]);
                Navigator.of(context).pushReplacement(
   MaterialPageRoute(
     builder: (_) => AccountScreen(selectedIndex),
   ),
 );
               
                },
                child: Text(
                  'التالي',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 77, 79, 66),
                    fontFamily: 'Noto Naskh Arabic',
                  ),
                ),
              )),
        )),
        SizedBox(
          height: 35.h,
        )
      ]),
    );
  }
}
