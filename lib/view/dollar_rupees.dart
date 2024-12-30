import 'package:bloc_test/cubit/dollar_rupees_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DollarRupeesScreen extends StatefulWidget {
  const DollarRupeesScreen({super.key});

  @override
  _DollarRupeesScreenState createState() => _DollarRupeesScreenState();
}

class _DollarRupeesScreenState extends State<DollarRupeesScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DollarRupeesCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dollar Rupees Conversion'),
        ),
        body: BlocBuilder<DollarRupeesCubit, double>(
          builder: (context, result) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: rateController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Exchange Rate',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Converted: Rs. $result',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final amount =
                          double.tryParse(amountController.text) ?? 0;
                      final rate = double.tryParse(rateController.text) ?? 0;

                      context
                          .read<DollarRupeesCubit>()
                          .convertToRupees(amount, rate);
                    },
                    child: const Text('Convert'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
