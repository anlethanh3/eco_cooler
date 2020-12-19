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
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
              drawer: Drawer(child: Column(children: [
                DrawerHeader(child: Container()),
                ListTile(title: Text(locale.home,style: Theme.of(context).textTheme.bodyText1,),onTap: (){},),
                ListTile(title: Text(locale.product,style: Theme.of(context).textTheme.bodyText1),onTap: (){},),
                ListTile(title: Text(locale.reason,style: Theme.of(context).textTheme.bodyText1),onTap: (){},),
                ListTile(title: Text(locale.feedback,style: Theme.of(context).textTheme.bodyText1),onTap: (){},),
              ],),),
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text(locale.appname,style: Theme.of(context).textTheme.headline1),
                    expandedHeight: 200.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    actionsIconTheme: IconThemeData(opacity: 0.0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(height: 500,color: Colors.red,),
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
