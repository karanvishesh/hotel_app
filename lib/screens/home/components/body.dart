import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'food_display_widget.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedCategory = 'starters';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(20)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text("Select Category",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            _buildCategoryWidget(),
            SizedBox(height: getProportionateScreenWidth(10)),
            FoodDisplayWidget(category: selectedCategory,),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }

  _buildCategoryWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = 'starters';
                });
              },
              child: CategoryDisplayWidget(
                category: "Starters",
                isSelected: selectedCategory == 'starters',
              ),
            ),
            SizedBox(width: 3),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = 'main course';
                });
              },
              child: CategoryDisplayWidget(
                category: "Main Course",
                isSelected: selectedCategory == 'main course',
              ),
            ),
            SizedBox(width: 3),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = 'biryani';
                });
              },
              child: CategoryDisplayWidget(
                category: "Biryani",
                isSelected: selectedCategory == 'biryani',
              ),
            ),
            SizedBox(width: 3),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = 'pizza';
                });
              },
              child: CategoryDisplayWidget(
                category: "Pizza",
                isSelected: selectedCategory == 'pizza',
              ),
            ),
            SizedBox(width: 3),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = 'chinese';
                });
              },
              child: CategoryDisplayWidget(
                category: "Chinese",
                isSelected: selectedCategory == 'chinese',
              ),
            ),
            SizedBox(width: 3),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = 'south indian';
                });
              },
              child: CategoryDisplayWidget(
                category: "South Indian",
                isSelected: selectedCategory == 'south indian',
              ),
            ),
            SizedBox(width: 3),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = 'accompainements';
                });
              },
              child: CategoryDisplayWidget(
                category: "Accompainements",
                isSelected: selectedCategory == 'accompainements',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
