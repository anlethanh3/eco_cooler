import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/common/locale.dart';

class Intro extends StatelessWidget {
  final Locale locale;
  final ValueChanged<String> onTap;

  Intro(this.locale, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
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
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 18),
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
          Wrap(
            children: [
              RichText(
                text: TextSpan(
                  text: locale.shop4,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  onTap(locale.facebook);
                },
                child: RichText(
                  text: TextSpan(
                    text: locale.facebook,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 18),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: locale.shop5,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  onTap('tel:' + locale.phone);
                },
                child: RichText(
                  text: TextSpan(
                    text: locale.phone,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
