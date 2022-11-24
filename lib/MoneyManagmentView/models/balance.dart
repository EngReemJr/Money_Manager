import 'dart:convert';

import 'package:flutter/material.dart';

class BalanceModel {
  int? account_ID;
  num? total;
  int? currency;

  BalanceModel({
    this.account_ID,
    this.total,
    this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      
      'total': total,
      'currency':currency
    };
  }

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      account_ID: map['account_ID']?.toInt(),
      total: map['total'],
      currency: map['currency'],
    );
  }
}
