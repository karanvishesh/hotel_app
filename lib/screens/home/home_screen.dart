import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/components/custom_bottom_nav_bar.dart';
import 'package:hotel_app/enums.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
