import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return // MultiProvider(
            // providers: [],
            // child:

            MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: const CryptoPulse(),
        );
        // );
      },
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
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 1.h,
          ),
          child: const Column(
            children: [
              Text(
                'Hello! 👋',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
