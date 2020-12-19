import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/common/locale.dart';
import 'package:tannhiet/model/todo.dart';

class Helper {
  final Locale locale;

  Helper(this.locale);
  final key = 'data';
  ToDo todo = ToDo(works: []);

  Future<void> load() async {
  }

  Future<void> save() async {
  }

  Future<void> clear() async {
  }
}
