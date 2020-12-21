import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/common/locale.dart';
import 'package:tannhiet/custom/custom_map.dart';

class Footer extends StatelessWidget {
  final Locale locale;
  final ValueChanged<String> onTap;
  final VoidCallback onTapMap;

  Footer(this.locale, this.onTap,this.onTapMap);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(
        16,
      ),
      color: Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        locale.fanpage,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    onTap(locale.facebook);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          locale.facebook,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                color: Colors.white60,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.contact,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    onTap('tel:' + locale.phone2);
                  },
                  child: Text(
                    locale.phone2,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.white60,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    onTap('tel:' + locale.phone);
                  },
                  child: Text(
                    locale.phone,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.white60,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.address,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    onTap(locale.googleMap);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          locale.shopAddress,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                color: Colors.white60,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: CustomMap(onTapMap),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
