import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/components/custom_bottom_nav_bar.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/enums.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/models/food.dart';
import 'package:hotel_app/screens/cart/cart_screen.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:like_button/like_button.dart';

class RestaurantDetailScreen extends StatefulWidget {
  static String routeName = "/restaurant_detail";
  final cartController = Get.put(CartController());
  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.restaurant_detail),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("hotels")
                    .doc(Get.find<CartController>().hotel_id.value.toString())
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    //implement error screen
                    print('Something went Wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: const CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }

                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black, BlendMode.dstATop),
                                  image: NetworkImage(
                                    snapshot.data['imageUrl'],
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 200,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        snapshot.data['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            " 250 Reviews",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  LikeButton(
                                    size: 40,
                                    circleColor: CircleColor(
                                        start: Color(0xff00ddff),
                                        end: Color(0xff0099cc)),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Color(0xff33b5e5),
                                      dotSecondaryColor: Color(0xff0099cc),
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        CupertinoIcons.heart_fill,
                                        color:
                                            isLiked ? Colors.red : Colors.white,
                                        size: 40,
                                      );
                                    },
                                    countBuilder: (count, isLiked, text) {
                                      if (count == 0) {
                                        return Text(
                                          "love",
                                          style: TextStyle(color: Colors.red),
                                        );
                                      } else
                                        return Text(
                                          text,
                                          style: TextStyle(color: Colors.white),
                                        );
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Chef's info",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      height: 0.5,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              placesWidget(
                                  snapshot.data['chef_imageUrl'],
                                  snapshot.data['chef_name'],
                                  snapshot.data['chef_desc']),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "About",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      height: 0.5,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data['desc'],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container dishWidget(String img, String name, String description) {
    return Container(
      width: 120,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/$img.png"))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$description",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.black)),
                child: Text("+ Cart"),
              )
            ],
          )
        ],
      ),
    );
  }

  Row placesWidget(String img, String name, String desc) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(image: NetworkImage(img))),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                desc,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: kPrimaryColor),
            child: Text(
              "View more",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  void openCartPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CartScreen()));
  }
}
