import 'package:flutter/material.dart';

import '../model/food_item_model.dart';
import '../model/table_data_model.dart';

class Colorsbase {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color black12 = Colors.black12;
  static const Color green = Colors.green;
  static const Color yellow = Colors.yellow;
  static const Color red = Colors.red;
  static const Color deepPurple = Colors.deepPurple;
}

class Utils {
  getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static List<TableData> tableData = [
    TableData(name: "John", color: Colors.white),
    TableData(name: "Jade", color: Colors.yellow),
    TableData(name: "Mark", color: Colors.red),
    TableData(name: "Mike", color: Colors.green),
    TableData(name: "John", color: Colors.white),
    TableData(name: "Jade", color: Colors.yellow),
    TableData(name: "Mark", color: Colors.red),
    TableData(name: "Mike", color: Colors.green),
    TableData(name: "John", color: Colors.white),
    TableData(name: "Jade", color: Colors.yellow),
    TableData(name: "Mark", color: Colors.red),
    TableData(name: "Mike", color: Colors.green),
    TableData(name: "John", color: Colors.white),
    TableData(name: "Jade", color: Colors.yellow),
    TableData(name: "Mark", color: Colors.red),
    TableData(name: "Mike", color: Colors.green),
    TableData(name: "John", color: Colors.white),
    TableData(name: "Jade", color: Colors.yellow),
    TableData(name: "Mark", color: Colors.red),
    TableData(name: "Mike", color: Colors.green),
  ];

  static List<String> itemHead = [
    "ALL",
    "GENERAL",
    "SNACKS",
    "SANDWICHES",
    "RICE ITEMS",
    "CACKES",
    "BEVERAGES",
  ];

  static List<FoodItem> fooditems_all = [
    FoodItem(name: "Veg Meals Combo", cost: 80),
    FoodItem(name: "Chicken Meals Combo", cost: 120),
    FoodItem(name: "Paneer Butter masala", cost: 90),
    FoodItem(name: "Veg curry", cost: 70),
    FoodItem(name: "Egg Curry", cost: 80),
    //0,4
    FoodItem(name: "Burger", cost: 55),
    FoodItem(name: "Cheese Burger", cost: 65),
    FoodItem(name: "Chiken Burger", cost: 70),
    FoodItem(name: "Pizza", cost: 100),
    FoodItem(name: "French Fries", cost: 60),
    FoodItem(name: "Garlic Bread", cost: 65),
    //5,10
    FoodItem(name: "Veg. Sandwich", cost: 50),
    FoodItem(name: "Cheese Sandwich", cost: 60),
    FoodItem(name: "Chicken Sandwich", cost: 70),
    FoodItem(name: "Bread butter jam", cost: 40),
    //11,14
    FoodItem(name: "Veg Fried Rice", cost: 50),
    FoodItem(name: "Egg Fried Rice", cost: 60),
    FoodItem(name: "Chicken Fried Rice", cost: 70),
    FoodItem(name: "Mushroom Fried Rice", cost: 60),
    FoodItem(name: "Veg Biryani", cost: 70),
    FoodItem(name: "Egg Biryani", cost: 80),
    FoodItem(name: "Chicken Biryani", cost: 90),
    //15, 21
    FoodItem(name: "Apple Pie", cost: 40),
    FoodItem(name: "Black Forest", cost: 40),
    FoodItem(name: "Black Forest", cost: 40),
    FoodItem(name: "Black Forest", cost: 40),
    //22, 25
    FoodItem(name: "Tea", cost: 10),
    FoodItem(name: "Coffe", cost: 10),
    FoodItem(name: "Lemon Juice", cost: 20),
    FoodItem(name: "Mango Milkshake", cost: 50),
    FoodItem(name: "Sapota Milkshake", cost: 40),
    //26, 30
  ];
}
