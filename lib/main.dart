import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stock_control_app/localization/app_translation.dart';
import 'package:stock_control_app/main_body.dart';
import 'package:stock_control_app/view/auth/login_srceen.dart';
import 'package:stock_control_app/view/report_center/report_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      child: GetMaterialApp(
        translations: AppTranslation(),
        locale: Locale('km','KH'),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            //colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
            // primaryColor: mainColor,
          ),
         // home: BottomnavigationbarPage()),
         home: LoginSrceen()),
    );
  }
}

