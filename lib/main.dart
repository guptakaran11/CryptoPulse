import 'package:cryptopulse/Controller/provider/cryptoProvider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<CryptoDataProvider>(
              create: (_) => CryptoDataProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(
              useMaterial3: true,
            ),
            home: const CryptoPulse(),
          ),
        );
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
          child: Column(
            children: [
              const Text(
                'Hello! 👋',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Consumer<CryptoDataProvider>(
                builder: (context, cryptoData, child) {
                  if (cryptoData.isloading == true) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return const Text(
                      'data',
                      style: TextStyle(color: Colors.white),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
