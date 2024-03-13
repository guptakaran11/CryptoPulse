// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import 'package:cryptopulse/Controller/services/get_data.dart';
import 'package:cryptopulse/Model/cryptoGraphDataModel.dart';

class GraphProvider extends ChangeNotifier {
  List<CryptoGraphData> graphPoints = [];

  Future<void> fetchCryptoGraph(String id, int days) async {
    graphPoints = [];
    notifyListeners();

    List<dynamic> priceData = await API.fetchGraphData(id, days);

    List<CryptoGraphData> temp = [];
    for (var pricePoint in priceData) {
      CryptoGraphData graphPoint = CryptoGraphData.fromList(pricePoint);
      temp.add(graphPoint);
    }

    graphPoints = temp;
    notifyListeners();
  }
}
