import 'package:flutter/material.dart';

class MoneyConverter extends StatefulWidget {
  const MoneyConverter({super.key});

  @override
  State<MoneyConverter> createState() => _MoneyConverterState();
}

class _MoneyConverterState extends State<MoneyConverter> {
  final _moneyTextEditingController = TextEditingController();
  var _convertedMoney = "";

  void _convert() {
    var number = double.tryParse(
      _moneyTextEditingController.text.replaceAll(",", "."),
    );

    if (number == null) {
      setState(() {
        _convertedMoney = "Invalid money amount";
      });
      return;
    }

    number *= 5;

    setState(() {
      _convertedMoney = "\$$number";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Converter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) => _convert(),
                    controller: _moneyTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Money amount in Reais"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                IconButton(
                  onPressed: _convert,
                  icon: const Icon(Icons.send),
                )
              ],
            ),
            Text(
              _convertedMoney,
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
