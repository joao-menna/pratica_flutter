import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumber extends StatefulWidget {
  const RandomNumber({super.key});

  @override
  State<RandomNumber> createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber> {
  final _minimumTextEditingController = TextEditingController();
  final _maximumTextEditingController = TextEditingController();
  var _randomNumber = "0";

  void _generateRandomNumber() {
    final minimum = int.tryParse(_minimumTextEditingController.text);
    final maximum = int.tryParse(_maximumTextEditingController.text);

    if (minimum == null || maximum == null) {
      setState(() {
        _randomNumber = "Invalid number";
      });
      return;
    }

    final rng = Random();
    while (true) {
      var randomNumber = rng.nextInt(maximum);

      if (randomNumber >= minimum) {
        setState(() {
          _randomNumber = randomNumber.toString();
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minimumTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Minimum"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    controller: _maximumTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Maximum"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _generateRandomNumber,
                    child: const Text("Generate"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _randomNumber.toString(),
                    style: const TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
