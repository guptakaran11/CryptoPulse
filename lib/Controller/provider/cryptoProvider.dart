// ignore_for_file: file_names
import 'package:cryptopulse/Controller/services/get_data.dart';
import 'package:flutter/material.dart';
import '../../Model/cryptoDataModel.dart';

class CryptoDataProvider with ChangeNotifier {
  bool isloading = true;
  List<CryptoDataModel> cryptoData = [];

  CryptoDataProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> markets = await API.getCryptoMarketData();

    List<CryptoDataModel> temp = [];
    for (var market in markets) {
      CryptoDataModel newCrypto = CryptoDataModel.fromJSON(market);

      temp.add(newCrypto);
    }

    cryptoData = temp;
    isloading = false;
    notifyListeners();
  }
}
