import 'dart:convert';

import 'package:flutter/material.dart';

class IncomeModel {
  int? income_ID;
  num? income_amount;
  int? categoery;
  late var date;
  String? comment;
  int? account_ID;

  IncomeModel(
      {this.income_ID,
      this.income_amount,
      this.categoery,
      this.date,
      this.comment,
      this.account_ID});

  Map<String, dynamic> toMap() {
    return {
      'income_Amount': income_amount,
      'categoery': categoery,
      'date': date,
      'comment': comment,
      'account_ID': account_ID
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
        income_ID: map['income_ID']?.toInt(),
        income_amount: map['income_Amount'],
        categoery: map['categoery'],
        date: map['date'],
        comment:map['comment'],
        account_ID: map['account_ID']);
  }
}
