import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/helper/google_signin.dart';
import 'package:hotel_app/screens/landing_page/landing_page.dart';
import 'package:provider/provider.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.GoogleLogOut();
              Get.to(LandingPage());
            },
          ),
        ],
      ),
    );
  }
}
