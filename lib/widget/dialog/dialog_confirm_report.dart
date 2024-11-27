
import 'package:flutter/material.dart';
import "dart:ui";


class CustomDialog extends StatelessWidget {
  final String dialogText;

  const CustomDialog({Key? key, required this.dialogText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0), // Blur effect
        child: Container(
          height: 250,
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dialogText,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(

                          ),
                        ]
                    ),

                    child: Text("Color"),

                  ),
                  Container(
                    child: Text("Size"),
                  ),
                  Container(
                    child: Text("name"),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 45,
                    width: 110,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFEC1D27), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      ),
                      child: Text(
                      "OK",
                        style: const TextStyle(color: Color(0xFFEC1D27),fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
