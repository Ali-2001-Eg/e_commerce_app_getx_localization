import 'package:e_commerce_app_with_firebase/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app_with_firebase/logic/controllers/payment_controller.dart';
import 'package:e_commerce_app_with_firebase/routes/app_routes.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:location/location.dart';

import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);


  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

int radioContainerIndex = 1;
bool changeColor = false;
final controller = Get.find<PaymentsController>();
final phoneController = TextEditingController();




class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          color: changeColor ? Colors.white : Colors.grey.shade300,
          value: 1,
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
          title: 'Ali Shop',
          name: 'Ali Mazen',
          phone: '51-1451-15520',
          address: '20 street Salah ElMarg Cairo',
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
                () {
              return buildRadioContainer(
                color: !changeColor ? Colors.white : Colors.grey.shade300,
                value: 2,

                title: 'Delivery',
                name: Get
                    .find<AuthController>()
                    .displayUserName
                    .string,
                phone: phoneController.text.isEmpty
                    ? 'phone number'
                    : phoneController.text,
                address: controller.address.value==''?'Address':controller.address.value,
                icon: Container(),
                onChanged: (int? value) {
                  setState(() {
                    radioContainerIndex = value!;
                    changeColor = !changeColor;
                    controller.updatePosition();
                    Get.defaultDialog(
                      title: 'Enter Your Phone number',
                      titleStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      backgroundColor: Colors.white,
                      radius: 10,
                      textCancel: 'Cancel',
                      cancelTextColor: Colors.black,
                      textConfirm: 'Save',
                      confirmTextColor: Colors.black,
                      onCancel: () {
                        Get.toNamed(Routes.payments);
                      },
                      onConfirm: () {
                        setState(() {
                          Get.back();
                        });
                      },
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                      content: Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          maxLength: 11,
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          onChanged: (value) {},
                          onSubmitted: (value) {
                            phoneController.text = value;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.red,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  phoneController.clear();
                                },
                                icon: !(phoneController.text == '')
                                    ? Icon(
                                  Icons.close,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                )
                                    : Container()),
                            hintText: 'Enter Your phone number',
                            hintStyle: TextStyle(
                                color:
                                Get.isDarkMode ? Colors.white : Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                            labelStyle: TextStyle(
                                color: Get.isDarkMode ? Colors.white : Colors
                                    .black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            filled: true,
                            fillColor: Get.isDarkMode
                                ? pinkClr.withOpacity(0.3)
                                : mainColor.withOpacity(0.2),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          //line color
                          cursorColor: Colors.black,
                        ),
                      ),
                    );
                  });

                },
              );
            },

        )
      ],
    );
  }

  Container buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String title,
    required String name,
    required String phone,
    required String address,
    Widget? icon,
  }) =>
      Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: value,
              groupValue: radioContainerIndex,
              onChanged: (int? value) {
                onChanged(value);
              },
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                            text: title,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,),
                        const SizedBox(
                          height: 5,
                        ),
                        TextUtils(
                            text: name,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        const SizedBox(
                          height: 5,
                        ),
                        TextUtils(
                          text: '🇪🇬 +02  $phone',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,textOverFlow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextUtils(
                            text: address,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,textOverFlow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    child: icon,
                  )
                ],
              ),
            )
          ],
        ),
      );
}
