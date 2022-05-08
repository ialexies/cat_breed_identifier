import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/indentity_controller.dart';

class IndentityView extends GetView<IndentityController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.yellow,
        // appBar: AppBar(
        //   title: const Text('Cat Identifier'),
        // ),
        body: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                expandedHeight: 230.0,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    // color: Colors.red,
                    child: AutoSizeText(
                      '${controller.result}'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  background: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.red,
                    child: SafeArea(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: imageFramBlurBack(),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: controller.catInfo.value != null
                                  ? SizedBox()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          '${controller.result}'.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(''),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 27.sp),
                    SizedBox(height: 27.sp),
                    Text(
                      'Breed Info'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('Details'),
                          Text('${controller.catInfo.value.description}'),
                          Divider(),
                          Text('Temperament'),
                          Text('${controller.catInfo.value.temperament}'),
                          Divider(),
                          Text('Origin'),
                          Text('${controller.catInfo.value.origin}'),
                          Divider(),
                          Text('Life Span'),
                          Text('${controller.catInfo.value.lifeSpan}'),
                          Divider(),
                          Text('Weight'),
                          Text(
                              '${controller.catInfo.value.weight?.metric ?? 0} Kg'),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 27.sp),
                    SizedBox(height: 27.sp),
                    Text(
                      'Breed Info'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    controller.catInfo.value != null
                        ? SizedBox()
                        : Container(
                            child: Column(
                              children: [
                                Text('Details'),
                                Text('${controller.catInfo.value.description}'),
                                Divider(),
                                Text('Temperament'),
                                Text('${controller.catInfo.value.temperament}'),
                                Divider(),
                                Text('Origin'),
                                Text('${controller.catInfo.value.origin}'),
                                Divider(),
                                Text('Life Span'),
                                Text('${controller.catInfo.value.lifeSpan}'),
                                Divider(),
                                Text('Weight'),
                                Text(
                                    '${controller.catInfo.value.weight?.metric ?? 0} Kg'),
                                Divider(),
                              ],
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
              margin: EdgeInsets.only(bottom: 30.h),
              borderRadius: 30,
              onTap: (int val) {},
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

  Container imageFramBlurBack() {
    return Container(
      // margin: EdgeInsets.all(10),
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
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
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
                      borderRadius: BorderRadius.circular(26.r),
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26.r),
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
                  'https://via.placeholder.com/150.png?text=Cat+Not+Found',
                  fit: BoxFit.cover, loadingBuilder: (BuildContext context,
                      Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }),
            ),
    );
  }
}
