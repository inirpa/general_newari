import 'package:flutter/material.dart';
import 'package:general_newari/screens/category_list.dart';
import 'package:general_newari/screens/user_profile.dart';
import 'package:general_newari/screens/word_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: "General Newari",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange ,
      ),
      home: UserProfile(),
    );
  }
}