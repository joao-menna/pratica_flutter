import 'package:flutter/material.dart';
import 'package:pratica_flutter/screens/bmi_calculator.dart';
import 'package:pratica_flutter/screens/calculator.dart';
import 'package:pratica_flutter/screens/citation.dart';
import 'package:pratica_flutter/screens/money_converter.dart';
import 'package:pratica_flutter/screens/stop_watch.dart';
import 'package:pratica_flutter/screens/todo_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const MoneyConverter();
                      },
                    ),
                  );
                },
                child: const Text("Money Converter"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Calculator();
                      },
                    ),
                  );
                },
                child: const Text("Calculator"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const TodoList();
                      },
                    ),
                  );
                },
                child: const Text("To-Do List"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const StopWatch();
                      },
                    ),
                  );
                },
                child: const Text("Stopwatch"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Citation();
                      },
                    ),
                  );
                },
                child: const Text("Citation"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const BmiCalculator();
                      },
                    ),
                  );
                },
                child: const Text("BMI Calculator"),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
