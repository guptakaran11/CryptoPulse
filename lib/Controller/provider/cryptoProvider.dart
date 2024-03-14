// ignore_for_file: file_names
import 'dart:developer';
import 'dart:async';
import 'package:cryptopulse/Controller/services/get_data.dart';
import 'package:cryptopulse/Controller/services/localStorage/localStorage.dart';
import 'package:flutter/material.dart';
import '../../Model/cryptoDataModel.dart';

class CryptoDataProvider with ChangeNotifier {
  bool isloading = true;
  List<CryptoDataModel> cryptoData = [];
  CryptoDataModel currentCrypto = CryptoDataModel();
  bool fetchingCurrentCrypto = true;
  List<String> wishlist = [];
  bool status = false;

  CryptoDataProvider() {
    fetchData();
    fetchLatestData();
  }
  // ! getLatest Crypto Data

  fetchWishList() async {
    wishlist = await LocalStorage.fetchWishList();
    notifyListeners();
  }

  updateWishlist(String id, CryptoDataModel crypto) async {
    if (wishlist.contains(id)) {
      wishlist.remove(id);
      int indexOfCrypto = cryptoData.indexOf(crypto);
      cryptoData[indexOfCrypto].addedToWishlist = false;
      await LocalStorage.removeFromWishlist(id);
      notifyListeners();
    } else {
      wishlist.add(id);
      int indexOfCrypto = cryptoData.indexOf(crypto);
      cryptoData[indexOfCrypto].addedToWishlist = true;
      await LocalStorage.addToWishlist(id);
      notifyListeners();
    }
  }

  Future<void> fetchData() async {
    List<dynamic> markets = await API.getCryptoMarketData();
    wishlist = await LocalStorage.fetchWishList();
    notifyListeners();
    log(wishlist.toString());

    List<CryptoDataModel> temp = [];
    for (var market in markets) {
      CryptoDataModel newCrypto = CryptoDataModel.fromJSON(market);
      if (wishlist.contains(newCrypto.id)) {
        newCrypto.addedToWishlist = true;
      }
      temp.add(newCrypto);
    }

    cryptoData = temp;
    isloading = false;
    notifyListeners();
  }

  updateFetchingCurrentCryptoStatus(bool data) {
    fetchingCurrentCrypto = data;
    notifyListeners();
  }

  fetchingCryptoByID(String id) {
    updateFetchingCurrentCryptoStatus(true);
    CryptoDataModel crypto =
        cryptoData.where((element) => element.id == id).toList()[0];
    currentCrypto = crypto;
    notifyListeners();
    updateFetchingCurrentCryptoStatus(false);
  }

  fetchLatestData() {
    fetchData();
    Future.delayed(const Duration(seconds: 6), () {
      fetchLatestData();
    });
  }
}
