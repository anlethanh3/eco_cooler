import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomMap extends StatefulWidget {
  final VoidCallback onTap;

  CustomMap(this.onTap);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  final controller = MapController(
    location: LatLng(
      10.719984,
      106.7019439,
    ),
    zoom: 15,
  );

  void _onDoubleTap() {
    controller.zoom += 0.5;
  }

  Offset _dragStart;
  double _scaleStart = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _onDoubleTap,
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onScaleEnd: (details) {},
      child: Stack(
        children: [
          Map(
            controller: controller,
            builder: (context, x, y, z) {
              final url =
                  'http://mt1.google.com/vt/lyrs=m&x=$x&y=$y&z=$z&hl=vi';

              return CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
              );
            },
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
                    onTap: () {widget.onTap();},
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
