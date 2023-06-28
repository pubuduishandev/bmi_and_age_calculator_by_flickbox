import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_and_age_calculator/gender_widget.dart';
import 'package:bmi_and_age_calculator/height_widget.dart';
import 'package:bmi_and_age_calculator/result_widget.dart';
import 'package:bmi_and_age_calculator/weight_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _address = new TextEditingController();

  // ignore: unused_field
  int _gender = 0;
  // ignore: unused_field
  int _height = 150;
  // ignore: unused_field
  int _weight = 50;

  String myAge = '';

  String birthYear = '';
  String birthMonth = '';
  String birthDay = '';

  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("BMI Calculator"),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
              //UserName Box
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _username,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      border: OutlineInputBorder(),
                      labelText: 'Name'),
                ),
              ),

              //Address Box
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _address,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      border: OutlineInputBorder(),
                      labelText: 'Address'),
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              //Dob Picker
              ElevatedButton(
                  onPressed: () => pickDob(),
                  child: const Text(
                    'Pick Your Date of Birth',
                  )),

              const SizedBox(
                height: 5,
              ),

              //Gender Buttons
              GenderWidget(
                onChange: (genderVal) {
                  _gender = genderVal;
                },
              ),

              //Height
              HeightWidget(
                onchange: (heightVal) {
                  _height = heightVal;
                },
              ),

              //Weight
              WeightWidget(
                onchange: (weightVal) {
                  _weight = weightVal;
                },
              ),

              SizedBox(height: 10),

              //Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
                    child: ElevatedButton(
                      // ignore: prefer_const_constructors
                      
                      onPressed: () {
                        displayErrorMessage();
                        calculateBmi();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.calculate),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Calculate')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        )
    );
  }

  //DatePicker Working Function
  pickDob() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        calculateAge(pickedDate);
      }
    });
  }

  //Calculating Age Function
  calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    setState(() {
      //myAge = '$years years, $months months and $days days';

      if(years==0){
        if(months==0){
          myAge='$days days';
        }else{
          myAge='$months months';
        }
      }else{
        myAge='$years years';
      }

      birthYear = birth.year.toString();
      birthMonth = birth.month.toString();
      birthDay = birth.day.toString();
    });
  }

  //


  //Calculating BMI Function
  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }

  //Error Message
  void displayErrorMessage() {
    if ((_username.text.isEmpty)) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "WARNING!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Something went wrong.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    } else if (_address.text.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "WARNING!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Something went wrong.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    } else if (myAge.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "WARNING!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Something Went Wrong.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    } else if (_gender == 0) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "WARNING!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Something went wrong.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    } else if (_height == 0) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "WARNING!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Something went wrong.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    } else if (_weight == 0) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "WARNING!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Something went wrong.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    } else if (_username.text.length>25){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "ERROR!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Username too long.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    }else if (_address.text.length>50){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "ERROR!",
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        desc: "Address too long.",
        descTextStyle: TextStyle(fontSize: 15),
        btnOkOnPress: () {},
      ).show();
    }else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultScreen(
                username: _username.text,
                address: _address.text,
                myAge: myAge,
                birthYear: birthYear,
                birthMonth: birthMonth,
                birthDay: birthDay,
                myBirthday: '',
                gender: _gender,
                genderName: '',
                genderImage: '',
                height: _height.toString(),
                weight: _weight.toString(),
                bmiScore: _bmiScore,
                bmiStatus: '',
                bmiInterpretation: '',
              )));
    }
  }
}

