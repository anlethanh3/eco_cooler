import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMap extends StatelessWidget {
  final VoidCallback onTap;

  CustomMap(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/location.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(4),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 40,
                  height: 40,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      onTap();
                    },
                    child: Center(
                        child: Icon(
                      Icons.zoom_out_map,
                      size: 20,
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
