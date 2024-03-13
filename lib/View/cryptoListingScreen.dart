import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                builder: (context, cryptoDataProvider, child) {
                  if (cryptoDataProvider.isloading == true) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    log(cryptoDataProvider.cryptoData.length.toString());
                    return Expanded(
                      child: ListView.builder(
                        itemCount: cryptoDataProvider.cryptoData.length,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          CryptoDataModel currentCryptoData =
                              cryptoDataProvider.cryptoData[index];
                          return InkWell(
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
                                currentCryptoData.currentPrice!
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                  color: currentCryptoData.priceChange24! > 0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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