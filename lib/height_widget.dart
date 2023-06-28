import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onchange;

  const HeightWidget({Key? key, required this.onchange}) : super(key: key);

  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Height",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _height.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "cm",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
              Slider(
                min: 0,
                max: 240,
                value: _height.toDouble(),
                activeColor: Colors.blue,
                thumbColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _height = value.toInt();
                  });
                  widget.onchange(_height);
                },
              )
            ],
          ));
  }
}
