import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const GuessNumber());
}

class GuessNumber extends StatefulWidget {
  const GuessNumber({super.key});

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  late int _targetNumber;

  @override
  void initState() {
    super.initState();
    _targetNumber = Random().nextInt(100) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBarGuessNumber(context),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Image.asset(
                  'assets/images/numbers.png',
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Guess the number',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter the number",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _targetNumber = Random().nextInt(100) + 1;
                      int guessedNumber = int.tryParse(_controller.text) ?? 0;
                      if (guessedNumber == _targetNumber) {
                        _result = "Congratulations! You guessed the number! 🎉";
                      } else if (guessedNumber < _targetNumber) {
                        _result = "Your guess is too low";
                      } else {
                        _result = "Your guess is too high";
                      }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(
                        "Guess",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    "Result: $_result",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBarGuessNumber(BuildContext context) {
    return AppBar(
        title: const Text("Guess Number"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        foregroundColor: Colors.white);
  }
}
