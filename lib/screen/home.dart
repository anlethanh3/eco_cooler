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

  @override
  void initState() {
    super.initState();
    repo = HomeRepository(helper);
    bloc = HomeBloc(repo);
    initHomeState();
  }

  void initHomeState() async {
    await Future.delayed(Duration(milliseconds: 300));
    bloc.add(AllEvent());
  }

  @override
  Widget build(BuildContext context) {
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
                    toolbarHeight: 80,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(locale.appname,
                            style: Theme.of(context).textTheme.headline1),
                        SizedBox(
                          height: 8,
                        ),
                        Text(locale.optimize,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                    expandedHeight: 500,
                    floating: true,
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    snap: true,
                    actionsIconTheme: IconThemeData(opacity: 0.0),
                    flexibleSpace: Stack(
                      children: [
                        SizedBox.expand(
                          child: CarouselSlider(
                              items: images
                                  .map((e) => SizedBox.expand(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(e[0]),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
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
                                                    .copyWith(fontSize: 18),
                                              ),
                                              Container(
                                                width: 100,
                                                margin: EdgeInsets.symmetric(
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
                                                    .copyWith(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
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
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        key: contentKey,
                        margin: EdgeInsets.all(16),
                        height: 1500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.shop,
                              style: Theme.of(context).textTheme.headline3,
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
                                  ),TextSpan(
                                    text: locale.shop5,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(fontSize: 18),
                                  ),TextSpan(
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
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
