import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/providers/money_provider.dart';
import 'package:provider/provider.dart';

import '../../data/Categories.dart';
import '../../models/CategoriesChoice.dart';
import '../Screen/Expenses.dart';
import '../Widgets/CustomeCategoriesAppBar.dart';
import '../Widgets/SelectCategory.dart';

class CategoryScreen extends StatelessWidget {
  late String type = '';
  CategoryScreen(this.type);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {
      return myPage(provider, type);
    });
  }
}

class myPage extends StatelessWidget {
  late String type = '';
  static int categoery_index = 0;
  late MoneyProvider myProvider;
  myPage(this.myProvider, this.type);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: CsutomeCategoryAppBar('إضافة فئة', 'MattersScreen'),
      body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 8.0,
          children: List.generate(
              //(Expensechoices.length, (index) {
              //List.generate(
              type == 'Expense' ? Expensechoices.length : Incomechoices.length,
              (index) {
            if (type == 'Expense') {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(
                          255,
                          myProvider.ExpenseColor[index]['r']!,
                          myProvider.ExpenseColor[index]['g']!,
                          myProvider.ExpenseColor[index]['b']!)),
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        categoery_index = index;
                        myProvider.changeBackColor(
                            Expensechoices[index].colorsValues['r']!,
                            Expensechoices[index].colorsValues['g']!,
                            Expensechoices[index].colorsValues['b']!,
                            index);
                      },
                      child: Center(
                          child: SelectCard(
                              choice: Expensechoices[index],
                              pageName: 'default')),
                    ),
                  ));
            } else if ((index == 3 && type == 'Income')) {
              return Container();
            } else {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(
                          255,
                          myProvider.ExpenseColor[index]['r']!,
                          myProvider.ExpenseColor[index]['g']!,
                          myProvider.ExpenseColor[index]['b']!)),
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        categoery_index = index;
                        myProvider.changeBackColor(
                            Incomechoices[index].colorsValues['r']!,
                            Incomechoices[index].colorsValues['g']!,
                            Incomechoices[index].colorsValues['b']!,
                            index);
                      },
                      child: Center(
                          child: SelectCard(
                              choice: Incomechoices[index],
                              pageName: 'Main Income')),
                    ),
                  ));

              ;
            }
          })),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 831);
}
