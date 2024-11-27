import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
import 'package:stock_control_app/util/text_styles.dart';

import '../constant/colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(346.w, 50.h),
            backgroundColor: mainColor,
            disabledBackgroundColor: mainColor.withOpacity(.8),
            disabledForegroundColor: Colors.white.withOpacity(.8),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r))),
        onPressed: onPressed,
        child: Text(
          title,
          style: titleMedium700,
        ));
  }
}
