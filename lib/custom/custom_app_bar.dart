import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/common/locale.dart';
import 'package:tannhiet/common/routes.dart';

import 'carousel.dart';

class CustomAppBar extends StatelessWidget {
  final Locale locale;
  final FluroRouter router;
  final ValueChanged<double> onChanged;

  CustomAppBar(this.locale,this.router,this.onChanged);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: isMobile ? 80 : height,
      title: InkWell(
        onTap: () {
          router.navigateTo(context, Routes.home);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(locale.appname, style: Theme.of(context).textTheme.headline1),
            SizedBox(
              height: 8,
            ),
            Text(
              locale.optimize,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      toolbarHeight: 65,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: SizedBox.expand(
        child: Stack(
          children: [
            Carousel(locale),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 120),
                height: 50,
                width: 200,
                child: FlatButton(
                  onPressed: () {
                    onChanged(height-80);
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
    );
  }
}
