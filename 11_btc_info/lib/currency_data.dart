import 'api_communicator.dart';

const List<String> fiatList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'DOGE',
];

class SingleCurrencyData {
  SingleCurrencyData({required this.currentFiat});

  String currentFiat;

  String rateBTC = 'wait';
  String rateETH = 'wait';
  String rateLTC = 'wait';
  String rateDOGE = 'wait';

  Future getExchange() async {
    APICommunicator comm = APICommunicator(quote: currentFiat);

    rateBTC = await comm.getExchangeRate(base: 'BTC');
    rateETH = await comm.getExchangeRate(base: 'ETH');
    rateLTC = await comm.getExchangeRate(base: 'LTC');
    rateDOGE = await comm.getExchangeRate(base: 'DOGE');
  }
}
