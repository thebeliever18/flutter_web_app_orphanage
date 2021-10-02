import 'dart:html';
import 'dart:typed_data';
import 'package:desktopApp/pages/user_registration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

void main() {
  runApp(MyApp());
}

DateTime selectedDate;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserRegistration(title: 'Flutter Demo Home Page'),
    );
  }
}
