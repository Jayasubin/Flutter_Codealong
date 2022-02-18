import 'package:http/http.dart' as http;
import 'dart:convert';
import 'secrets.dart';

const baseURL = 'https://rest.coinapi.io/v1/exchangerate';
String apiKey = Secrets().coinapiKey;

class APICommunicator {
  String quote;
  APICommunicator({required this.quote});

  Future<String> getExchangeRate({required String base}) async {
    http.Response apiResponse =
        await http.get(Uri.parse('$baseURL/$base/$quote?apikey=$apiKey'));

    var jsonData = jsonDecode(apiResponse.body);

    if (jsonData == null) {
      return 'unavailable';
    } else {
      double exchangeRate = jsonData['rate'];
      return exchangeRate.toStringAsFixed(2);
    }
  }
}
