import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helloworld/MoneyManagmentView/providers/money_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/Categories.dart';
import '../../data/dummy_data.dart';
import '../../models/expense.dart';

class ViewData extends StatelessWidget {
  late String type;
  late Map matterModel;
 // ViewData(this.type, this.matterModel);
  ViewData(String type, Map matterModel) {
    this.type = type;
    this.matterModel = matterModel;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {
      return Container(
        height: 66.h,
        margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0, // s
                  spreadRadius: 5.0, //e
                )
              ]),
          child: type == 'expenses'
              ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Center(
                    child: Text(currency[provider.balances.elementAt(provider.selectedbalance!)!.currency!].symbol+matterModel['expense_amount'].toString()),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 87.w,
                  )),
                  Center(
                    child: Text((matterModel['expense_amount']/provider.totalExpense*100).toInt().toString()+'%'),
                  ),
Expanded(child: Text(Expensechoices[matterModel['categoery']].title,
textAlign: TextAlign.end,))
                ])
              : Row());
    });
  }
}
