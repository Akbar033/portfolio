import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFontsize {
  static double mainHeading = 20.sp;
  static double headingFont = 12.sp;
  static double subHeading = 10.sp;
}

double getFontSize(
  BuildContext context, {
  double mobile = 12,
  double tablet = 16,
  double desktop = 20,
}) {
  double width = MediaQuery.of(context).size.width;

  if (width < 600) return mobile;
  if (width < 1024) return tablet;
  return desktop;
}
