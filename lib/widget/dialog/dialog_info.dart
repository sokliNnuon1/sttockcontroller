import 'package:flutter/material.dart';
import 'package:stock_control_app/widget/dialog/dialog_theme.dart';

  
 Future<bool?> showInfoDialog({
  required BuildContext context,
  IconData? icon,
  String? message,
  required ActionStyles style,
  String? okButtonText,
  Function()? onOK,
}) {
  final ActionContext actionContext = getActionStyle(style);
  
  if (!context.mounted) {
    // Return a Future that resolves to `false`
    return Future.value(false);
  }
  
  return showDialog<bool?>(
    context: context,
    barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return _InfoDialog(
        icon: icon,
        message: message,
        actionContext: actionContext,
        okButtonText: okButtonText,
        onOK: onOK,
      );
    },
  );
}
 
class _InfoDialog extends StatelessWidget {
  final IconData? icon;
  final String? message;
  final ActionContext actionContext;
  final String? okButtonText;
  final Function()? onOK;

  const _InfoDialog({
    Key? key,
    this.icon,
    this.message,
    required this.actionContext,
    this.okButtonText,
    this.onOK,
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
                message ?? "Action done!",
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
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        actionContext.buttonBackgroundColor),
                  ),
                  onPressed: () {
                    if (onOK != null) {
                      onOK!();
                    }
                    Navigator.of(context).pop(true); // Return true when "OK" is pressed
                  },
                  child: Text(
                    //okButtonText ?? LocaleData.ok.getString(context),
                    okButtonText ?? "OK",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "interFont",
                      color: actionContext.dialogBackgroundColor,
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