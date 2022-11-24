import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screen/Expenses.dart';
import '../Screen/Matters.dart';

class MattersBarScreen extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 70.h,
            child: Row(
              children: [
                Expanded(child: Center()),
                Center(
                  child: Text('إضافة معاملات     ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Noto Naskh Arabic',
                      )),
                ),
                IconButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .popAndPushNamed('ExpensesScreen');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => ExpensesScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          TabBar(
            indicatorColor: Colors.white,
            controller: MattersScreen.tabController!,
            labelStyle: const TextStyle(
              fontSize: 18.0,
              fontFamily: 'Noto Naskh Arabic',
              // foreground: Color.fromARGB(255, 49, 134, 101),
            ),
            tabs: [
              Tab(
                text: 'دخل',
              ),
              Tab(
                text: 'نفقات',
              ),
            ],
          )
        ],
      ),
      // height: 276.h,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 99, 159, 134),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                50,
              ),
              bottomLeft: Radius.circular(
                50,
              ))),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 174.h);
}
