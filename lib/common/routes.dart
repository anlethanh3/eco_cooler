import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/screen/splash.dart';
import 'package:tannhiet/screen/home.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String add = "/add";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return Container();
    });
    router.define(root,
        handler: Handler(
            handlerFunc: (context, params) => Splash(),
            type: HandlerType.route));
    router.define(home,
        handler: Handler(
            handlerFunc: (context, params) => Home(), type: HandlerType.route));
  }
}
