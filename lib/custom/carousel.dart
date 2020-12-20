import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/common/locale.dart';

class Carousel extends StatelessWidget {
  final Locale locale;

  Carousel(this.locale);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CarouselSlider(
        items: [
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
        ]
            .map((e) => Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(e[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e[1],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(fontSize: 58),
                            ),
                            Container(
                              width: 200,
                              margin: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              height: 1,
                              color: Colors.red,
                            ),
                            Text(
                              e[2],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(fontSize: 30),
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
          height: height,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOut,
          initialPage: 0,
          enableInfiniteScroll: true,
          pageSnapping: true,
          reverse: false,
        ));
  }
}
