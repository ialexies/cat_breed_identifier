import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RankStar extends StatelessWidget {
  int? starQty = 0;
  int? maxStar = 5;

  Color? starColor = Color.fromRGBO(255, 235, 59, 1);
  double? iconSize = 30.sp;

  RankStar(this.starQty, {this.maxStar, this.iconSize, this.starColor});

  @override
  Widget build(BuildContext context) {
    return rankStarGenerator(starQty,
        maxStar: maxStar,
        iconColor: starColor,
        iconSize: iconSize,
        starColor: starColor);
  }
}

Widget rankStarGenerator(int? adaptability,
    {maxStar = 5, double? iconSize, iconColor, starColor}) {
  int emptyStar = maxStar - adaptability!;

  List<Icon> myListIcon = [];
  for (var i = 0; i < adaptability; i++) {
    myListIcon.add(Icon(
      Icons.star,
      size: iconSize,
      color: iconColor,
    ));
  }

  for (var i = 0; i < emptyStar; i++) {
    myListIcon.add(Icon(
      Icons.star_outline,
      size: iconSize,
      color: iconColor,
    ));
  }

  return Row(
    children: myListIcon,
  );
}
