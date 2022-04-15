import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

final cartController = Get.put(CartController());

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: cartController.fooditems.length == 0
          ? Center(
              child: Text(
                "Please add items your cart",
                style: TextStyle(fontSize: getProportionateScreenWidth(16)),
              ),
            )
          : ListView.builder(
              itemCount: cartController.fooditems.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cartController.fooditems.keys
                      .elementAt(index)
                      .title
                      .toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      cartController.removeFoodItems(
                          cartController.fooditems.keys.elementAt(index));
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(
                      food: cartController.fooditems.keys.elementAt(index)),
                ),
              ),
            ),
    );
  }
}
