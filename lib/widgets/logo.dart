import 'dart:ui';

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({Key key, this.width = double.infinity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            height: 95,
            width: 95,
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            width: width,
          ),
        ],
      ),
    );
  }
}
