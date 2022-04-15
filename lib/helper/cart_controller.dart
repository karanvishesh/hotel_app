import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/models/food.dart';

class CartController extends GetxController {
  var hotel_id = "".obs;
  void upDateId(String id) {
    hotel_id.value = id;
  }

  var _fooditems = {}.obs;
  var totalPrice = 0.obs;
  void addFoodItems(Food food) {
    if (_fooditems.containsKey(food)) {
      _fooditems[food] += 1;
      totalPrice += food.price;
    } else {
      _fooditems[food] = 1;
      totalPrice += food.price;
    }
  }

  void decreaseFoodItems(Food food) {
    if (_fooditems.containsKey(food) && _fooditems[food] == 1) {
      totalPrice -= food.price;
      _fooditems.removeWhere((key, value) => key == food);
    } else {
      _fooditems[food] -= 1;
      totalPrice -= food.price;
    }
  }

  void removeFoodItems(Food food) {
    totalPrice = totalPrice - (food.price * _fooditems[food]).toInt();
    _fooditems.removeWhere((key, value) => key == food);
  }

  void removeAll() {
    totalPrice.value = 0;
    _fooditems.clear();
  }

  get fooditems => _fooditems;
}
