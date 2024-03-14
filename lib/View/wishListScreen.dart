import 'package:cryptopulse/Controller/provider/cryptoProvider.dart';
import 'package:cryptopulse/Model/cryptoDataModel.dart';
import 'package:cryptopulse/View/cryptoListingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoDataProvider>(
      builder: (context, marketProvider, index) {
        List<CryptoDataModel> wishlist = marketProvider.cryptoData
            .where((element) => element.addedToWishlist == true)
            .toList();

        if (wishlist.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await marketProvider.fetchData();
            },
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                CryptoDataModel currentCrypto = wishlist[index];
                return CryptoTile(currentCryptoData: currentCrypto);
              },
            ),
          );
        } else {
          return const Center(
            child: Text(
              "No CryptoCurrency added to Wishlist",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          );
        }
      },
    );
  }
}
