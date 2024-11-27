import 'package:flutter/material.dart';
import 'package:stock_control_app/widget/dialog/dialog_theme.dart';


Future<bool?> showConfirmDialog({
  required BuildContext context,
  String? message,
  IconData? icon,
  String? cancelButtonText,
  String? confirmButtonText,
  required ActionStyles style,
  Function(bool actionApproved)? onAction,
}) {
  // Get the action context based on the style
  ActionContext actionContext = getActionStyle(style);
  if(!context.mounted){
      return Future.value(false);  
  }
  return showDialog<bool?>(
    context: context,
    barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return _ConfirmDialog(
        icon: icon,
        message: message,
        cancelButtonText: cancelButtonText,
        confirmButtonText: confirmButtonText,
        actionContext: actionContext,
        onAction: onAction,
      );
    },
  );
}

class _ConfirmDialog extends StatelessWidget {
  final IconData? icon;
  final String? message;
  final String? cancelButtonText;
  final String? confirmButtonText;
  final ActionContext actionContext;
  final Function(bool actionApproved)? onAction;

  const _ConfirmDialog({
    Key? key,
    this.icon,
    this.message,
    this.cancelButtonText,
    this.confirmButtonText,
    required this.actionContext,
    this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: icon != null
          ? Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: actionContext.buttonBackgroundColor,
                  width: 2.0,
                ),
              ),
              child: Icon(
                icon,
                size: 30,
                color: actionContext.buttonBackgroundColor,
              ),
            )
          : null,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                message ?? 'Perform this action?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "interFont",
                  color: actionContext.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
//         SizedBox(
//           width: double.infinity,
//           child:  Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Padding(
//     padding: const EdgeInsets.all(8.0), 
//       child:Container(
//       child: ElevatedButton(
//         style: ButtonStyle(
//           side: MaterialStateProperty.all(
//             BorderSide(
//               color: actionContext.buttonBackgroundColor,
//               width: 1.0,
//             ),
//           ),
//           backgroundColor: MaterialStateProperty.all(Colors.white),
//           padding: MaterialStateProperty.all(
//             const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           ),
//         ),
//         onPressed: () {
//           if (onAction != null) onAction!(false);
//           Navigator.of(context).pop(false);
//         },
//         child: Text(
//           cancelButtonText ?? LocaleData.btnCancel.getString(context),
//           style: TextStyle(
//             fontSize: 15,
//             fontFamily: "interFont",
//             color: actionContext.buttonBackgroundColor,
//           ),
//         ),
//       ),
//     ),
//     ),),
//     Expanded (
//       child: Padding(
//     padding: const EdgeInsets.all(8.0), 
//       child: Container(
//         child: ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(
//               actionContext.buttonBackgroundColor,
//             ),
//             padding: MaterialStateProperty.all(
//               const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             ),
//           ),
//           onPressed: () {
//             if (onAction != null) onAction!(true);
//             Navigator.of(context).pop(true);
//           },
//           child: Flexible(
//             child: Text(
//               confirmButtonText ?? LocaleData.ok.getString(context),
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontFamily: "interFont",
//                 color: Colors.white,
//               ),
//               overflow: TextOverflow.ellipsis, // Use ellipsis for overflow
//               maxLines: 1, // Limit to one line
//             ),
//           ),
//         ),
//       ),
//       )
//     ),
//   ],
// ),
//  ),
    SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: actionContext.buttonBackgroundColor,
                        width: 1.0,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    ),
                  ),
                  onPressed: () {
                    if (onAction != null) onAction!(false);
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                   // cancelButtonText ?? LocaleData.btnCancel.getString(context),
                   cancelButtonText ??"Cancel",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "interFont",
                      color: actionContext.buttonBackgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      actionContext.buttonBackgroundColor,
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    ),
                  ),
                  onPressed: () {
                    if (onAction != null) onAction!(true);
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    //confirmButtonText ?? LocaleData.ok.getString(context),
                    confirmButtonText ?? "Confirm",
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "interFont",
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis, // Use ellipsis for overflow
                    maxLines: 1, // Limit to one line
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),

   ],
 );
  }
}
