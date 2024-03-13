import 'package:cryptopulse/Controller/provider/cryptoProvider.dart';
import 'package:cryptopulse/Model/cryptoDataModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoDataScreen extends StatefulWidget {
  final String cryptoId;
  const CryptoDataScreen({super.key, required this.cryptoId});

  @override
  State<CryptoDataScreen> createState() => _CryptoDataScreenState();
}

class _CryptoDataScreenState extends State<CryptoDataScreen> {
  List<String> timePeriod = ['1D', '5D', '1M', '1Y'];
  String selectedTimePeriod = '1D';
  TrackballBehavior trackBallBehavior = TrackballBehavior(enable: true);
  CrosshairBehavior crosshairBehavior = CrosshairBehavior(enable: true);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  getCryptoDataTitles(int index) {
    switch (index) {
      case 0:
        return '% Change 24HR';
      case 1:
        return '₹ Change 24HR';
      case 2:
        return 'Price';
      case 3:
        return 'Market Cap';
      case 4:
        return '24HR Low';
      case 5:
        return '24HR High';
      case 6:
        return 'ATL';
      case 7:
        return 'ATH';
    }
  }

  getCryptoDataValue(CryptoDataModel crypto, int index) {
    switch (index) {
      case 0:
        return crypto.priceChangePercentage24!.toStringAsFixed(2);
      case 1:
        return crypto.priceChange24!.toStringAsFixed(2);
      case 2:
        return crypto.currentPrice!.toStringAsFixed(2);
      case 3:
        return crypto.marketCap!.toString();
      case 4:
        return crypto.low24!.toStringAsFixed(2);
      case 5:
        return crypto.high24!.toStringAsFixed(2);
      case 6:
        return crypto.atl!.toStringAsFixed(2);
      case 7:
        return crypto.ath!.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
