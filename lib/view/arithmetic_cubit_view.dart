import 'package:bloc_test/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticCubitView extends StatelessWidget {
  ArithmeticCubitView({super.key});

  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Cubit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _firstNumberController,
                decoration: const InputDecoration(
                  labelText: 'First Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _secondNumberController,
                decoration: const InputDecoration(
                  labelText: 'Second Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: BlocBuilder<ArithmeticCubit, int>(
                  builder: (context, state) {
                    return Text(
                      "Result: $state",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    final firstNumber = int.parse(_firstNumberController.text);
                    final secondNumber =
                        int.parse(_secondNumberController.text);
                    context
                        .read<ArithmeticCubit>()
                        .add(firstNumber, secondNumber);
                  }
                },
                child: const Text('Add'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    final firstNumber = int.parse(_firstNumberController.text);
                    final secondNumber =
                        int.parse(_secondNumberController.text);
                    context
                        .read<ArithmeticCubit>()
                        .subtract(firstNumber, secondNumber);
                  }
                },
                child: const Text('Subtract'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    final firstNumber = int.parse(_firstNumberController.text);
                    final secondNumber =
                        int.parse(_secondNumberController.text);
                    context
                        .read<ArithmeticCubit>()
                        .multiply(firstNumber, secondNumber);
                  }
                },
                child: const Text('Multiply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
