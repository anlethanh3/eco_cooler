import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'package:tannhiet/common/helper.dart';
import 'package:tannhiet/common/routes.dart';
import 'package:tannhiet/common/locale.dart';

void main() {
  final injector = Injector();
  final router = FluroRouter();
  final locale = Locale()..load('vn');
  final helper = Helper(locale);
  Routes.configureRoutes(router);
  injector.map((injector) => helper, isSingleton: true);
  injector.map((injector) => router, isSingleton: true);
  injector.map((injector) => locale, isSingleton: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final router = Injector().get<FluroRouter>();
  final locale = Injector().get<Locale>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: locale.appname,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: locale.font,
      ),
      onGenerateRoute: router.generator,
    );
  }
}
