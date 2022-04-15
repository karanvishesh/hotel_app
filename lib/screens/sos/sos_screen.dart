import 'package:flutter/material.dart';
import 'package:hotel_app/components/custom_bottom_nav_bar.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/enums.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSScreen extends StatelessWidget {
  const SOSScreen({Key? key}) : super(key: key);
  static String routeName = "/sos";
  _launchCaller(String no) async {
    var url = "tel:$no";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.sos),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SOS Emergency"),
            Image.asset(
              "assets/images/ambulance.png",
              width: 100,
            ),
            MaterialButton(
              color: kPrimaryColor,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                "Call Ambulance",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              onPressed: () {
                _launchCaller("+919763546728");
              },
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/images/police-car.png",
              width: 100,
            ),
            MaterialButton(
              color: kPrimaryColor,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                "Call Police",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              onPressed: () {
                _launchCaller("+917986354610");
              },
            ),
          ],
        ),
      ),
    );
  }
}
