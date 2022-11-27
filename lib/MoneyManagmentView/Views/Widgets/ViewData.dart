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
 
  ViewData(String type, Map matterModel) {
    this.type = type;
    this.matterModel = matterModel;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {

      return Container(
        height: 66.h,
        margin: EdgeInsets.only(top: 9,bottom: 9 ,left: 20,right: 20),
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
              ? 
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Center(
                    child: Text(currency[provider.balances.elementAt
                    (provider.selectedbalance!)!.currency!].symbol
                    +matterModel['expense_Amount'].toString()),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 87.w,
                  )),
                  Center(
                    child: 
                    
                    
                    Text((provider.getExpensePercent(
                      matterModel['expense_Amount']).toString()+'%'??'100'),
                  )),
Expanded(child: Row(
 
  children: [Expanded(child: SizedBox()),
    Text(Expensechoices[matterModel['Categoery']].title,
textAlign: TextAlign.end,),
              ]))
                ,
               Container(
                margin: EdgeInsets.only(right: 16,left: 21),
  width: 40.w,
  height: 40.h,
  decoration: BoxDecoration(
	//shape: BoxShape.circle,
  borderRadius: BorderRadius.all(Radius.circular(100)),
	image: DecorationImage(
    
     
	  image: AssetImage(Expensechoices[matterModel['Categoery']].icon),
	  fit: BoxFit.fill
	),
  ),
), 
                ])
              :   Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Center(
                    child: Text(currency[provider.balances.elementAt
                    (provider.selectedbalance!)!.currency!].symbol
                    +matterModel['income_Amount'].toString()),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 87.w,
                  )),
                  Center(
                    child: 
                    
                    
                    Text((provider.getIncomePercent(
                      matterModel['income_Amount']).toString()+'%'??'100'),
                  )),
Expanded(child: Row(
 
  children: [Expanded(child: SizedBox()),
    Text(Incomechoices[matterModel['categoery']].title,
textAlign: TextAlign.end,),
              ]))
                ,
               Container(
                margin: EdgeInsets.only(right: 16,left: 21),
  width: 40.w,
  height: 40.h,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(100)),
	image: DecorationImage(
    
     
	  image: AssetImage(Incomechoices[matterModel['categoery']].icon),
	  fit: BoxFit.fill
	),
  ),
), 
                ]));
    });
  }
}
