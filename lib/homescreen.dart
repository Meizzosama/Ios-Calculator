import 'package:calculator/components/my_button.dart';
import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Align(
                        alignment: Alignment.bottomRight,
                      ),
                      Text(
                        userInput.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MYButoon(
                                title: 'AC',
                                onPress: () {
                                  userInput = '';
                                  answer = '';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '+/-',
                                onPress: () {
                                  userInput += '+/-';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '%',
                                onPress: () {
                                  userInput += '%';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '/',
                                onPress: () {
                                  userInput += '/';
                                  setState(() {});
                                },
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MYButoon(
                                title: '7',
                                onPress: () {
                                  userInput += '7';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '8',
                                onPress: () {
                                  userInput += '8';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '9',
                                onPress: () {
                                  userInput += '9';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: 'x',
                                onPress: () {
                                  userInput += 'x';
                                  setState(() {});
                                },
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MYButoon(
                                title: '4',
                                onPress: () {
                                  userInput += '4';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '5',
                                onPress: () {
                                  userInput += '5';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '6',
                                onPress: () {
                                  userInput += '6';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '-',
                                onPress: () {
                                  userInput += '-';
                                  setState(() {});
                                },
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MYButoon(
                                title: '1',
                                onPress: () {
                                  userInput += '1';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '2',
                                onPress: () {
                                  userInput += '2';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '3',
                                onPress: () {
                                  userInput += '3';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '+',
                                onPress: () {
                                  userInput += '+';
                                  setState(() {});
                                },
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MYButoon(
                                title: '0',
                                onPress: () {
                                  userInput += '0';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '.',
                                onPress: () {
                                  userInput += '.';
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: 'DEL',
                                onPress: () {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                  setState(() {});
                                },
                              ),
                              MYButoon(
                                title: '=',
                                onPress: () {
                                  equalPres();
                                  setState(() {});
                                },
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finaluserInput = userInput;
    finaluserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
