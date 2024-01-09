import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/catelog.provider.dart';
import 'package:provider_learn/Provider/color.provider.dart';
import 'package:provider_learn/Provider/counter.provider.dart';
import 'package:provider_learn/Screen/change_appbar_color.dart';
import 'package:provider_learn/Screen/counter_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => CatelogProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
      ],
      child: const ChangeAppBarColor(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(counterProvider: counterProvider),
    );
  }
}
