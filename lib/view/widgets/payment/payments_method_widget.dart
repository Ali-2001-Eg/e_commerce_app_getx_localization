import 'package:e_commerce_app_with_firebase/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app_with_firebase/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

int radioPaymentIndex = 1;

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
            imageUrl: 'assets/images/paypal.png',
            name: 'Paypal',
            scale: 0.7,
            value: 1,
            onChanged: (int value) {
              setState(() {
                radioPaymentIndex = value;
              });
            },
          ),
          buildRadioPayment(
            imageUrl: 'assets/images/credit.png',
            name: 'Credit Card',
            scale: 0.7,
            value: 2,
            onChanged: (int value) {
              setState(() {
                radioPaymentIndex = value;
              });
            },
          ),
          buildRadioPayment(
            imageUrl: 'assets/images/lock.png',
            name: 'Google Pay',
            scale: 0.7,
            value: 3,
            onChanged: (int value) {
              setState(() {
                radioPaymentIndex = value;
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextUtils(
              text: 'Total: \$ ${Get.find<CartController>().totalPrice.toString()}',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.credit_card),
            label: TextUtils(
              text: 'Pay now',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              elevation: 0,
            ),
          )
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String imageUrl,
    required String name,
    required double scale,
    required int value,
    required Function onChanged,
  }) =>
      Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[300],
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageUrl,
                  scale: scale,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextUtils(
                    text: name,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ],
            ),
            Radio(
              value: value,
              groupValue: radioPaymentIndex,
              onChanged: (value) {
                onChanged(value);
              },
              fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            )
          ],
        ),
      );
}
