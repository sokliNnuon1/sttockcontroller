import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


AppBar customAppBar({
  required bool enableLeading,
}) =>
    AppBar(
     //backgroundColor: mainColor,

      backgroundColor: Colors.red,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Image.asset(
        'assets/images/logo.png',
        width: 120.h,color: Colors.white,
      ),
      leading: enableLeading == false
          ? null
          : IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/notification.png',
            height: 24.h,
            width: 24.h,color: Colors.white,
          ),
        )
      ],
    );
