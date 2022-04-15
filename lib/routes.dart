import 'package:flutter/widgets.dart';
import 'package:hotel_app/screens/cart/cart_screen.dart';
import 'package:hotel_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:hotel_app/screens/details/details_screen.dart';
import 'package:hotel_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:hotel_app/screens/restaurant_detail/restaurant_detail.dart';
import 'package:hotel_app/screens/login_success/login_success_screen.dart';
import 'package:hotel_app/screens/otp/otp_screen.dart';
import 'package:hotel_app/screens/profile/profile_screen.dart';
import 'package:hotel_app/screens/sign_in/sign_in_screen.dart';
import 'package:hotel_app/screens/sos/sos_screen.dart';
import 'package:hotel_app/screens/splash/splash_screen.dart';
import 'screens/qr_scanner/qr_scanner.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SOSScreen.routeName: (context) => SOSScreen(),
  QrScannerScreen.routeName: (context) => QrScannerScreen(),
};
