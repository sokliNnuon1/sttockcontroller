import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stock_control_app/view/settings/profile_screen.dart';
import 'package:stock_control_app/view/settings/reset_password.dart';
import 'package:stock_control_app/view/termandcontion/terms_condection.dart';
import 'package:stock_control_app/widget/appbar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(enableLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           const SizedBox(
              height: 40,
            ),
            buildTextIconContainer(
              text: 'Profile', // Custom text
              imageUrl: "assets/images/person.png", // Replace with your image URL
              color: Colors.red, // Custom background color
              onTap: () {
                print('Profile tapped');
                Get.to(() =>const ProfileScreen());

              },
            ),
            buildTextIconContainer(
              text: 'Reset Password', // Custom text
              imageUrl: "assets/images/reset_password.png", 
              color: Colors.red, // Custom background color
              onTap: () {
                print('Profile tapped');
                 Get.to(() =>const ResetPassword());
              },
            ),
            buildTextIconContainer(
              text: 'Term & Condition', // Custom text
              imageUrl: "assets/images/term_and_condition.png", 
              color: Colors.red, // Custom background color
              onTap: () {
                print('Profile tapped');
                Get.to(() => TermConditionScreen());
              },
            ),
            buildTextIconContainer(
              text: 'Change Langguage', // Custom text
              imageUrl: "assets/images/language.png", 
              color: Colors.red, // Custom background color
              onTap: () {
                print('Profile tapped');
                // showLanguageDialog(context);
              },
            ),

            const SizedBox(height: 20),
            // Inside your widget
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red, // The container's background color
              ),

              child: TextButton(
                onPressed: () async {
                  // Call the logout method from AuthController
                 // await Get.find<AuthController>().logout();
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16, // Font size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}


Widget buildTextIconContainer({
  required String text,
  required String imageUrl, // Replace icon with imageUrl
  Color color = Colors.blueAccent,
  required VoidCallback onTap, // Add onTap as a required parameter
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onTap, // Handle the tap event
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.white,  
            width: 2.0, 
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 5, // How soft the shadow appears
              offset: const Offset(0, 3), // X and Y offset of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min, // To wrap the content size
            children: [
              Image.asset(
                imageUrl, 
                height: 25.0,  
                width: 25.0, 
                fit: BoxFit.cover,color: Colors.white,
              ),
              const SizedBox(width: 10.0), 
              Text(
                text, 
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// Dummy ScannerPage
class ScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Center(
        child: Text('Scanner Screen'),
      ),
    );
  }
}