import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/my_home_page.dart';
import 'Utility/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Navigation',
      theme: ThemeData(
        scaffoldBackgroundColor: Colorsbase.white,
        primarySwatch: Colorsbase.deepPurple,
      ),
      home: MyHomePage(title: 'Restaurant Navigation'),
    );
  }
}
