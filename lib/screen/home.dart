import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tannhiet/bloc/home_bloc.dart';
import 'package:tannhiet/common/helper.dart';
import 'package:tannhiet/common/locale.dart';
import 'package:tannhiet/common/routes.dart';
import 'package:tannhiet/custom/carousel.dart';
import 'package:tannhiet/custom/custom_app_bar.dart';
import 'package:tannhiet/custom/footer.dart';
import 'package:tannhiet/custom/intro.dart';
import 'package:tannhiet/custom/product.dart';
import 'package:tannhiet/custom/support.dart';
import 'package:tannhiet/repo/home_repository.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_io/prefer_universal/io.dart';
import 'dart:js' as js;

import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final helper = Injector().get<Helper>();
  final locale = Injector().get<Locale>();
  final router = Injector().get<FluroRouter>();
  final scrollController = ScrollController();
  HomeBloc bloc;
  HomeRepository repo;

  @override
  void initState() {
    super.initState();
    repo = HomeRepository(helper);
    bloc = HomeBloc(repo);
    initHomeState();
  }

  void initHomeState() async {
    await Future.delayed(Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            decoration: TextDecoration.underline,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      child: Builder(
        builder: (context) => RepositoryProvider(
          create: (ctx) => repo,
          child: BlocProvider(
            create: (ctx) => bloc,
            child: Scaffold(
              drawer: Drawer(
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text(
                          locale.home,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onTap: () {
                          router.navigateTo(context, Routes.home);
                        },
                      ),
                      ListTile(
                        title: Text(locale.product,
                            style: Theme.of(context).textTheme.bodyText1),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(locale.reason,
                            style: Theme.of(context).textTheme.bodyText1),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(locale.feedback,
                            style: Theme.of(context).textTheme.bodyText1),
                        onTap: () {
                          openLink(locale.review);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              body: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  CustomAppBar(locale, router, (value) {
                    scrollController.animateTo(value,
                        duration: Duration(
                          seconds: 1,
                        ),
                        curve: Curves.ease);
                  }),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(
                          children: [
                            Intro(locale, (value) => openLink(value)),
                            Product(helper, locale),
                          ],
                        ),
                        Footer(
                          locale,
                          (value) => openLink(value),
                          () {
                            openLink(locale.googleMap);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton:
                  Support(bloc, locale, (value) {
                    openLink(value);
                  }),
            ),
          ),
        ),
      ),
    );
  }

  void openLink(String url) async {
    // flutter web
    if (kIsWeb) {
      // html.document.window.location.href = url;
      js.context.callMethod('open', [url]);
    }
    // android or ios
    else if (Platform.isAndroid || Platform.isIOS) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    // unknown platform
    else {
      throw new Exception('Unsupported platform');
    }
  }
}
