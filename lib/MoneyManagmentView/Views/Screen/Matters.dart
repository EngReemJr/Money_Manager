import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/Views/Screen/CategoryScreen.dart';
import 'package:helloworld/MoneyManagmentView/Views/Screen/calculater.dart';
import 'package:helloworld/MoneyManagmentView/Views/Widgets/NewExpenseOrIncome.dart';
import 'package:helloworld/MoneyManagmentView/models/CategoriesChoice.dart';
import 'package:helloworld/MoneyManagmentView/models/screenArgument.dart';
import 'package:provider/provider.dart';

import '../../data/Categories.dart';
import '../../providers/money_provider.dart';
import '../Widgets/MattersCustomeBar.dart';
import '../Widgets/SelectCategory.dart';
import 'Expenses.dart';

class MattersScreen extends StatefulWidget {
  static late TabController tabController;

  @override
  State<MattersScreen> createState() => _MattersScreenState();
}

class _MattersScreenState extends State<MattersScreen>
    with SingleTickerProviderStateMixin {
  initalizeTabController() {
    MattersScreen.tabController = TabController(length: 2, vsync: this);
    MattersScreen.tabController.index = 1;
        MattersScreen.tabController.addListener(() {
           Provider.of<MoneyProvider>(context, listen: false)
     .changeMyTabIndex(MattersScreen.tabController.index);
     
    });

  
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeTabController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    MattersScreen.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MattersBarScreen(),
        body: TabBarView(controller: MattersScreen.tabController, children: [
          NewExpenseOrIncome('Income'),
          NewExpenseOrIncome('Expense'),
        ]));
  }
}
