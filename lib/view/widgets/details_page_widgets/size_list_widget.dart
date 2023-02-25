import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: sizeList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentSelected = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? currentSelected == index
                      ? pinkClr
                      : Colors.black
                  : currentSelected == index
                      ? mainColor
                      : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Text(
              sizeList[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
