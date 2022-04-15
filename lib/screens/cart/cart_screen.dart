import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/screens/booked_screen/booked_screen.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Obx(
            () => Text(
              "${cartController.fooditems.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.to(BookedScreen());
            },
            child: Text(
              "Skip",
              style: TextStyle(color: kPrimaryColor),
            ))
      ],
    );
  }
}
