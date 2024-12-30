import 'package:bloc_test/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubitScreen extends StatefulWidget {
  const SimpleInterestCubitScreen({super.key});

  @override
  _SimpleInterestCubitScreenState createState() =>
      _SimpleInterestCubitScreenState();
}

class _SimpleInterestCubitScreenState extends State<SimpleInterestCubitScreen> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimpleInterestCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Interest Cubit'),
        ),
        body: BlocBuilder<SimpleInterestCubit, double>(
          builder: (context, result) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: principalController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Principal (P)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: rateController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Rate of Interest (R)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: timeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Time (T)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Result: $result',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final principal =
                          double.tryParse(principalController.text) ?? 0;
                      final rate = double.tryParse(rateController.text) ?? 0;
                      final time = double.tryParse(timeController.text) ?? 0;
                      context
                          .read<SimpleInterestCubit>()
                          .calculateSimpleInterest(principal, rate, time);
                    },
                    child: const Text('Calculate Simple Interest'),
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