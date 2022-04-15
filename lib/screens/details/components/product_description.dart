import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/models/food.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FoodDescription extends StatelessWidget {
  const FoodDescription({
    Key? key,
    required this.food,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Food food;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            food.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            children: [
              Column(
                children: [
                  Text('Pred Time'),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock,
                        size: getProportionateScreenWidth(15),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${food.prepTime} min',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                width: getProportionateScreenWidth(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: food.isNonVeg ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            food.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
