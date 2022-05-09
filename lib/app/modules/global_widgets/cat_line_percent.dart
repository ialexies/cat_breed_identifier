import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CatLinePercent extends StatelessWidget {
  double percentRange;
  double fullRange;
  Color percentColor;
  Color? backColor;

  CatLinePercent(
    this.percentRange, {
    this.fullRange = 100,
    this.percentColor = Colors.blue,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1000,
      lineHeight: 5.0,
      percent: (percentRange / fullRange),
      linearStrokeCap: LinearStrokeCap.butt,
      fillColor: percentColor,
      progressColor: percentColor,
      padding: EdgeInsets.zero,
      barRadius: Radius.circular(10),
      backgroundColor: backColor,
    );
  }
}
