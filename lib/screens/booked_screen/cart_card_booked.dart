import 'package:flutter/material.dart';
import 'package:hotel_app/models/food.dart';
import 'package:get/get.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/screens/cart/components/cart_counter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCardBooked extends StatelessWidget {
  CartCardBooked({
    Key? key,
    required this.food,
  }) : super(key: key);
  final Food food;
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(food.images[0]),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              child: Text(
                food.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => Text("x${cartController.fooditems[food]}",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        ),
      ],
    );
  }
}
