import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/constants.dart';
import '../../../size_config.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    String selectedCategory = 'starters';
    return SingleChildScrollView(
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
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

class CategoryDisplayWidget extends StatelessWidget {
  const CategoryDisplayWidget({
    Key? key,
    required this.category,
    required this.isSelected,
  }) : super(key: key);
  final String category;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16),
        vertical: getProportionateScreenWidth(12),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(width: 0, color: kPrimaryColor)
            : Border.all(color: kPrimaryColor, width: 1.5),
        color: isSelected ? kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
