import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/components/binidng.dart';
import 'package:hotel_app/helper/google_signin.dart';
import 'package:hotel_app/routes.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:hotel_app/screens/landing_page/landing_page.dart';
import 'package:hotel_app/screens/sos/sos_screen.dart';
import 'package:hotel_app/screens/splash/splash_screen.dart';
import 'package:hotel_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      builder: (context, _) {
        return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: FutureBuilder<bool>(
                future: getFlag(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.data == false) {
                    setFlag();
                    return SplashScreen();
                  } else {
                    return LandingPage();
                  }
                },
              ),
      // We use routeName so that we dont need to remember the name
      routes: routes,
    );
      },
    );
  }
}


Future<bool> getFlag() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getBool("visited") ?? false;
}

setFlag() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setBool('visited', true);
}
