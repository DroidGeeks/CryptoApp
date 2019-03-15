import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/data/constants.dart';
import 'package:flutter_crypto/data/crypto_data.dart';
import 'package:flutter_crypto/modules/crypto_presenter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoListContract {
  CryptoListPresenter _presenter;
  List<Crypto> currencies;

  bool _isLoading;

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _loadCurrencies();
  }

  void _loadCurrencies() {
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("CryptoApp"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: _isLoading
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Crypto currency = currencies[index];
                final MaterialColor color = _colors[index % _colors.length];

                return _getListItemUI(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getListItemUI(Crypto currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: Text(currency.name[0]),
      ),
      title: Text(
        currency.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(currency.priceUSD, currency.percentChange1h),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
      text:
          new TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
    );
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    setState(() {
      currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {}

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      print('Settings');
    } else if (choice == Constants.Refresh) {
      _loadCurrencies();
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }
}
