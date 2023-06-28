import 'package:flutter/material.dart';

class WeightWidget extends StatefulWidget {
  final Function(int) onchange;

  const WeightWidget({Key? key, required this.onchange}) : super(key: key);

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  int _weight = 50;

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
                "Weight",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _weight.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Kg",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
              Slider(
                min: 0,
                max: 120,
                value: _weight.toDouble(),
                activeColor: Colors.blue,
                thumbColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _weight = value.toInt();
                  });
                  widget.onchange(_weight);
                },
              )
            ],
          ));
  }
}
