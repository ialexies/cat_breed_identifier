import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var myTextTheme = Theme.of(context).textTheme;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text('Cat Identifier'),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 180.w,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: Colors.grey.shade800,
                            border: Border.all(
                              width: 5,
                              color: Colors.grey.shade800,
                            )),
                        // padding: EdgeInsets.all(10),
                        child: controller.catImage!.value.path != ""
                            ? Container(
                                height: 140,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(26.r),
                                      child: ImageFiltered(
                                        imageFilter: ImageFilter.blur(
                                            sigmaX: 3, sigmaY: 3),
                                        child: Image.file(
                                          controller.catImage!.value,
                                          // height: 150,
                                          width: 50.sw,
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // height: 200,
                                      // width: 100.sw,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(26.r),
                                        color: Colors.black.withOpacity(.3),
                                      ),
                                    ),
                                    Center(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(26.r),
                                        child: Image.file(
                                          controller.catImage!.value,

                                          // height: 100,
                                          // width: 100.sw,
                                          fit: BoxFit.fitHeight,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: Image.network(
                                    'https://via.placeholder.com/150',
                                    fit: BoxFit.cover),
                              ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText('${controller.result}'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          children: [
            FloatingNavbar(
              backgroundColor: Colors.amber,
              selectedItemColor: Colors.white,
              selectedBackgroundColor: Colors.transparent,
              width: 250.w,
              // padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 30.h),
              // elevation: .01,
              borderRadius: 30,
              onTap: (int val) {
                //returns tab id which is user tapped
              },
              currentIndex: 0,
              items: [
                FloatingNavbarItem(
                  title: 'Search',
                  customWidget: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30.sp,
                    ),
                    onPressed: () {},
                  ),
                ),
                FloatingNavbarItem(
                  title: 'Gallery',
                  customWidget: IconButton(
                    icon: Icon(
                      Icons.image,
                      size: 30.sp,
                    ),
                    onPressed: () {
                      controller.selectPhoto();
                    },
                  ),
                ),
                FloatingNavbarItem(
                  title: 'Camera',
                  customWidget: IconButton(
                    splashColor: Colors.white,
                    icon: Icon(
                      Icons.camera,
                      size: 30.sp,
                    ),
                    onPressed: () {
                      controller.capturePhoto();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
