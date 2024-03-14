import 'package:cryptopulse/View/cryptoListingScreen.dart';
import 'package:cryptopulse/View/wishListScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(
                text: 'Currency',
              ),
              Tab(
                text: 'WishList',
              ),
            ],
          ),
          title: const Text(
            'Hello! 👋',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            CryptoListScreen(),
            WishListScreen(),
          ],
        ),
      ),
    );
  }
}
