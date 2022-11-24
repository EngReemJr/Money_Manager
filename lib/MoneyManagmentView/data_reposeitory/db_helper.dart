import 'dart:developer';
import 'dart:io';

import 'package:helloworld/MoneyManagmentView/models/balance.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/expense.dart';
import '../models/income.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();

  initDatabase() async {
    database = await createDatabaseConnection();
  }

  Future<Database> createDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;

    return openDatabase('$folderPath/money.db', version: 1,
        onCreate: (db, version) {
      try {
        db.execute('''CREATE TABLE balance(
            account_ID INTEGER PRIMARY KEY AUTOINCREMENT, 
            total Double, 
            currency INTEGER);''');
        db.execute('''
            Create Table expense (
expense_ID INTEGER PRIMARY KEY AUTOINCREMENT,
expense_Amount Double,
Categoery INTEGER,
date DATE,
comment TEXT,
account_ID INTEGER references balance
);''');
        db.execute('''
            Create Table income (
income_ID INTEGER PRIMARY KEY AUTOINCREMENT,
income_Amount FLOAT,
categoery INTEGER,
date DATE,
comment TEXT,
account_ID INTEGER references balance
);
            
            ''');
      } catch (e) {
        print(e);
      }
    });
  }

  Future<int> insertNewRow(dynamic dataModel, String tableName) async {
    int i = await database.insert(tableName, dataModel.toMap());
  
    return i;
  }

  Future<List<dynamic>> getAllRows(String tableName) async {
    List<Map<String, dynamic>> data = await database.query(tableName);
    if (tableName == 'balance') {
      return data.map((e) => BalanceModel.fromMap(e)).toList();
    } else if (tableName == 'expense') {
      return data.map((e) => ExpenseModel.fromMap(e)).toList();
    } else {
      return data.map((e) => IncomeModel.fromMap(e)).toList();
    }
  }

/*
  Future<int> deleteTask(TaskModel taskModel) async {
    int count = await database
        .delete(tableName, where: 'id=?', whereArgs: [taskModel.id]);
    return count;
  }
*/
  updateBalance(BalanceModel balanceModel, num newValue) async {
    database.update('balance', {'total': newValue},
        where: 'account_ID=?', whereArgs: [balanceModel.account_ID]);
  }
}
