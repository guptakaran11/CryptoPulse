// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:cryptopulse/View/cryptoDataScreen.dart';

import '../Controller/provider/cryptoProvider.dart';
import '../Model/cryptoDataModel.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 1.h,
          ),
          child: Consumer<CryptoDataProvider>(
            builder: (context, cryptoDataProvider, child) {
              if (cryptoDataProvider.isloading == true) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: cryptoDataProvider.cryptoData.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    CryptoDataModel currentCryptoData =
                        cryptoDataProvider.cryptoData[index];
                    return CryptoTile(currentCryptoData: currentCryptoData);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class CryptoTile extends StatelessWidget {
  final CryptoDataModel currentCryptoData;
  const CryptoTile({super.key, required this.currentCryptoData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CryptoDataScreen(
              cryptoId: currentCryptoData.id!,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 5.w,
          backgroundColor: Colors.white12,
          child: Image.network(currentCryptoData.image!),
        ),
        title: Text(
          currentCryptoData.name!,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          currentCryptoData.currentPrice!.toStringAsFixed(2),
          style: TextStyle(
            color: currentCryptoData.priceChange24! > 0
                ? Colors.green
                : Colors.red,
          ),
        ),
      ),
    );
  }
}
