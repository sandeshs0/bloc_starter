import 'package:bloc_test/bloc/arithmetic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticBlocView extends StatelessWidget {
  ArithmeticBlocView({super.key});

  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Bloc'),
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
                child: BlocBuilder<ArithmeticBloc, int>(
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
              // Align(
              //   alignment: Alignment.center,
              //   child: BlocConsumer<ArithmeticCubit, int>(
              //     listener: (context, state) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text("Result: $state"),
              //         ),
              //       );
              //     },
              //     builder: (context, state) {
              //       return Text(
              //         "Result: $state",
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    final firstNumber = int.parse(_firstNumberController.text);
                    final secondNumber =
                        int.parse(_secondNumberController.text);

                    context
                        .read<ArithmeticBloc>()
                        .add(IncrementEvent(firstNumber, secondNumber));
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
                        .read<ArithmeticBloc>()
                        .add(DecrementEvent(firstNumber, secondNumber));
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
                        .read<ArithmeticBloc>()
                        .add(MultiplyEvent(firstNumber, secondNumber));
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
