import 'package:flutter/material.dart';

enum ActionStyles {
  delete, //red
  info, // blue
  error,
  success, //green
  confirmDelete, //red
  confirmUpdate, //orange
  confirmInfo,// lightblue
  update, //green
  warning,
}

class ActionContext {
  Color textColor;
  Color buttonBackgroundColor;
  Color? dialogBackgroundColor;

  // Constructor with required fields
  ActionContext({
    required this.textColor,
    required this.buttonBackgroundColor,
    this.dialogBackgroundColor, // Optional with nullable Color
  });
}

ActionContext getActionStyle(ActionStyles style) {
  switch (style) {
    case ActionStyles.error:
    case ActionStyles.delete:
      return ActionContext(
        textColor: const Color.fromARGB(255, 56, 56, 57), // Red
        buttonBackgroundColor:const Color.fromARGB(255, 180, 14, 14), // Dark Red
        dialogBackgroundColor: const Color.fromARGB(255, 255, 255, 255), // Light Red
      );

    case ActionStyles.info:
      return ActionContext(
        textColor: const Color.fromARGB(255, 56, 56, 57), // Blue
        buttonBackgroundColor: const Color(0xff0000FF), // Light Blue
        dialogBackgroundColor:const Color.fromARGB(255, 255, 255, 255), // White
        
      );

 case ActionStyles.warning:
      return ActionContext(
        textColor: const Color.fromARGB(255, 146, 124, 2), // Blue
        buttonBackgroundColor: const Color.fromARGB(255, 152, 130, 5), // Light Blue
        dialogBackgroundColor:const Color.fromARGB(255, 255, 255, 255), // White
        
      );
    case ActionStyles.success:
      return ActionContext(
        textColor:  const Color.fromARGB(255, 56, 56, 57), // Green
        buttonBackgroundColor: const Color(0xff008000), // Light Green
        dialogBackgroundColor:const Color.fromARGB(255, 255, 255, 255), // White
      );

    case ActionStyles.confirmDelete:
      return ActionContext(
        textColor: const Color.fromARGB(255, 56, 56, 57), // Orange
        buttonBackgroundColor: const Color.fromARGB(255, 180, 14, 14), // Dark Orange
        dialogBackgroundColor: const Color(0xffffdab9), // Light Orange
      );

    case ActionStyles.confirmUpdate:
      return ActionContext(
        textColor: const Color.fromARGB(255, 67, 66, 66), // Purple
        buttonBackgroundColor: const Color.fromARGB(255, 235, 141, 1), // Light Purple
        dialogBackgroundColor: const Color(0xffffffff), // White
      );

    case ActionStyles.update:
      return ActionContext(
        textColor:const Color.fromARGB(255, 53, 53, 52), // Yellow
        buttonBackgroundColor: const Color.fromARGB(255, 235, 141, 1), // Dark Yellow
        dialogBackgroundColor: const Color(0xffffff99), // Light Yellow
      );
    case ActionStyles.confirmInfo:
      return ActionContext(
        textColor:const Color.fromARGB(255, 49, 48, 48), // Yellow
        buttonBackgroundColor: const Color.fromARGB(255, 2, 22, 86), // Dark Yellow
        dialogBackgroundColor: const Color.fromARGB(255, 255, 255, 255), // Light Yellow
      );

    default:
      return ActionContext(
        textColor: const Color.fromARGB(255, 56, 56, 57), // Black
        buttonBackgroundColor: const Color(0xff808080), // Gray
        dialogBackgroundColor: const Color(0xffffffff), // White
      );
  }
}
