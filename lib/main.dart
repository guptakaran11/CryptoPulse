import 'package:cryptopulse/Controller/provider/cryptoProvider.dart';
import 'package:cryptopulse/Controller/provider/graphProvider.dart';
import 'package:cryptopulse/View/homeScreen/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
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
              create: (context) => CryptoDataProvider(),
            ),
            ChangeNotifierProvider<GraphProvider>(
              create: (context) => GraphProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(useMaterial3: true),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
