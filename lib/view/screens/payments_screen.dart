import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/theme.dart';
import '../widgets/payment/delivery_container_widget.dart';
import '../widgets/payment/payments_method_widget.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Payments'),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Shipping to',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
              const SizedBox(height: 20,),
              DeliveryContainerWidget(),
              const SizedBox(height: 20,),
              TextUtils(
                text: 'Payment method',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
              const SizedBox(height: 20,),
              PaymentMethodWidget(),
              const SizedBox(height: 30,),
              // TotalButton(),
            ],
          ),
        ),
      ),
    );
  }
}
