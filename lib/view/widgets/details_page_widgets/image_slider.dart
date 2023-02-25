import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_with_firebase/routes/app_routes.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/details_page_widgets/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/controllers/cart_controller.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;

  const ImageSliders({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  final carouselController = CarouselController();
  int pageIndex = 0;
  int currentColor = 0;
  final List<Color> selectedColors = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 0.7,
              onPageChanged: (index, reason) {
                setState(() {
                  pageIndex = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20)),
            );
          },
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: pageIndex,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotColor: Colors.black),
            )),
        Positioned(
          right: 20,
          bottom: 50,
          child: Container(
            height: 240,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemCount: selectedColors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                      outerBorder: currentColor == index,
                      color: selectedColors[index]),
                );
              },
            ),
          ),
        ),
        Positioned(
            left: 20,
            right: 20,
            top: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.toNamed(AppRoutes.main),
                    icon: Icon(Icons.arrow_back_ios,color: Get.isDarkMode?Colors.white:Colors.black,)),
                IconButton(
                    onPressed: () => Get.toNamed(Routes.cartScreen),
                    icon: Badge(
                      textColor: Get.isDarkMode?pinkClr:mainColor,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Get.isDarkMode ? Colors.white:Colors.black,
                      label: Text(cartController.productsMap.isEmpty
                          ? '0'
                          : cartController.productsMap.values
                          .toList()
                          .reduce((value, element) => value + element)
                          .toString()),
                      child:Icon(Icons.shopping_cart,color: Get.isDarkMode?Colors.white:Colors.black,size: 35,),
                    ))
              ],
            ))
      ],
    );
  }
}
