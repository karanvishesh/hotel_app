import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/screens/booked_screen/cart_card_booked.dart';
import 'package:hotel_app/screens/cart/components/body.dart';
import 'package:hotel_app/screens/cart/components/cart_card.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:hotel_app/size_config.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({Key? key}) : super(key: key);

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ongoing Order",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/clock.png",
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "20 minutes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          cartController.fooditems.length == 0
              ? Container()
              : Expanded(
                  child: ListView.builder(
                    itemCount: cartController.fooditems.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CartCardBooked(
                          food: cartController.fooditems.keys.elementAt(index)),
                    ),
                  ),
                ),
          MaterialButton(
              color: kPrimaryColor,
              child: Text(
                "Get to Home",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                cartController.removeAll();
                Get.to(HomeScreen());
              })
        ],
      )),
    );
  }
}
