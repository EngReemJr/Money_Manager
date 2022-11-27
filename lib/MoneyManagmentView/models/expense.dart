import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class ExpenseModel {
  int? expense_ID;
  late num expense_amount;
  late int categoery;
  late var date;
  String? comment;
  int? account_ID;

  ExpenseModel(
      {this.expense_ID,
      required this.expense_amount,
     required this.categoery,
      this.date,
      this.comment,
      this.account_ID});

  Map<String, dynamic> toMap() {
  
 
    return {
      'expense_Amount': expense_amount,
      'Categoery': categoery,
      'date': date,
      'comment': comment,
      'account_ID': account_ID
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
  

    return ExpenseModel(
        expense_ID: map['expense_ID'],
        expense_amount:  map['expense_Amount'],
        categoery: map['Categoery'],
        date: map['date'],
        comment: map['comment'],
        account_ID: map['account_ID']);
  }
}
