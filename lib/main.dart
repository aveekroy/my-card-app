import 'package:flutter/material.dart';
import 'package:my_card/home_page.dart';
import 'package:my_card/portrait_mixin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  const MyApp(); //- for strict portrait orientation
  @override
  Widget build(BuildContext context) {
    super.build(context); //- for strict portrait orientation
    return MaterialApp(
      title: 'MyCard',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
