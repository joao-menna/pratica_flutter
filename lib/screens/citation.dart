import 'package:flutter/material.dart';

const citations = <String>[
  "Abluble - Taz",
  "Filho de anjo e demônio, devil may cry - Player Tauz"
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
      body: Column(
        children: [
          Text(
            "$_chosenCitation",
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
