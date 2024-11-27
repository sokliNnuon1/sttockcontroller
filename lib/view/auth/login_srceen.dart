import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_control_app/view/auth/forgot_password.dart';
import 'package:stock_control_app/view/home/home_screen.dart';
import 'package:stock_control_app/widget/dialog/dialog_info.dart';
import 'package:stock_control_app/widget/dialog/dialog_theme.dart';
import 'package:stock_control_app/widget/text_field.dart';

class LoginSrceen extends StatefulWidget {
  const LoginSrceen({super.key});

  @override
  State<LoginSrceen> createState() => _LoginSrceenState();
}

class _LoginSrceenState extends State<LoginSrceen> {
  bool obscureText = true;
  String isShowSignUp = 'false';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              color: Colors.red,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight - 16.0),
                Container(
                  alignment: Alignment.topCenter,
                  height: (MediaQuery.of(context).size.height / 2) - 150,
                  child: Image.network(
                    'https://images.pexels.com/photos/927022/pexels-photo-927022.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        CustomTextFormField(
                        //  hintText: 'Enter your username',
                          labelText: 'Username *',
                          icon: Icons.person,
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                             // return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                         // hintText: 'Enter your password',
                          labelText: 'Password *',
                          icon: Icons.lock,
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                         const SizedBox(height: 10),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){ Get.to(() => ForgotPasswordScreen());}, child: Text("Fogorpassword",style: TextStyle(color: Colors.red),))
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: submit,
                          child: const Text("Login",style: TextStyle(color: Colors.red),),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text("Or connect with"),
                const SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                    ),
                    icon: const Icon(
                      Icons.login, // You can add any icon for Google here
                      color: Colors.red,
                    ),
                    label: const Text("Google"),
                    onPressed: submit,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to set static username and password
  void setUserCredentials() {
    setState(() {
      username = 'roeun'; // Static username
      password = '1234'; // Static password
    });
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      String enteredUsername = usernameController.text;
      String enteredPassword = passwordController.text;
      // Check if username and password match the static values
      if (enteredUsername == 'roeun' && enteredPassword == '1234') {
        // Proceed with login success
        log("LOGIN SUCCESS");
        setUserCredentials();
        // Navigate to the next page (commented here for demonstration)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // If username or password is incorrect
        log("LOGIN FAILED: Invalid credentials");
        showInfoDialog(context: context, style: ActionStyles.error, message: "Invalid username or password", icon: Icons.warning);
      }
    }
  }
}
