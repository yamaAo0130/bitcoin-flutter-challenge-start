//TODO: Add your imports here.
//2. Import the required packages.
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
const apiKey = '8C27AAF3-EA29-4C67-A74A-3007003FE69A';

class CoinData {
  //TODO: Create your getCoinData() method here.
  //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
  Future getCoinData() async{
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    //5. Make a GET request to the URL and wait for the response.
    http.Response response = await http.get(Uri.parse(requestURL));

    //6. Check that the request was successful.
    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(response.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}
