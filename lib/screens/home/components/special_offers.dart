import 'package:flutter/material.dart';
import 'package:hotel_app/constants.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image:
                    "https://www.kohinoor-joy.com/wp-content/uploads/2020/01/indo-chinese-food.jpg",
                category: "Chinese",
                numOfBrands: 10,
                press: () {},
              ),
              SpecialOfferCard(
                image:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkTCNEy4VvPGaL3esya8rNDEj15x-CJF1Bqg&usqp=CAU",
                category: "Italian",
                numOfBrands: 8,
                press: () {},
              ),
              SpecialOfferCard(
                image:
                    "https://media.istockphoto.com/photos/assorted-indian-non-vegetarian-food-recipe-served-in-a-group-includes-picture-id1169700146?k=20&m=1169700146&s=612x612&w=0&h=iuuGcS_3RDBv3qF9dU-E1sswsbzB8nOEUGH7J24JSnA=",
                category: "Mughlai",
                numOfBrands: 8,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: press,
            child: SizedBox(
              width: getProportionateScreenWidth(130),
              height: getProportionateScreenWidth(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.4),
                            Color(0xFF343434).withOpacity(0.15),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: getProportionateScreenWidth(15.0),
                    //     vertical: getProportionateScreenWidth(10),
                    //   ),
                    //   child:
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "$category\n",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: "$numOfBrands Dishes")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
