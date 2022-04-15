import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/components/default_button.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/models/food.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:hotel_app/size_config.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Food food;

  Body({Key? key, required this.food}) : super(key: key);
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: food),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              FoodDescription(
                food: food,
                pressOnSeeMore: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\₹${food.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    child: DefaultButton(
                      text: "Add To Cart",
                      press: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Item Added to cart"),
                        ));
                        cartController.addFoodItems(food);
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
