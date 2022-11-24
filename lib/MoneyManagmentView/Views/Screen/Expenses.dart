import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/Views/Widgets/custome_appbar.dart';
import 'package:helloworld/MoneyManagmentView/models/expense.dart';
import 'package:provider/provider.dart';

import '../../data/Categories.dart';
import '../../providers/money_provider.dart';
import '../Widgets/ViewData.dart';

class ExpensesScreen extends StatefulWidget {
  static late TabController tabController;
  static GlobalKey<ScaffoldState> key1 = GlobalKey();
  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();

  initalizeTabController() {
    ExpensesScreen.tabController = TabController(length: 2, vsync: this);
    ExpensesScreen.tabController.index = 1;
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
    ExpensesScreen.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {
      return Scaffold(
          key: ExpensesScreen.key1, // set it here
          endDrawer: buildProfileDrawer(),
          appBar: customAppbar(),
          body: 
          Container(
            height: 800.h,
            child: 
          
          provider.expenses.isNotEmpty
              ? 
            Column(
                children: [
              Expanded(
                 // height: 443.h,
                  child:
                      ListView.builder(
                          itemCount: ExpensesScreen.tabController.index == 1
                              ? provider.expenses
                                  .where((element) =>
                                      element.account_ID ==
                                      provider.balances
                                          .elementAt(provider.selectedbalance!)!
                                          .account_ID!)
                                  .length
                              : provider.incomes
                                  .where((element) =>
                                      element.account_ID ==
                                      provider.balances
                                          .elementAt(provider.selectedbalance!)!
                                          .account_ID)
                                  .length,
                          itemBuilder: (context, index) {

                            return ViewData(
                                'expenses',
                                provider.expenses
                                    .where((element) =>
                                        element.account_ID ==
                                        provider.balances
                                            .elementAt(
                                                provider.selectedbalance!)!
                                            .account_ID)
                                    .toList()[index]
                                    .toMap()

                                );
                          }))
               ]) :
              SizedBox(child: Text('n')))
    );});
  }
}

buildProfileDrawer() {
  return Drawer(
    backgroundColor: Color.fromARGB(255, 49, 134, 101),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 57, 106, 85),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('image/AvatarProfilePic.png'),
          ),
          accountEmail: Text('Reem@gmail.com'), accountName: Text('Reem'),
          // accountName: Text('Reem'),
        ),
        Expanded(
            child: ListTile(
          title: Text('جدول'),
          leading: Icon(Icons.list),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(0);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('حسابات'),
          leading: Icon(Icons.done),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(1);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('الرسوم البيانية'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('الفئات'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('المدفوعات الدورية'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('تذكير'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('عملة'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('الإعدادات'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('شارك مع الأصدقاء'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('قيم التطبيق'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('تواصل مع فريق الدعم'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        ))
      ],
    ),
  );
}
