import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Currency? _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Picker"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedCurrency != null)
              Text(
                  "Selected Currency code: ${_selectedCurrency!.code} and name : ${_selectedCurrency!.name}"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: const Text("Select Currency"),
                onPressed: () {
                  showCurrencyPicker(
                      context: context,
                      onSelect: (Currency currency) {
                        setState(() {
                          _selectedCurrency = currency;
                        });
                      },
                      currencyFilter: ["USD", "EUR", "GBP", "INR"],
                      showSearchField: false,
                      showFlag: false,
                      showCurrencyCode: false,
                      showCurrencyName: false);
                })
          ],
        ),
      ),
    );
  }
}
