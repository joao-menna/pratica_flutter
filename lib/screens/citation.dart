import 'package:flutter/material.dart';

final citations = <String>[
  "Abluble - Taz",
  "Filho de anjo e demônio, devil may cry - Player Tauz",
  "Das cinzas vou renascer, ikki de fênix - Player Tauz",
  "Bem vindo ao Minecraft, meu amigo, na jornada desse game ficará surpreendido - Player Tauz",
  "Num mundo de blocos, faço qualquer criação, onde o único limite é a imaginação - Player Tauz",
  "Bangarang! peace! bayyyh! Wah-wa-wa-wah-wa-wa-bang-bang O-ooo-ooo-ooo-o-ooo-ooo-wa, feel the evil! - Skrillex",
  "Work it, make it, do it, make us harder, better, faster, stronger, n-na-now th-that that don't kill me, can only make me stronger - Kanye West"
];

class Citation extends StatefulWidget {
  const Citation({super.key});

  @override
  State<Citation> createState() => _CitationState();
}

class _CitationState extends State<Citation> {
  String _chosenCitation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Citation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      citations.shuffle();
                      setState(() {
                        _chosenCitation = citations.first;
                      });
                    },
                    child: const Text("New citation"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Text(
                _chosenCitation,
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
