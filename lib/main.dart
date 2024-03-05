import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const CryptoPulse(),
    );
  }
}

class CryptoPulse extends StatefulWidget {
  const CryptoPulse({super.key});

  @override
  State<CryptoPulse> createState() => _CryptoPulseState();
}

class _CryptoPulseState extends State<CryptoPulse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
