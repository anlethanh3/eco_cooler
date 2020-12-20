import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:tannhiet/common/locale.dart';
import 'package:tannhiet/model/todo.dart';

class Helper {
  final Locale locale;

  Helper(this.locale);

  final key = 'data';
  ToDo todo = ToDo(works: []);

  Future<void> load() async {}

  Future<void> save() async {}

  Future<void> clear() async {}

  String moneyFormat(double value) {
    return FlutterMoneyFormatter(
      amount: value,
      settings: MoneyFormatterSettings(
          symbol: 'VNĐ',
          thousandSeparator: ',',
          decimalSeparator: '.',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short),
    ).output.symbolOnRight;
  }
}
