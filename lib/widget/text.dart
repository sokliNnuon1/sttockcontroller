import 'package:flutter/material.dart';

Widget textComponent({
  required String text,
  double? size,
  Color? color,
  FontWeight? bold,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: size ?? 14.sp,
        color: color,
        fontWeight: fontWeight ?? (bold ?? FontWeight.normal), //This line is to embrace bad prop "bold" defined previously

        ),
  );
}

extension on int {
  get sp => null;
}

bool passwordWithSymbol = true;
bool passwordWithUpAndLower = true;
bool doesNotContainName_Gmail = true;
bool uniquePassword = true;
Widget textWithDot(
    {required String text,
    bool? valueIsEight,
    bool? passwordWithSymbol,
    bool? passwordWithUpAndLower,
    bool? doesNotContainName_Gmail,
    bool? uniquePassword}) {
  return Row(
    children: [
      valueIsEight == false
          ? const Icon(
              Icons.close,
              size: 6,
              color: Colors.red,
            )
          : const Icon(
              Icons.fiber_manual_record,
              size: 6,
            ),
      textComponent(
          text: text,
          size: 8,
          color: valueIsEight == false
              ? Colors.red
              : const Color.fromRGBO(140, 140, 140, 1))
    ],
  );
}
