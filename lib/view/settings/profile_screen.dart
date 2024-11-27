import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_control_app/widget/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Persional Information'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          //  child: Image.asset('assets/images/slide5.png', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color:  Colors.white, width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SvgPicture.asset('assets/images/Camera.svg', fit: BoxFit.cover,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name"),
                      CustomTextFormField(
                        hintText: 'Enter Current Name',
                        // labelText: 'Enter Current Name',
                        icon: Icons.email,
                        controller: _emailController,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your email';
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(height: 20),
                      Text("Phone Number"),
                      CustomTextFormField(
                        hintText: 'Enter Number Phone',
                        // labelText: 'Enter Number Phone',
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
                      SizedBox(height: 20),
                      Text("Email Address"),
                      CustomTextFormField(
                        hintText: 'Enter Email',
                        // labelText: 'Enter Email',
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
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
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
                    child:const Text(
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
    );
  }
}
