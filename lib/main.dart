import 'dart:html';
import 'dart:typed_data';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool imagePlaced = false;
  Uint8List fromPicker;
  Future getImage() async {
    fromPicker = await ImagePickerWeb.getImage(outputType: ImageType.bytes);

    setState(() {
      if (fromPicker != null) {
        imagePlaced = true;
      } else {
        imagePlaced = false;
      }
    });
  }

  List<String> _gender = ['Male', 'Female', 'Others']; // Option 2
  String _selectedgender; // Option 2

  String displayDateOnly;
  String displayDateOfBirth;
  DateTime _dateTimeForDoB;
  DateTime _dateTimeForDateOnly;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      imagePlaced
                          ? GestureDetector(
                              onTap: getImage,
                              child: CircleAvatar(
                                  radius: 40,
                                  child: CircleAvatar(
                                      radius: 30,
                                      child: Image.memory(fromPicker))))
                          : IconButton(
                              iconSize: 40.0,
                              icon: Icon(Icons.account_circle_outlined),
                              onPressed: getImage)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1800),
                                  lastDate: DateTime(4000))
                              .then((date) {
                            setState(() {
                              _dateTimeForDateOnly = date;
                              displayDateOnly = null;
                            });
                          });
                        },
                        child: Container(
                            height: 49.0,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        covertDateTimeDate(
                                            _dateTimeForDateOnly),
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full name",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: "Enter full name",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of birth",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("helo");
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1800),
                                    lastDate: DateTime(4000))
                                .then((date) {
                              setState(() {
                                _dateTimeForDoB = date;
                                displayDateOfBirth = null;
                              });
                            });
                          },
                          child: Container(
                              height: 49.0,
                              // color: Colors.grey,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                    //color: Colors.grey,
                                    //color: Colors.red[500],
                                    ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  // Expanded(
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: <Widget>[
                                  //       Text(
                                  //         "   Date",
                                  //         style: TextStyle(fontSize: 15.0,color: Colors.grey[800])
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          covertDateTimeDateOfBirth(
                                              _dateTimeForDoB),
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Container(
                          height: 49.0,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: "Enter age",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        DropdownButtonHideUnderline(
                          child: DecoratedBox(
                            decoration: ShapeDecoration(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 0.0),
                              child: DropdownButton(
                                isExpanded: true,
                                items: _gender.map((gender) {
                                  return new DropdownMenuItem(
                                    value: gender,
                                    child: new Text(gender),
                                  );
                                }).toList(),
                                value: _selectedgender,
                                onChanged: (v) {
                                  setState(() {
                                    _selectedgender = v;
                                  });
                                },
                              ),
                            ),
                          ),
                        )
                        // Container(
                        //   height: 49.0,
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       filled: true,
                        //       fillColor: Colors.grey,
                        //       hintText: "Choose gender",
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Citizenship Number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Container(
                          height: 49.0,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: "Enter citizenship number",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Permanent Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Container(
                          height: 49.0,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: "Enter permanent address",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Temporary Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Container(
                          height: 49.0,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: "Enter temporary address",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profession",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Container(
                          height: 49.0,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: "Enter profession",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Office address/Office name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Container(
                          height: 49.0,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: "Enter office address/name",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone/Mobile number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Container(
                          height: 49.0,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: "Enter phone/mobile number",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email address",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Container(
                    height: 49.0,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: "Enter email address",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 400,
                      color: Colors.grey,
                      child: Text("Upload files/Citizenship"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  covertDateTimeDateOfBirth(_dateTime) {
    if (_dateTime == null && displayDateOfBirth == null) {
      return "  Enter date of birth";
    } else if (displayDateOfBirth is String) {
      return "  $displayDateOfBirth";
    } else {
      var date = DateTime.parse("$_dateTime");
      var formattedDate = "  ${date.month}-${date.day}-${date.year}";
      return formattedDate;
    }
  }

  covertDateTimeDate(_dateTime) {
    if (_dateTime == null && displayDateOnly == null) {
      return "  Choose date";
    } else if (displayDateOnly is String) {
      return "  $displayDateOnly";
    } else {
      var date = DateTime.parse("$_dateTime");
      var formattedDate = "  ${date.month}-${date.day}-${date.year}";
      return formattedDate;
    }
  }
}
