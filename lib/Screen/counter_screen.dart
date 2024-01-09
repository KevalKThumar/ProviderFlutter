import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/counter.provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    super.key,
    required this.counterProvider,
  });

  final CounterProvider counterProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your counter is:'),
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text('${value.count}');
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterProvider.increment();
            },
            tooltip: "Increment",
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterProvider.decrement();
            },
            tooltip: "Decrement",
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
