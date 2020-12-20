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
import 'package:tannhiet/repo/home_repository.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:universal_io/prefer_universal/io.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final contentKey = GlobalKey();
  HomeBloc bloc;
  HomeRepository repo;
  var isSupport = false;

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
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final displayRatio = isMobile ? 1 : 2 / 3;
    final numDisplayItem =
        MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
    final width = isMobile
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.width * displayRatio;
    final images = [
      [
        'assets/1.jpg',
        locale.notSale,
        locale.notSale2,
      ],
      [
        'assets/2.jpg',
        locale.cool,
        locale.cool2,
      ],
      [
        'assets/3.jpg',
        locale.notFind,
        locale.notFind2,
      ],
      [
        'assets/4.jpg',
        locale.noUse,
        locale.noUse2,
      ],
    ];
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
                        onTap: () {},
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
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: isMobile ? 80 : 500,
                    toolbarHeight: 65,
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: SizedBox.expand(
                      child: Stack(
                        children: [
                          SizedBox.expand(
                            child: CarouselSlider(
                                items: images
                                    .map((e) => Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(e[0]),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(locale.appname,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(locale.optimize,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 100),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      e[1],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2
                                                          .copyWith(
                                                              fontSize: 18),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        vertical: 8,
                                                      ),
                                                      height: 1,
                                                      color: Colors.red,
                                                    ),
                                                    Text(
                                                      e[2],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2
                                                          .copyWith(
                                                              fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                  aspectRatio: 2,
                                  autoPlay: true,
                                  viewportFraction: 1,
                                  enlargeCenterPage: false,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.easeInOut,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 120),
                              height: 50,
                              width: 200,
                              child: FlatButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(
                                      contentKey.currentContext);
                                },
                                color: Colors.red,
                                child: Text(
                                  locale.explore,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          children: [
                            Expanded(
                              flex: isMobile ? 3 : 2,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      key: contentKey,
                                      margin: EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            locale.shop,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: locale.shop1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3
                                                    .copyWith(fontSize: 18),
                                                children: [
                                                  TextSpan(
                                                    text: locale.cooler,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(fontSize: 18),
                                                  ),
                                                  TextSpan(
                                                    text: locale.cooler1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3
                                                        .copyWith(fontSize: 18),
                                                  ),
                                                  TextSpan(
                                                    text: locale.website,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(fontSize: 18),
                                                  ),
                                                  TextSpan(
                                                    text: locale.cooler2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3
                                                        .copyWith(fontSize: 18),
                                                  ),
                                                ]),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            locale.shop2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3
                                                .copyWith(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: locale.shop3,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3
                                                    .copyWith(fontSize: 18),
                                                children: [
                                                  TextSpan(
                                                    text: locale.cooler,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(fontSize: 18),
                                                  ),
                                                  TextSpan(
                                                    text: locale.cooler3,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3
                                                        .copyWith(fontSize: 18),
                                                  ),
                                                ]),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: locale.shop4,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3
                                                  .copyWith(fontSize: 18),
                                              children: [
                                                TextSpan(
                                                  text: locale.facebook,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4
                                                      .copyWith(fontSize: 18),
                                                ),
                                                TextSpan(
                                                  text: locale.shop5,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3
                                                      .copyWith(fontSize: 18),
                                                ),
                                                TextSpan(
                                                  text: locale.phone,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4
                                                      .copyWith(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        childAspectRatio:
                                            width / numDisplayItem / 340,
                                        crossAxisCount: numDisplayItem,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        children: [
                                          [
                                            'p1.jpg',
                                            'Đế tản nhiệt quạt RGB AURA',
                                            1800000,
                                            1499000,
                                          ],
                                          [
                                            'p2.jpg',
                                            'Tản nhiệt laptop CF-3200',
                                            1000000,
                                            990000,
                                          ],
                                          [
                                            'p3.jpg',
                                            'Tản nhiệt laptop CF-2000',
                                            900000,
                                            800000,
                                          ],
                                          [
                                            'p4.jpg',
                                            'Tản nhiệt laptop CF-1200',
                                            700000,
                                            600000,
                                          ],
                                        ]
                                            .map(
                                              (e) => Stack(
                                                children: [
                                                  SizedBox.expand(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minHeight:
                                                                      200,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        AssetImage(
                                                                            e[0]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: e[1],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3
                                                                .copyWith(
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: helper
                                                                .moneyFormat(
                                                                    e[2]),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3
                                                                .copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  color: Colors
                                                                      .black45,
                                                                ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: helper
                                                                .moneyFormat(
                                                                    e[3]),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3
                                                                .copyWith(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 70,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Center(
                                                        child: RichText(
                                                          text: TextSpan(
                                                            text:
                                                                locale.discount,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3
                                                                .copyWith(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: isMobile ? 0 : 1, child: Container()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: Container(
                width: 100,
                height: 300,
                child: Column(
                  children: [
                    BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state is HomeSupportState) {
                          isSupport = !isSupport;
                        }
                      },
                      builder: (context, state) {
                        return isSupport
                            ? Column(
                                children: [
                                  [
                                    'messenger.jpg',
                                    'https://www.messenger.com/t/1522654404709115',
                                  ],
                                  [
                                    'zalo.jpg',
                                    'https://zalo.me/01226979003',
                                  ],
                                  [
                                    'phone.jpg',
                                    'tel:+84 776 979 003',
                                  ],
                                ]
                                    .map(
                                      (e) => InkWell(
                                        onTap: () async {
                                          final url = e[1];
                                          // flutter web
                                          if (kIsWeb) {
                                            // html.document.window.location.href = url;
                                            js.context.callMethod('open', [url]);
                                          }
                                          // android or ios
                                          else if (Platform.isAndroid || Platform.isIOS) {
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            }else {
                                              throw 'Could not launch $url';
                                            }
                                          }
                                          // unknown platform
                                          else {
                                            throw new Exception('Unsupported platform');
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(e[0]),
                                                fit: BoxFit.contain),
                                          ),
                                          constraints: BoxConstraints(
                                              minWidth: 70, minHeight: 70),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : Container(
                                height: 234,
                              );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        bloc.add(HomeSupportEvent());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          locale.support,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
