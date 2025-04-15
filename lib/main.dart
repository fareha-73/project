import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red
        ),
      home: BMIHomePage(),
    );
  }
}

class BMIHomePage extends StatefulWidget {
  const BMIHomePage({super.key});

  @override
  _BMIHomePageState createState() => _BMIHomePageState();
}

class _BMIHomePageState extends State<BMIHomePage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _bmiResult = "";
  String _status = "";

  void _calculateBMI() {
    double height =
        double.parse(_heightController.text) / 100; // Convert cm to m
    double weight = double.parse(_weightController.text);

    double bmi = weight / (height * height);
    setState(() {
      _bmiResult = bmi.toStringAsFixed(2);
      if (bmi < 18.5) {
        _status = "Underweight";
      } else if (bmi >= 18.5 && bmi < 24.9) {
        _status = "Normal weight";
      } else if (bmi >= 25 && bmi < 29.9) {
        _status = "Overweight";
      } else {
        _status = "Obesity";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Enter your height (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Enter your weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            if (_bmiResult.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Your BMI: $_bmiResult',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Status: $_status',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
