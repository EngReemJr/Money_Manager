import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/providers/money_provider.dart';
import 'package:provider/provider.dart';

import '../../data/Categories.dart';
import '../../data/dummy_data.dart';
import '../../models/CategoriesChoice.dart';
import '../../models/expense.dart';
import '../../models/income.dart';
import '../../models/screenArgument.dart';
import '../Screen/CategoryScreen.dart';
import '../Screen/calculater.dart';
import 'SelectCategory.dart';
import 'app_router.dart';

class NewExpenseOrIncome extends StatefulWidget {
  late String? type;
  NewExpenseOrIncome(this.type);
  @override
  State<NewExpenseOrIncome> createState() => _NewExpenseOrIncomeState(type);
}

class _NewExpenseOrIncomeState extends State<NewExpenseOrIncome> {
  late String? type;
  _NewExpenseOrIncomeState(this.type);
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int lettersCounter = 0;
  int category_ID = 0;
  var selectedDate;
  late DateTime today;
  void initState() {
    // TODO: implement initState
    super.initState();

    today = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != today) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month, picked.day);

        //  selectedDate = DateTime.parse(picked.day.toString()+"-"+picked.month.toString()+'-'+picked.year.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if (args.title == 'Selected category') {
      category_ID = args.message;
    }
    return Consumer<MoneyProvider>(builder: (context, provider, x) {
      return SingleChildScrollView(
          child: Container(
              height: 1500.h,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Center(
                    child: Row(children: [
                  SizedBox(width: 108.w),
                  //متغيرة حسب المستخدم البيانات المخزنة في قاعدة البيانات

                  Ink(
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => Calculater(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "image/Calculater.png",
                            fit: BoxFit.cover,
                            height: 80.h,
                          ))),

                  Text(
                      ' ' +
                          currency[provider.balances
                                  .elementAt(provider.selectedbalance!)!
                                  .currency!]
                              .currencyCode,
                      style: new TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Noto Naskh Arabic",
                          fontSize: 32.0)),
                  Expanded(
                      child: Form(
                          key: _formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: controller1,
                            validator: (value) {
                              if (value == null) {
                                // controller.text = '0';
                                return 'أدخل مبلغ المعاملة';
                              }
                            },
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Noto Naskh Arabic",
                                fontSize: 28.0),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 50, 136, 99)),
                              ),
                            ),
                          ))),
                  SizedBox(width: 176.w),
                ])),
                SizedBox(height: 63.h),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('حساب\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 138, 139, 131),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 22.0)),
                    Text('رئيسي\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 50, 136, 99),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 28.0)),
                    Text('الفئات\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 138, 139, 131),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 22.0)),
                    SizedBox(
                        height: 443.h,
                        child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2.0,
                            children: List.generate(
                                type == 'Expense'
                                    ? Expensechoices.length - 6
                                    : Incomechoices.length, (index) {
                              if ((index == 3 && type == 'Expense')) {
                                return Ink(
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  CategoryScreen(type!),
                                            ),
                                          );
                                          provider.setBackColor();
                                        },
                                        child: Center(
                                          child: SelectCard(
                                              choice: Choice(
                                                  title: 'أكثر',
                                                  icon: 'image/plus.png',
                                                  colorsValues: {
                                                    'r': 164,
                                                    'g': 183,
                                                    'b': 177
                                                  }),
                                              pageName: 'default'),
                                        )));
                              }
                              if (type == 'Expense') {
                                return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color.fromARGB(
                                            255,
                                            provider.ExpenseColor[index]['r']!,
                                            provider.ExpenseColor[index]['g']!,
                                            provider.ExpenseColor[index]
                                                ['b']!)),
                                    child: Ink(
                                        child: InkWell(
                                      onTap: () {
                                        category_ID = index;
                                        provider.changeBackColor(
                                            Expensechoices[index]
                                                .colorsValues['r']!,
                                            Expensechoices[index]
                                                .colorsValues['g']!,
                                            Expensechoices[index]
                                                .colorsValues['b']!,
                                            index);
                                      },
                                      child: Center(
                                        child: SelectCard(
                                            choice: Expensechoices[index],
                                            pageName: 'default'),
                                      ),
                                    )));
                              } else {
                                if (index == 3 && type == 'Income') {
                                  return Center();
                                } else if (index == 4 && type == 'Income') {
                                  return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Color.fromARGB(
                                              255,
                                              provider.IncomeColor[index]['r']!,
                                              provider.IncomeColor[index]['g']!,
                                              provider.IncomeColor[index]
                                                  ['b']!)),
                                      child: Ink(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        CategoryScreen(type!),
                                                  ),
                                                );
                                                provider.setBackColor();
                                              },
                                              child: Center(
                                                child: SelectCard(
                                                    choice: Choice(
                                                        title: 'أكثر',
                                                        icon: 'image/plus.png',
                                                        colorsValues: {
                                                          'r': 164,
                                                          'g': 183,
                                                          'b': 177
                                                        }),
                                                    pageName: 'default'),
                                              ))));
                                } else {
                                  return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Color.fromARGB(
                                              255,
                                              provider.IncomeColor[index]['r']!,
                                              provider.IncomeColor[index]['g']!,
                                              provider.IncomeColor[index]
                                                  ['b']!)),
                                      child: Ink(
                                          child: InkWell(
                                              onTap: () {
                                                category_ID = index;
                                                provider.changeIncomeBackColor(
                                                    Incomechoices[index]
                                                        .colorsValues['r']!,
                                                    Incomechoices[index]
                                                        .colorsValues['g']!,
                                                    Incomechoices[index]
                                                        .colorsValues['b']!,
                                                    index);
                                              },
                                              child: Center(
                                                child: SelectCard(
                                                    choice:
                                                        Incomechoices[index],
                                                    pageName: 'default'),
                                              ))));
                                }
                              }
                            }))),
                    SizedBox(
                        child: Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: Image.asset(
                                      'image/Calender.png',
                                      height: 60.h,
                                      width: 63.w,
                                    ))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 130.h,
                                        width: 160.w,
                                        child: Center(
                                            child: Text(
                                          today.month!.toString() +
                                              '/' +
                                              today.day!.toString() +
                                              '\nالأخير',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 138, 139, 131),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Noto Nask Arabic',
                                              fontSize: 18),
                                        ))))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {
                                      selectedDate = selectedDate = DateTime(
                                          today.year,
                                          today.month,
                                          today.day - 1);
                                    },
                                    child: Container(
                                        height: 130.h,
                                        width: 160.w,
                                        child: Center(
                                            child: Text(
                                                today.month!.toString() +
                                                    '/' +
                                                    (today.day! - 1)
                                                        .toString() +
                                                    '\nأمس',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 138, 139, 131),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'Noto Nask Arabic',
                                                    fontSize: 18)))))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {
                                      selectedDate = selectedDate = DateTime(
                                          today.year, today.month, today.day);
                                    },
                                    child: Container(
                                        height: 130.h,
                                        width: 160.w,
                                        child: Center(
                                            child: Text(
                                          today.month!.toString() +
                                              '/' +
                                              today.day!.toString() +
                                              '\nاليوم',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 138, 139, 131),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Noto Nask Arabic',
                                              fontSize: 18),
                                        ))))),
                          ],
                        ),
                        width: double.infinity),
                    Text('تعليق',
                        style: TextStyle(
                            fontFamily: 'Noto Nask Arabic', fontSize: 18)),
                    Container(
                        margin: EdgeInsets.all(25),
                        child: Form(
                            child: TextFormField(
                          controller: controller2,
                          onChanged: (value) {
                            lettersCounter = value.length;
                            setState(() {});
                          },
                          textAlign: TextAlign.end,
                          // controller: controller2,
                          style: new TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "Noto Naskh Arabic",
                              fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: 'تعليق',
                            hintStyle: TextStyle(
                                fontFamily: "Noto Naskh Arabic",
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 204, 205, 197)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 158, 175, 176)),
                            ),
                          ),
                        ))),
                    Row(
                      children: [
                        Text('       ' + lettersCounter.toString() + '/4096'),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                    Expanded(child: SizedBox()),
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
                              primary: Color.fromARGB(
                                  255, 253, 194, 42), // Background color
                              // Text Color (Foreground color)
                            ),
                            onPressed: () {
                              if (controller1.text.isNotEmpty) {
                                if (type == 'Expense') {
                                  provider.insertNewExpense(ExpenseModel(
                                      expense_amount:
                                          num.parse(controller1.text),
                                      categoery: category_ID,
                                      date: selectedDate.toString(),
                                      comment: controller2.text,
                                      account_ID: provider.balances
                                          .elementAt(provider.selectedbalance!)!
                                          .account_ID));
                                } else {
                                  provider.insertNewIncome(IncomeModel(
                                      income_amount:
                                          num.parse(controller1.text),
                                      categoery: category_ID,
                                      date: selectedDate.toString(),
                                      comment: controller2.text,
                                      account_ID: provider.balances
                                          .elementAt(provider.selectedbalance!)!
                                          .account_ID));
                                }
                                // log(category_ID.toString());
                                provider.getAllIncomes();
                                provider.setBackColor();
                                Navigator.of(context)
                                    .pushReplacementNamed('ExpensesScreen');
                              } else {
                                // DialogExample('Error Empty Text Feild', 'check matter amount text feild').showCustomeDialog();
                              }
                            },
                            child: Text(
                              'إضافة',
                              style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 77, 79, 66),
                                fontFamily: 'Noto Naskh Arabic',
                              ),
                            ),
                          )),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 35.h,
                    )),
                  ],
                ))
              ])));
    });
  }
}
