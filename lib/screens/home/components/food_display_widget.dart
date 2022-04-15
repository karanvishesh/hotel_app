import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/components/food_item_card.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/models/food.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class FoodDisplayWidget extends StatelessWidget {
  final String category;

  FoodDisplayWidget({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _foodStream = FirebaseFirestore.instance
        .collection("hotels")
        .doc(Get.find<CartController>().hotel_id.value.toString())
        .collection('foods')
        .where('category', isEqualTo: category)
        .snapshots();
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder<QuerySnapshot>(
              stream: _foodStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  //implement error screen
                  print('Something went Wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: const CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  );
                }
                return Row(
                  children: [
                    ...List.generate(
                      snapshot.data!.size,
                      (index) {
                        final List foodList = [];
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map a = document.data() as Map<String, dynamic>;
                          foodList.add(a);
                          a['id'] = document.id;
                        }).toList();

                        return FoodItemCard(
                            food: Food(
                                id: foodList[index]['id'],
                                images: foodList[index]['imageUrl'],
                                colors: [
                                  Color(0xFFF6625E),
                                  Color(0xFF836DB8),
                                  Color(0xFFDECB9C),
                                  Colors.white,
                                ],
                                isNonVeg: foodList[index]['isNonveg'],
                                prepTime: foodList[index]['prep_time'],
                                rating: 4.2,
                                title: foodList[index]['name'],
                                price: foodList[index]['price'],
                                description: foodList[index]['desc']));
                        // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                );
              }),
        )
      ],
    );
  }
}
