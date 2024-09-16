import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final _stopWatch = Stopwatch();
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_stopWatch.elapsed.inSeconds}",
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _stopWatch.start();
                    },
                    child: const Text("Start"),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _stopWatch.stop();
                    },
                    child: const Text("Pause"),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _stopWatch.reset();
                    },
                    child: const Text("Reset"),
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
