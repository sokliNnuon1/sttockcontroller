import 'package:flutter/material.dart';

class VSProgressIndicator {
  static Future<void> show(BuildContext context, {Color? color, int? maxDuration}) async {
    // Show the dialog and wait for its completion
    await showDialog(
      barrierDismissible: false, // Prevents dismissing the dialog when tapping outside
      context: context,
      builder: (BuildContext context) {
        return _LoadingDialog(color: color); // Use a StatefulWidget
      },
    );
    if (maxDuration !=null && maxDuration > 0){
       //todo: hide loading after the maxDuration is reached
       return;
    }
  }

  static Future<void> hide(BuildContext context) async {
    Navigator.of(context).pop(); // Close the dialog
  }
}

// StatefulWidget to manage the loading dialog
class _LoadingDialog extends StatefulWidget {
  final Color? color;

  const _LoadingDialog({Key? key, this.color}) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<_LoadingDialog> {
  @override
  void dispose() {
    // Cleanup code can be added here if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Make background transparent
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(widget.color ?? Colors.red), // Set the loading color
        ),
      ),
    );
  }
}
