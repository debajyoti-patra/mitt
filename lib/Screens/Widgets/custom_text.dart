import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/colors.dart';
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text, this.maxLines = 2, this.fontSize = 15,
  });
  final String text;
  final int? maxLines;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
     maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(color: kLight, fontSize: fontSize!.h,),
    );
  }
}
