import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helloworld/MoneyManagmentView/models/ChartData.dart';

import '../data/Categories.dart';
import '../data_reposeitory/db_helper.dart';
import '../models/CategoriesChoice.dart';
import '../models/balance.dart';
import '../models/expense.dart';
import '../models/income.dart';

class MoneyProvider extends ChangeNotifier {
  List ExpenseColor = List<Map<String, int>>.filled(
      Expensechoices.length, {'r': 255, 'g': 255, 'b': 255},
      growable: true);
  List IncomeColor = List<Map<String, int>>.filled(
      Incomechoices.length, {'r': 255, 'g': 255, 'b': 255},
      growable: true);

  late List<ChartData> expenseChartData;
  late List<ChartData> incomeChartData;

  late double totalExpense = 0;
  late double totalIncome = 0;
  MoneyProvider() {
    getAllBalances();

    getAllExpenses();
    getAllIncomes();
  }
  int? selectedbalance = 0;

  bool isDarkMode = false;
  int red = 255;
  int green = 255;
  int blue = 255;
  changeIsDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  changeBackColor(int r, int g, int b, int index) {
    ExpenseColor = List<Map<String, int>>.filled(
        Expensechoices.length, {'r': 255, 'g': 255, 'b': 255});
    red = r;
    green = g;
    blue = b;
    ExpenseColor[index] = {'r': red, 'g': green, 'b': blue};
    notifyListeners();
  }
   changeIncomeBackColor(int r, int g, int b, int index) {
   IncomeColor = List<Map<String, int>>.filled(
       Incomechoices.length, {'r': 255, 'g': 255, 'b': 255});
   red = r;
   green = g;
   blue = b;
   IncomeColor[index] = {'r': red, 'g': green, 'b': blue};
   notifyListeners();
 }

  setBackColor() {
    ExpenseColor = List<Map<String, int>>.filled(
        Expensechoices.length, {'r': 255, 'g': 255, 'b': 255});
    notifyListeners();
  }

  TextEditingController textEditingController = TextEditingController();

  List<dynamic> balances = [];
  //List<dynamic> balances = List<dynamic>.filled(0, {}, growable: true);
  List<dynamic> expenses = [];
  List<dynamic> incomes = [];
  getAllBalances() async {
    balances = await DbHelper.dbHelper.getAllRows('balance');
    this.selectedbalance = balances.length - 1;
    notifyListeners();
  }

  setSelectedBalance(int index) {
    BalanceModel bm = balances.elementAt(index);
    balances.removeAt(index);
    balances.add(bm);
    notifyListeners();
  }

  getAllExpenses() async {
    expenses = await DbHelper.dbHelper.getAllRows('expense');
    notifyListeners();
  }

  List<ChartData> getExpenseChart() {
    totalExpense = 0;
    expenses
        .where((element) =>
            element.account_ID ==
            balances.elementAt(selectedbalance!)!.account_ID!)
        .toList()
        .forEach((element) {
      totalExpense = totalExpense + element.expense_amount;
    });
    expenseChartData = expenses
        .where((element) =>
            element.account_ID ==
            balances.elementAt(selectedbalance!)!.account_ID!)
        .map((e) {
      //  return (e.expense_amount / totalExpense) ;
      return ChartData(
          '',
          e.expense_amount,
          Color.fromARGB(
              255,
              Expensechoices[e.categoery].colorsValues['r']!,
              Expensechoices[e.categoery].colorsValues['g']!,
              Expensechoices[e.categoery].colorsValues['b']!));
    }).toList();

    // notifyListeners();
    return expenseChartData;
  }

  getAllIncomes() async {
    incomes = await DbHelper.dbHelper.getAllRows('income');

    notifyListeners();
  }

  insertNewBalance(BalanceModel balanceModel) async {
    await DbHelper.dbHelper.insertNewRow(balanceModel, 'balance');
    getAllBalances();
  }

  getExpensePercent(num amount) {
    getExpenseChart();
    return (amount / totalExpense * 100).toInt();
  }

  getIncomePercent(num amount) {
    getIncomeChart();
    return (amount / totalIncome * 100).toInt();
  }

  List<ChartData> getIncomeChart() {
    totalIncome = 0;
    incomes
        .where((element) =>
            element.account_ID ==
            balances.elementAt(selectedbalance!)!.account_ID!)
        .toList()
        .forEach((element) {
      totalIncome = totalIncome + element.income_amount;
    });
    incomeChartData = incomes
        .where((element) =>
            element.account_ID ==
            balances.elementAt(selectedbalance!)!.account_ID!)
        .map((e) {
      return ChartData(
          '',
          e.income_amount,
          Color.fromARGB(
              
              255,
              Incomechoices[e.categoery].colorsValues['r']!,
              
               Incomechoices[e.categoery].colorsValues['g']!,
              
               Incomechoices[e.categoery].colorsValues['b']!
              ));
    }).toList();

    // notifyListeners();
    return incomeChartData;
  }

  insertNewIncome(IncomeModel incomeModel) async {
    await DbHelper.dbHelper.insertNewRow(incomeModel, 'income');
    num newValue = (balances.elementAt(selectedbalance!)!.total! +
        incomeModel.income_amount!);
    updateBalance(balances.elementAt(selectedbalance!)!, newValue);
    getAllIncomes();
    getAllBalances();
    getIncomeChart();
    setSelectedBalance(balances.length - 1);
    log(incomeModel.categoery.toString());
  }

  insertNewExpense(ExpenseModel expenseModel) async {
    await DbHelper.dbHelper.insertNewRow(expenseModel, 'expense');
    getAllExpenses();
    getAllBalances();

    num newValue = (balances.elementAt(selectedbalance!)!.total! -
        expenseModel.expense_amount!);
    updateBalance(balances.elementAt(selectedbalance!)!, newValue);
    getAllExpenses();
    getAllBalances();
    setSelectedBalance(balances.length - 1);
  }

  // }

  // deleteTask(TaskModel taskModel) async {
  //   await DbHelper.dbHelper.deleteTask(taskModel);
  //   getAllTasks();
  // }

  updateBalance(BalanceModel balanceModel, num newValue) async {
    await DbHelper.dbHelper.updateBalance(balanceModel, newValue);
    getAllBalances();
  }
}
