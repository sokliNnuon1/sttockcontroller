import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:stock_control_app/constant/colors.dart';
 
import 'package:stock_control_app/util/text_styles.dart';
import 'package:stock_control_app/view/auth/login_srceen.dart';
import 'package:stock_control_app/widget/custom_button.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  int? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightRedColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/pngs/hou_express_logo.png',
              height: 350.h,
            ),
            // Gap(24.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 41.w),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  color: Colors.black.withOpacity(.04)),
              child: Column(
                children: [
                  //text
                  Text('Choose Language'.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: titleMedium700.fontWeight,
                          fontSize: titleMedium700.fontSize)),
                  Gap(30.h),
                  Container(
                    height: 58.h,
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/pngs/england_flag.png',
                          ),
                        ),
                        Gap(10.w),
                        Text(
                          'English'.tr,
                          style: titleMedium400,
                        ),
                        const Spacer(),
                        Radio(
                          value: 0,
                          groupValue: selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value;
                            });
                          },
                          activeColor: mainColor,
                        )
                      ],
                    ),
                  ),
                  Gap(8.h),
                  Container(
                    height: 58.h,
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/pngs/khmer_flag.png',
                          ),
                        ),
                        Gap(10.w),
                        Text(
                          'Khmer'.tr,
                          style: titleMedium400,
                        ),
                        const Spacer(),
                        Radio(
                          value: 1,
                          groupValue: selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value;
                            });
                          },
                          activeColor: mainColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(30.h),
            CustomButton(
              title: 'Next'.tr,
              onPressed: selectedLanguage == null
                  ? null
                  : () {
                      Get.to(()=> LoginSrceen());
                    },
            )
          ],
        ));
  }
}
