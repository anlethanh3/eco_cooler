import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tannhiet/common/locale.dart';
import 'package:tannhiet/bloc/home_bloc.dart';

class Support extends StatelessWidget {
  final HomeBloc bloc;
  final Locale locale;
  var isSupport = false;
  final ValueChanged<String> onTap;

  Support(this.bloc, this.locale,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          'assets/call-messenger.png',
                          'https://www.messenger.com/t/1522654404709115',
                        ],
                        [
                          'assets/call-zalo.png',
                          'https://zalo.me/01226979003',
                        ],
                        [
                          'assets/call-phone.png',
                          'tel:+84 776 979 003',
                        ],
                      ]
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                onTap(e[1]);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(e[0]),
                                      fit: BoxFit.contain),
                                ),
                                constraints:
                                    BoxConstraints(minWidth: 70, minHeight: 70),
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
    );
  }
}
