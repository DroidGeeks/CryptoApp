import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_crypto/data/crypto_data.dart';

class ProdCryptoRepository implements CryptoRepository {
  String cryptoURL = "https://api.coinmarketcap.com/v1/ticker/?limit=100";
  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(cryptoURL);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;

    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error occured : [status Code : $statusCode]");
    }
    return responseBody.map((f) => new Crypto.fromMap(f)).toList();
  }
}
