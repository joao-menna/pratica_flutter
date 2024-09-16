import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _numberOneTextEditingController = TextEditingController();
  final _numberTwoTextEditingController = TextEditingController();
  final _operatorTextEditingController = TextEditingController();
  var _result = "";

  void _calculate() {
    final n1 = double.tryParse(
      _numberOneTextEditingController.text.replaceAll(",", "."),
    );
    final n2 = double.tryParse(
      _numberTwoTextEditingController.text.replaceAll(",", "."),
    );

    if (n1 == null || n2 == null) {
      setState(() {
        _result = "Invalid number";
      });
      return;
    }

    var validOper = true;
    final result = switch (_operatorTextEditingController.text) {
      "+" => n1 + n2,
      "-" => n1 - n2,
      "/" => n1 / n2,
      "*" => n1 * n2,
      _ => validOper = false
    };

    if (!validOper) {
      setState(() {
        _result = "Invalid operation";
      });
      return;
    }

    setState(() {
      _result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _numberOneTextEditingController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Number one"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: _numberTwoTextEditingController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Number two"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: _operatorTextEditingController,
              onSubmitted: (value) => _calculate(),
              decoration: const InputDecoration(
                label: Text("Operator (+, -, /, *)"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculate,
                    child: const Text("Calculate"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
