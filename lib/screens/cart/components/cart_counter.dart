import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/models/food.dart';
import 'package:hotel_app/size_config.dart';

class CartItemCounter extends StatefulWidget {
  final Food food;

  const CartItemCounter({Key? key, required this.food}) : super(key: key);
  @override
  _CartItemCounterState createState() => _CartItemCounterState();
}

class _CartItemCounterState extends State<CartItemCounter> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (cartController.fooditems[widget.food] > 1) {
              cartController.decreaseFoodItems(widget.food);
            }
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Obx(
            () => Text(
              // if our item is less  then 10 then  it shows 01 02 like that
              cartController.fooditems[widget.food].toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              cartController.addFoodItems(widget.food);
            })
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required Function press}) {
    return SizedBox(
      width: getProportionateScreenWidth(25),
      height: getProportionateScreenHeight(30),
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: () {
          press();
        },
        child: Icon(icon),
      ),
    );
  }
}
