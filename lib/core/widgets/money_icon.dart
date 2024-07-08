import 'package:flutter/material.dart';

class MoneyIcon extends StatelessWidget {
  const MoneyIcon({super.key, required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: (60 * percent) / 100,
      width: (90 * percent) / 100,
      child: Stack(
        children: [
          _Image(
            asset: 'money1',
            height: (64 * percent) / 100,
            degree: -30,
            bottom: 0,
          ),
          _Image(
            asset: 'money2',
            height: (36 * percent) / 100,
            degree: -64,
            top: (7 * percent) / 100,
            right: (37 * percent) / 100,
          ),
          _Image(
            asset: 'money2',
            height: (43 * percent) / 100,
            degree: -44,
            right: (26 * percent) / 100,
            bottom: (12 * percent) / 100,
          ),
          _Image(
            asset: 'money2',
            height: (57 * percent) / 100,
            degree: -15,
            right: (10 * percent) / 100,
            bottom: (-5 * percent) / 100,
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.asset,
    required this.height,
    required this.degree,
    this.top,
    this.bottom,
    this.right,
  });

  final String asset;
  final double height;
  final int degree;
  final double? top;
  final double? bottom;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      right: right,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(degree / 360),
        child: Image.asset(
          'assets/$asset.png',
          height: height,
        ),
      ),
    );
  }
}
