import 'package:flutter/material.dart';

import '../models/CategoriesChoice.dart';

List<Choice> Expensechoices = <Choice>[
  Choice(
      title: 'عائلة',
      icon: 'image/Family.png',
      colorsValues: {'r': 255, "g": 67, "b": 66}),
  Choice(
      title: 'اكتشف - حل',
      icon: 'image/Muscles.png',
      colorsValues: {'r': 131, "g": 210, "b": 91}),
  Choice(
      title: 'وسائل نقل',
      icon: 'image/Bus.png',
      colorsValues: {'r': 77, "g": 161, "b": 234}),
  Choice(
      title: 'تعليم',
      icon: 'image/Hat.png',
      colorsValues: {'r': 238, "g": 76, "b": 125}),
  Choice(
      title: 'الهدايا',
      icon: 'image/gift.png',
      colorsValues: {'r': 154, "g": 182, "b": 141}),
  Choice(
      title: 'البقالة',
      icon: 'image/food.png',
      colorsValues: {'r': 110, "g": 211, "b": 203}),
  Choice(
      title: 'فراغ',
      icon: 'image/Wallet.png',
      colorsValues: {'r': 133, "g": 211, "b": 91}),
  Choice(
      title: 'منزل',
      icon: 'image/house.png',
      colorsValues: {'r': 75, "g": 161, "b": 238}),
  Choice(
      title: 'كافيه',
      icon: 'image/fork.png',
      colorsValues: {'r': 237, "g": 202, "b": 72}),
  Choice(
      title: 'خلق',
      icon: 'image/plus.png',
      colorsValues: {'r': 164, 'g': 183, 'b': 177}),
  Choice(
      title: 'آخر',
      icon: 'image/؟.png',
      colorsValues: {'r': 245, "g": 66, "b": 65}),
  Choice(
      title: 'صحة',
      icon: 'image/Heart.png',
      colorsValues: {'r': 255, "g": 68, "b": 66})
];

List<Choice> Incomechoices = <Choice>[
  Choice(title: 'الراتب', icon: 'image/Salary.png',
      // colorsValues: {'r': 255, "g": 67, "b": 66}),
      colorsValues: {'r': 77, "g": 161, "b": 234}),
  Choice(
      title: 'هدية',
      icon: 'image/gift2.png',
      colorsValues: {'r': 238, "g": 76, "b": 125}),
  Choice(
      title: 'اهتمام',
      icon: 'image/care.png',
      colorsValues: {'r': 133, "g": 211, "b": 91}),
  // Choice(title: 'أكثر', icon: '', colorsValues: {'r': 164, 'g': 183, 'b': 177}),
  Choice(title: ' ', icon: ' ', colorsValues: {'r': 255, 'g': 255, 'b': 255}),
  Choice(
      title: 'أكثر',
      icon: 'image/plus.png',
      colorsValues: {'r': 164, 'g': 183, 'b': 177}),
  Choice(
      title: 'آخر',
      icon: 'image/other.png',
      colorsValues: {'r': 133, "g": 211, "b": 91}),
];
