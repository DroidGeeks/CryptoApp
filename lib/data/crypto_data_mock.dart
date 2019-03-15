import 'dart:async';

import 'package:flutter_crypto/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(name: "Bitcoin", priceUSD: "800.60", percentChange1h: "-0.7"),
  new Crypto(name: "Ethereum", priceUSD: "650.60", percentChange1h: "-0.85"),
  new Crypto(name: "Ripple", priceUSD: "300.60", percentChange1h: "-0.25"),
];
