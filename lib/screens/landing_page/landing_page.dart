import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/screens/booked_screen/booked_screen.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:hotel_app/screens/qr_scanner/qr_scanner.dart';
import 'package:hotel_app/screens/sign_in/sign_in_screen.dart';
import 'package:hotel_app/size_config.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: kPrimaryColor));
          } else if (snapshot.hasData) {
            Future.delayed(Duration.zero, () {
              // Get.offAllNamed(QrScannerScreen.routeName);
               Get.put(CartController()).upDateId('nawiu0rs2fGim99bSnuf');
               Get.to(HomeScreen());

            });

            return Container();
          } else if (snapshot.hasError) {
            //implement error screen
            print("error");
            return const Center(child: Text("Error"));
          } else {
            print("user not logged in");
            Future.delayed(Duration.zero, () {
              Get.to(SignInScreen());
            });

            return Container();
          }
        },
      ),
    );
  }
}
