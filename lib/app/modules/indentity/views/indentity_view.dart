import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_breed_identifier/app/modules/global_widgets/rank_star.dart';
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
        // backgroundColor: Colors.yellow,
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
                expandedHeight: 250.0.sp,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    // color: Colors.red,
                    child: AutoSizeText(
                      '${controller.result}'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  background: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    color: Colors.amber,
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
                              padding: EdgeInsets.only(left: 10),
                              child: controller.catInfo.value == null
                                  ? SizedBox()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          'Temperament',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        AutoSizeText(
                                          '${controller.catInfo.value.temperament}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 8.sp),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText(
                                          'Life Span',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        AutoSizeText(
                                          '${controller.catInfo.value.lifeSpan} Years',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 8.sp),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText(
                                          'Origin',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        AutoSizeText(
                                          '${controller.catInfo.value.origin} Years',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 8.sp),
                                        ),
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
                  child: SizedBox(
                height: 16,
              )),
              SliverToBoxAdapter(
                child: controller.catInfo.value.id == null
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // width: 300,
                                  child: Wrap(
                                    spacing: 5.sp,
                                    children: [
                                      Container(
                                        width: .30.sw,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Intelligence',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RankStar(
                                              controller
                                                  .catInfo.value.intelligence,
                                              maxStar: 5,
                                              iconSize: 18.sp,
                                              starColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: .30.sw,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Adaptability',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RankStar(
                                              controller
                                                  .catInfo.value.adaptability,
                                              maxStar: 5,
                                              iconSize: 18.sp,
                                              starColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: .30.sw,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Dog Friendly',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RankStar(
                                              controller
                                                  .catInfo.value.dogFriendly,
                                              maxStar: 5,
                                              iconSize: 18.sp,
                                              starColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: .30.sw,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Affection ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RankStar(
                                              controller
                                                  .catInfo.value.affectionLevel,
                                              maxStar: 5,
                                              iconSize: 18.sp,
                                              starColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: .30.sw,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Child Friendly',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RankStar(
                                              controller
                                                  .catInfo.value.childFriendly,
                                              maxStar: 5,
                                              iconSize: 18.sp,
                                              starColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: .30.sw,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Energy',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RankStar(
                                              controller
                                                  .catInfo.value.energyLevel,
                                              maxStar: 5,
                                              iconSize: 18.sp,
                                              starColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Breed Info'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Details'),
                                      Text(
                                          '${controller.catInfo.value.description}'),
                                      Divider(),
                                      Text('Temperament'),
                                      Text(
                                          '${controller.catInfo.value.temperament}'),
                                      Divider(),
                                      Text('Origin'),
                                      Text(
                                          '${controller.catInfo.value.origin}'),
                                      Divider(),
                                      Text('Life Span'),
                                      Text(
                                          '${controller.catInfo.value.lifeSpan}'),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      'Intelligence',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RankStar(
                                      controller.catInfo.value.intelligence,
                                      maxStar: 5,
                                      starColor: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Breed Info'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Details'),
                                      Text(
                                          '${controller.catInfo.value.description}'),
                                      Divider(),
                                      Text('Temperament'),
                                      Text(
                                          '${controller.catInfo.value.temperament}'),
                                      Divider(),
                                      Text('Origin'),
                                      Text(
                                          '${controller.catInfo.value.origin}'),
                                      Divider(),
                                      Text('Life Span'),
                                      Text(
                                          '${controller.catInfo.value.lifeSpan}'),
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
                          ],
                        ),
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
