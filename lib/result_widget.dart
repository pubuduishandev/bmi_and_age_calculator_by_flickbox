import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  final double bmiScore;

  final int gender; //Added by me

  String bmiStatus;

  String bmiInterpretation;

  Color? bmiStatusColor;

  String genderName;

  String genderImage;

  String username,
      address,
      myAge,
      birthYear,
      birthMonth,
      birthDay,
      height,
      weight;

  String myBirthday;

  ResultScreen({
    Key? key,
    required this.username,
    required this.address,
    required this.myAge,
    required this.birthYear,
    required this.birthMonth,
    required this.birthDay,
    required this.myBirthday,
    required this.gender,
    required this.genderName,
    required this.genderImage,
    required this.height,
    required this.weight,
    required this.bmiScore,
    required this.bmiStatus,
    required this.bmiInterpretation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    setgenderName();
    setgenderImage();
    setmyBirthday();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 204, 223, 249),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          // ignore: prefer_const_constructors
          title: Text("Result")
        ),
        body: 
        Container(
            padding: const EdgeInsets.all(12),
            child: Card(
                elevation: 12,
                shape: const RoundedRectangleBorder(),
                child: Column(
                  children: [
                    //Display Name and Address
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 12,
                        shape: const RoundedRectangleBorder(),
                        color: Colors.black,
                        child: Column(children: [
                          Row(
                            children: [
                              Image.asset(
                                genderImage,
                                width: 75,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(username,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  const SizedBox(height: 5),
                                  Text(address,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 251, 188, 5))),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),

                    //Display Birthday
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month, color: Colors.black,),
                                      const SizedBox(width: 5),
                                      Text('Birthday | ${myBirthday}',
                                        style: TextStyle(color:Colors.black)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25,width: 10,),
                      ],
                    ),


                    //Gender and Age Display
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 12,
                            shape: const RoundedRectangleBorder(),
                            color: Colors.white,
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                  Text(
                                    'Gender | ${genderName}',
                                    style: TextStyle(
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 12,
                            shape: const RoundedRectangleBorder(),
                            color: Colors.white,
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                  Text(
                                    'Age | ${myAge}',
                                    style: TextStyle(
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),

                    //Height and Weight Display
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 12,
                            shape: const RoundedRectangleBorder(),
                            color: Colors.white,
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                  Text('Height | ${height} cm',
                                      style: TextStyle(
                                          color: Colors.black)),
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 12,
                            shape: const RoundedRectangleBorder(),
                            color: Colors.white,
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                  Text('Weight | ${weight} Kg',
                                      style: TextStyle(
                                          color: Colors.black)),
                                  const SizedBox(
                                    height: 25,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Body Mass Index (BMI)",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),

                    //Space Box
                    const SizedBox(
                      height: 5,
                    ),

                    //BMI Category Chart and BMI value
                    PrettyGauge(
                      gaugeSize: 250,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 18.5,
                            const Color.fromARGB(255, 250, 67, 53)),
                        GaugeSegment(
                            'Normal', 6.4, Color.fromARGB(255, 66, 133, 250)),
                        GaugeSegment(
                            'OverWeight', 5, Color.fromARGB(255, 251, 188, 5)),
                        GaugeSegment(
                            'Obese', 10.1, Color.fromARGB(255, 52, 168, 83)),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: Colors.black,
                    ),

                    //Display BMI Status
                    Text(
                      bmiStatus,
                      style: TextStyle(
                          fontSize: 25,
                          color: bmiStatusColor!,
                          fontWeight: FontWeight.bold),
                    ),

                    //Space Box
                    const SizedBox(
                      height: 5,
                    ),

                    //Display Instruction
                    Text(
                      bmiInterpretation,
                      style: TextStyle(fontSize: 15),
                    ),

                    //Space Box
                    const SizedBox(
                      height: 5,
                    ),

                    //Buttons

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.read_more),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  child: Text('Read More'),
                                  onTap: () {
                                    launch(
                                        'https://nutrition.health.gov.lk/english/body-mass-index-bmi/#0');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  "User Name : $username, Address : $address, Gender : $genderName, Age : $myAge, Height : $height, Weight: $weight, BMI : ${bmiScore.toStringAsFixed(1)}");
                            },
                            child: Row(
                              children: [
                                Icon(Icons.share),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('Share')
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))));
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "OBESE";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Color.fromARGB(255, 52, 168, 83);
    } else if (bmiScore >= 25) {
      bmiStatus = "OVERWEIGHT";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Color.fromARGB(255, 251, 188, 5);
    } else if (bmiScore >= 18.5) {
      bmiStatus = "NORMAL";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Color.fromARGB(255, 66, 133, 250);
    } else if (bmiScore < 18.5) {
      bmiStatus = "UNDERWEIGHT";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Color.fromARGB(255, 250, 67, 53);
    }
  }

  void setgenderName() {
    if (gender == 1) {
      genderName = "Male";
    } else if (gender == 2) {
      genderName = "Female";
    }
  }

  void setgenderImage() {
    if (genderName == "Male") {
      genderImage = 'assets/images/man.png';
    } else if (genderName == "Female") {
      genderImage = 'assets/images/woman.png';
    }
  }

  void setmyBirthday() {
    if (birthMonth == '1') {
      myBirthday = '${birthDay} January ${birthYear}';
    } else if (birthMonth == '2') {
      myBirthday = '${birthDay} February ${birthYear}';
    } else if (birthMonth == '3') {
      myBirthday = '${birthDay} March ${birthYear}';
    } else if (birthMonth == '4') {
      myBirthday = '${birthDay} April ${birthYear}';
    } else if (birthMonth == '5') {
      myBirthday = '${birthDay} May ${birthYear}';
    } else if (birthMonth == '6') {
      myBirthday = '${birthDay} June ${birthYear}';
    } else if (birthMonth == '7') {
      myBirthday = '${birthDay} July ${birthYear}';
    } else if (birthMonth == '8') {
      myBirthday = '${birthDay} August ${birthYear}';
    } else if (birthMonth == '9') {
      myBirthday = '${birthDay} September ${birthYear}';
    } else if (birthMonth == '10') {
      myBirthday = '${birthDay} October ${birthYear}';
    } else if (birthMonth == '11') {
      myBirthday = '${birthDay} November ${birthYear}';
    } else if (birthMonth == '12') {
      myBirthday = '${birthDay} December ${birthYear}';
    }
  }
}
