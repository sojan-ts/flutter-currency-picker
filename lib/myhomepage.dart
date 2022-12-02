import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var countrycodephone = '₹';
  var countrycurrencycode = 'INR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(
                prefixIcon: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCurrencyPicker(
                            context: context,
                            onSelect: (Currency country) {
                              print(country.symbol);
                              setState(() {
                                countrycodephone = country.symbol;
                                print(countrycodephone);
                                countrycurrencycode = country.flag!;
                              });
                            },
                            currencyFilter: <String>[
                              'EUR',
                              'GBP',
                              'USD',
                              'AUD',
                              'CAD',
                              'JPY',
                              'HKD',
                              'CHF',
                              'SEK',
                              'INR'
                            ],
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 22, 22),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                countrycodephone + " " + countrycurrencycode,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                border: InputBorder.none,
                labelText: "Enter amount"),
          )
        ],
      ),
    );
  }
}
