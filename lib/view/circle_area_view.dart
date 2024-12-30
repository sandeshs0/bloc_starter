import 'package:bloc_test/cubit/circle_area_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircleAreaScreen extends StatefulWidget {
  const CircleAreaScreen({super.key});

  @override
  _CircleAreaScreenState createState() => _CircleAreaScreenState();
}

class _CircleAreaScreenState extends State<CircleAreaScreen> {
  final TextEditingController radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CircleAreaCubit>(
      create: (context) => CircleAreaCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Area of Circle Calculator'),
        ),
        body: BlocBuilder<CircleAreaCubit, double>(
          builder: (context, result) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: radiusController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Radius (r)',
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
                      final radius =
                          double.tryParse(radiusController.text) ?? 0;
                      context
                          .read<CircleAreaCubit>()
                          .calculateCircleArea(radius);
                    },
                    child: const Text('Calculate Area of Circle'),
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
