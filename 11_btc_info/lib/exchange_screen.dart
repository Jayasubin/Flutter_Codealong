import 'package:flutter/material.dart';
import 'currency_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'output_card.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentFiat = 'USD';

  String rateBTC = 'wait';
  String rateETH = 'wait';
  String rateLTC = 'wait';
  String rateDOGE = 'wait';

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropdownCurrencies = [];
    for (String currency in fiatList) {
      var newCurrency = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownCurrencies.add(newCurrency);
    }

    return DropdownButton<String>(
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
      iconSize: 35,
      elevation: 16,
      value: currentFiat,
      style: const TextStyle(fontSize: 20),
      items: dropdownCurrencies,
      onChanged: (value) {
        setState(() {
          currentFiat = value.toString();

          rateBTC = 'wait';
          rateETH = 'wait';
          rateLTC = 'wait';
          rateDOGE = 'wait';
        });
      },
    );
  }

  CupertinoPicker getPicker() {
    List<Text> pickerCurrencies = [];
    for (String currency in fiatList) {
      var newCountry = Text(currency);
      pickerCurrencies.add(newCountry);
    }
    return CupertinoPicker(
      backgroundColor: Colors.white10,
      itemExtent: 45,
      children: pickerCurrencies,
      onSelectedItemChanged: (value) {
        setState(
          () {
            currentFiat = value.toString();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Crypto Exchange'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutputCard(
                  currentCrypto: 'BTC',
                  exchangeRate: rateBTC,
                  currentFiat: currentFiat,
                ),
                OutputCard(
                  currentCrypto: 'ETH',
                  exchangeRate: rateETH,
                  currentFiat: currentFiat,
                ),
                OutputCard(
                  currentCrypto: 'LTC',
                  exchangeRate: rateLTC,
                  currentFiat: currentFiat,
                ),
                OutputCard(
                  currentCrypto: 'DOGE',
                  exchangeRate: rateDOGE,
                  currentFiat: currentFiat,
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Platform.isIOS ? getPicker() : getDropDownButton()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      SingleCurrencyData newData =
                          SingleCurrencyData(currentFiat: currentFiat);
                      await newData.getExchange();
                      setState(() {
                        rateBTC = newData.rateBTC;
                        rateETH = newData.rateETH;
                        rateLTC = newData.rateLTC;
                        rateDOGE = newData.rateDOGE;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Get current rate',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
