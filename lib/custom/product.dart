import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/common/helper.dart';
import 'package:tannhiet/common/locale.dart';

class Product extends StatelessWidget {
  final Helper helper;
  final Locale locale;

  Product(this.helper, this.locale);

  @override
  Widget build(BuildContext context) {
    final items = [
      [
        'assets/product1.jpg',
        'Đế tản nhiệt quạt RGB AURA',
        1800000,
        1499000,
        0,
      ],
      [
        'assets/product2.jpg',
        'Tản nhiệt laptop CF-3200',
        1000000,
        990000,
        5,
      ],
      [
        'assets/product3.jpg',
        'Tản nhiệt laptop CF-2000',
        900000,
        800000,
        0,
      ],
      [
        'assets/product4.jpg',
        'Tản nhiệt laptop CF-1200',
        700000,
        600000,
        0,
      ],
    ];
    final itemInRow =
        MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
    final itemWidth = MediaQuery.of(context).size.width / itemInRow;
    final itemHeight = MediaQuery.of(context).size.width < 1024 ? 360.0 : 400.0;
    final imageHeight = MediaQuery.of(context).size.width < 1024 ? 200.0 : 250.0;

    return Wrap(
      children: items.map(
        (item) {
          return Container(
            width: itemWidth,
            height: itemHeight,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: imageHeight,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(item[0]),
                                  fit: BoxFit.cover,
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
                          text: item[1],
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(item[4] as int, (value) {
                          return Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellowAccent,
                          );
                        }),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: helper.moneyFormat(item[2]),
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black45,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: helper.moneyFormat(item[3] as double),
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: locale.discount,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
