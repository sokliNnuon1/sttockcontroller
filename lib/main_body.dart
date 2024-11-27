
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_control_app/view/home/home_screen.dart';
import 'package:stock_control_app/view/search/search.dart';
import 'package:stock_control_app/view/settings/reset_password.dart';
import 'package:stock_control_app/view/settings/setting_screen.dart';

class BottomnavigationbarPage extends StatefulWidget {
  const BottomnavigationbarPage({super.key});

  @override
  State<BottomnavigationbarPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<BottomnavigationbarPage> {
  int currentTab = 0;
  final List<Widget> screens = [
     HomeScreen(),
     SearchListScreen(),
     SearchListScreen(),
     SearchListScreen(),
     SettingScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen =  HomeScreen(); // Set default screen to HomePage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: const Border(
              top: BorderSide(
                color: Colors.white,
                width: 10,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              left: BorderSide(
                color: Colors.white,
                width: 10,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              right: BorderSide(
                color: Colors.white,
                width: 10,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              bottom: BorderSide(
                color: Colors.white,
                width: 10,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, -4),
              ),
            ],
            color: Colors.white,
          ),
          margin: EdgeInsets.only(top: 20),
          child: FloatingActionButton(
            splashColor: Colors.white,
            shape: const CircleBorder(),
            elevation: 1,
 //           backgroundColor: Style.mainColor,
            onPressed: () {
              setState(() {
                currentScreen = const SearchListScreen();
                currentTab = 2;
              });
            },
         
            child:  Image.asset('assets/images/scanner.png',width: 30,)
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 15.0,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MaterialButton(
                    minWidth: 40,
                    elevation: 0, // Remove the shadow on hover
                    hoverColor:
                        Colors.transparent, // Remove the color change on hover
                    highlightColor:
                        Colors.transparent, // Remove highlight color on press
                    splashColor:
                        Colors.transparent, // Remove splash color on press
                    onPressed: () {
                      setState(() {
                        currentScreen =  HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                         
                          Image.asset('assets/images/home_1.png',width: 25,color: currentTab == 0?Colors.red :Colors.black),
                        // ),
                        const Spacer(),
                        Text(
                          'Home'.tr,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 11,
                            color: currentTab == 0 ? Colors.red : Colors.black,
                          ),
                          // maxLines: 1, // Limits to a single line
                        //  minFontSize: 8, // Minimum readable size
                          overflow: TextOverflow
                              .ellipsis, // Ellipsis for overflowed text
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    minWidth: 50,
                    elevation: 0, // Remove the shadow on hover
                    hoverColor:
                        Colors.transparent, // Remove the color change on hover
                    highlightColor:
                        Colors.transparent, // Remove highlight color on press
                    splashColor:
                        Colors.transparent, // Remove splash color on press
                    onPressed: () {
                      setState(() {
                        currentScreen = const SearchListScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        
                        Image.asset('assets/images/history.png',width: 25,color: currentTab == 1?Colors.red :Colors.black),
                        const Spacer(),
                        Text(
                          maxLines: 1,
                          'Report'.tr,
                          style: TextStyle(
                            fontSize: 11,
                            color: currentTab == 1 ? Colors.red : Colors.black,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  child: MaterialButton(
                    minWidth: 50,
                    elevation: 0, // Remove the shadow on hover
                    hoverColor:
                        Colors.transparent, // Remove the color change on hover
                    highlightColor:
                        Colors.transparent, // Remove highlight color on press
                    splashColor:
                        Colors.transparent, // Remove splash color on press
                    onPressed: () {
                      setState(() {
                        currentScreen =  SearchListScreen();
                        currentTab = 3;
                        
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                     
                         Image.asset('assets/images/shearch.png',width: 25,color: currentTab == 3?Colors.red :Colors.black),
                        const Spacer(),
                        Text(
                          'Search'.tr,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 11,
                            color: currentTab == 3 ? Colors.red : Colors.black,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    minWidth: 50,
                    elevation: 0, // Remove the shadow on hover
                    hoverColor:
                        Colors.transparent, // Remove the color change on hover
                    highlightColor:
                        Colors.transparent, // Remove highlight color on press
                    splashColor:
                        Colors.transparent, // Remove splash color on press
                    onPressed: () {
                      setState(() {
                        currentScreen = SettingScreen();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                      
                        Image.asset('assets/images/setting.png',width: 25,color: currentTab == 4?Colors.red :Colors.black),
                        const Spacer(),
                        Text(
                          'setting'.tr,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 11,
                            color: currentTab == 4 ? Colors.red : Colors.black,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
