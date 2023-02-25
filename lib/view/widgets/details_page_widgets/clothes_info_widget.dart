import 'package:e_commerce_app_with_firebase/logic/controllers/products_controller.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../logic/controllers/cart_controller.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
  const ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                    ),
                  ],
                ),
              ),
              Obx(() => CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(
                      0.5,
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.manageFavouriteList(productId);
                      },
                      icon: Icon(
                        !controller.isFavourite(productId)
                            ? Icons.favorite_outline
                            : Icons.favorite,
                      ),
                      color: Colors.red,
                    ),
                  ))
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: rate.toString(),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              RatingBar.builder(
                initialRating: rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            trimMode: TrimMode.Line,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              height: 2,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontSize: 14,
            ),
            lessStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
