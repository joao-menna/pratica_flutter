import 'package:flutter/material.dart';

class NameGiveaway extends StatefulWidget {
  const NameGiveaway({super.key});

  @override
  State<NameGiveaway> createState() => _NameGiveawayState();
}

class _NameGiveawayState extends State<NameGiveaway> {
  final _nameTextEditingController = TextEditingController();
  var _chosen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Giveaway"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameTextEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Names (separated by comma)",
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final names = _nameTextEditingController.text.split(",");
                      names.shuffle();
                      setState(() {
                        _chosen = names.first.trim();
                      });
                    },
                    child: const Text("Giveaway"),
                  ),
                ),
              ],
            ),
            Text(_chosen),
          ],
        ),
      ),
    );
  }
}
