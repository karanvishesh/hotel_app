import 'package:flutter/material.dart';

class Food {
  final String id;
  final String title, description;
  final List<dynamic> images;
  final List<Color> colors;
  final int price, prepTime;
  final double rating;
  final bool isNonVeg;

  Food({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isNonVeg = false,
    required this.title,
    this.prepTime = 30,
    required this.price,
    required this.description,
  });
}

// Our demo Products

// List<Food> starters = [
//   Food(
//     id: 1,
//     images: [
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQhd7IA7Gd7SXUOQNEaDzVcsSMvT9d5mIwhg&usqp=CAU",
//       // "assets/images/ps4_console_white_2.png",
//       // "assets/images/ps4_console_white_3.png",
//       // "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Paneer Tikka",
//     price: 180,
//     description: description,
//     rating: 4.5,
//     isVeg: true,
//   ),
//   Food(
//     id: 2,
//     images: [
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3mMyY5RnUi9Cd9HVUI7xKifTr_uC4-NhY1Q&usqp=CAU",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Veg Spring Roll",
//     price: 160,
//     description: description,
//     rating: 4.1,
//     isVeg: true,
//   ),
//   Food(
//     id: 3,
//     images: [
//       "https://i.pinimg.com/originals/8c/2b/01/8c2b015d172f8eec08a45a6a00ebc920.jpg",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Chicken Lollipop",
//     price: 360,
//     description: description,
//     rating: 4.1,
//     isVeg: false,
//   ),
// ];
