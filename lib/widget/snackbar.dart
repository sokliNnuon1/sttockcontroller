import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarStyle {
  success,
  error,
  warning,
  info,
}

class SnackbarContext {
  final Color bgColor;
  final Color textColor;
  final IconData icon;
  SnackbarContext(this.bgColor, this.textColor, this.icon);
}

// Map the SnackbarStyle to colors and icons.
SnackbarContext _getSnackbarContext(SnackbarStyle style) {
  switch (style) {
    case SnackbarStyle.error:
      return SnackbarContext(Colors.red, Colors.white, Icons.error);
    case SnackbarStyle.info:
      return SnackbarContext(const Color.fromARGB(255, 5, 105, 187), Colors.white, Icons.info);
    case SnackbarStyle.warning:
      return SnackbarContext(Colors.orange, Colors.black, Icons.warning_amber);
    case SnackbarStyle.success:
      return SnackbarContext(Colors.green, Colors.white, Icons.check_circle);
    default:
      return SnackbarContext(const Color.fromARGB(255, 7, 122, 217), Colors.white, Icons.info);
  }
}

void showSnackbar(
  //BuildContext context,
  String message, {
  SnackbarStyle style = SnackbarStyle.info,
  int closeInSeconds = 0,
}) {

  BuildContext? context = Get.context;
  // Early exit if ScaffoldMessenger is not available (invalid context or unmounted widget)
  if (context ==null || ScaffoldMessenger.maybeOf(context) == null) {
    log("Invalid or unmounted context, unable to show SnackBar.");
    return;
  }
  final snackbarContext = _getSnackbarContext(style);

  final snackBar = SnackBar(
    content: Center(
      child: Row(
        children: [
          Icon(snackbarContext.icon, color: snackbarContext.bgColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: snackbarContext.textColor,
              ),
            ),
          ),
        ],
      ),
    ),
    //backgroundColor: snackbarContext.bgColor.withOpacity(0.1),
    duration: closeInSeconds > 0
        ? Duration(seconds: closeInSeconds)
        : const Duration(seconds: 4), // Default duration is 4 seconds
  );

  try {
    // Use ScaffoldMessenger to show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } catch (e) {
    // Handle any unexpected error, like invalid context or disposed widget
    log("Failed to show SnackBar: $e");
  }
}
