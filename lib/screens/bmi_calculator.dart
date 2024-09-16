import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final _weightTextEditingController = TextEditingController();
  final _heightTextEditingController = TextEditingController();
  var _calculatedBmi = "";

  void _calculateBmi() {
    final weight =
        double.tryParse(_weightTextEditingController.text.replaceAll(",", "."));
    final height =
        double.tryParse(_heightTextEditingController.text.replaceAll(",", "."));

    if (weight == null || height == null) {
      setState(() {
        _calculatedBmi = "Sim, teu peso tem letra, seu animal";
      });
      return;
    }

    setState(() {
      _calculatedBmi = "BMI: ${(weight / (height * height))}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _weightTextEditingController,
              decoration: const InputDecoration(
                label: Text("Weight"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: _heightTextEditingController,
              decoration: const InputDecoration(
                label: Text("Height"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: _calculateBmi,
              child: const Text("Calculate BMI"),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(_calculatedBmi),
          ],
        ),
      ),
    );
  }
}
