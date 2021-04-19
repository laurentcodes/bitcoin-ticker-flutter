import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
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
  'NGN',
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
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = '4E6DD9D7-0A62-4B94-9D13-95468049DE64';
const apiKey = 'DDB951F4-DFCB-4BFA-9280-F63AB5FEADCA';

class CoinData {
  Future getCoinData(String quote) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      var res = await http.get('$coinAPIURL/$crypto/$quote?apikey=$apiKey');

      var decodedData = jsonDecode(res.body);
      double coinPrice = decodedData['rate'];

      cryptoPrices[crypto] = coinPrice.toStringAsFixed(0);
      print(cryptoPrices);
    }

    return cryptoPrices;
  }
}
