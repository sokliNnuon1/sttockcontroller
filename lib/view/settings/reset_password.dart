import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_control_app/widget/text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Center(
            //   child: Stack(
            //     children: [
            //       Container(
            //         height: 80,
            //         width: 80,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           border: Border.all(color: Color(0xFFEC1D27), width: 3),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(5.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(60),
            //           //  child: Image.asset('assets/images/slide5.png', fit: BoxFit.cover),
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         bottom: 0,
            //         right: 0,
            //         child: Container(
            //           width: 25,
            //           height: 25,
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             border: Border.all(color: Color(0xFFEC1D27), width: 1),
            //           ),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(60),
            //            // child: Image.asset('assets/images/Camera.png', fit: BoxFit.cover),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Current Password"),
                  CustomTextFormField(
                     hintText: 'Enter Current password',
                    // labelText: 'Enter Current password',
                    icon: Icons.email,
                    controller: _emailController,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your email';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 10),
                  Text("New Password"),
                  CustomTextFormField(
                    hintText: 'Enter New password',
                    // labelText: 'Enter New password',
                    icon: Icons.lock,
                    controller: _passwordController,
                    obscureText: true, // To hide the text for password input
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your password';
                    //   }
                    //   return null;
                    // },
                  ),
                   SizedBox(height: 10),
                  Text("Comfirm Password"),
                  CustomTextFormField(
                    hintText: 'Comfirm the new password',
                    // labelText: 'Comfirm the new password',
                    icon: Icons.lock,
                    controller: _passwordController,
                    obscureText: true, // To hide the text for password input
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your password';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Constaints at least 8 characters"),
                      Text("Constains at one number(0-9) and a symbol"),
                      Text(
                          "Constaints borh lower (a-z) and upper case latters (A-Z)"),
                      Text("Dose not contain your name and email address"),
                      Text("Is not commonly or a previous password"),
                    ],
                  ),
                  SizedBox(height: 50),
                 
                ],
              ),
            ),
             Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red, // The container's background color
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Process the form data if valid
                          print('Email: ${_emailController.text}');
                          print('Password: ${_passwordController.text}');
                        }
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16, // Font size
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
