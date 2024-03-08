import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cryptopulse/Controller/services/API/apis.dart';
import 'package:http/http.dart' as http;

class API {
  static Future getCryptoMarketData() async {
    final api = Uri.parse(cryptoMarketDataAPI);
    try {
      var response = await http
          .get(api, headers: {'Content-Type': 'application/json'}).timeout(
              const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('Connection Timed Out');
      });
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        log(decodedResponse.toString());
        List<dynamic> products = decodedResponse as List<dynamic>;
        return products;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
