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
        appBar: AppBar(
          backgroundColor: Colors.blue,
          // ignore: prefer_const_constructors
          title: Text("Result")
        ),
        body: 
        Container(
            padding: const EdgeInsets.all(12),
            child: Column(
                  children: [
                    //Display Image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Image.asset(
                              genderImage,
                              width: 75,
                            ),
                          ],
                        ),
                      ],
                    ),

                    //Display Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const SizedBox(width: 5),
                            Text(username,
                                style: TextStyle(color:Colors.black, fontSize: 25, fontWeight: FontWeight.bold)
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),


                    //Display Address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.black,),
                            const SizedBox(width: 5),
                            Text(address,
                                style: TextStyle(color:Colors.black)
                            ),
                          ],
                        ),
                        const SizedBox(height: 25,width: 10,),
                      ],
                    ),

                    const SizedBox(height: 10),

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
                            elevation: 5,
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
                            elevation: 5,
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
                            elevation: 5,
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
                            elevation: 5,
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
                      gaugeSize: 225,
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
                      bmiStatus.toUpperCase(),
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
                                  "Your Result\n\nName :- $username \nAddress :- $address \nBirthday :- $myBirthday \nGender :- $genderName \nAge :- $myAge \nHeight :- $height cm \nWeight :- $weight Kg \nBMI :- ${bmiScore.toStringAsFixed(1)} \nYou are $bmiStatus \n$bmiInterpretation \n\nThanks for using our application \nTeam FlickBox\n\n");
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
                )
        )
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Color.fromARGB(255, 52, 168, 83);
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Color.fromARGB(255, 251, 188, 5);
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Color.fromARGB(255, 66, 133, 250);
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
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
      genderImage = 'assets/images/man-transparent.png';
    } else if (genderName == "Female") {
      genderImage = 'assets/images/woman-transparent.png';
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

