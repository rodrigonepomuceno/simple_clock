// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Digital Clock Demo - DigiClock',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime now;
  late Timer _timer;
  bool openState = true;
  String hrs = '00';
  String min = '00';
  String sec = '00';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(
      () {
        now = DateTime.now();
        hrs = now.hour.toString().padLeft(2, '0');
        min = now.minute.toString().padLeft(2, '0');
        sec = now.second.toString().padLeft(2, '0');

        _timer = Timer(
          const Duration(seconds: 1) - Duration(milliseconds: now.millisecond),
          _updateTime,
        );
      },
    );
  }

  Widget buildBox(TextStyle txtStyle, String value) {
    Color boxColor = Colors.blue.shade100;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: boxColor,
      ),
      height: 142,
      width: 142,
      child: Center(
        child: Text(
          value,
          style: txtStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle txtStyle = TextStyle(fontSize: 80, color: Colors.blue.shade700);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildBox(txtStyle, hrs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(':', style: txtStyle),
            ),
            buildBox(txtStyle, min),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(':', style: txtStyle),
            ),
            buildBox(txtStyle, sec),
          ],
        ),
      ),
    );
  }
}
