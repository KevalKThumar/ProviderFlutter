import 'package:flutter/material.dart';
import 'package:provider_learn/Widget/theme_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buttonElevated(context, "Catlog", '/catlog'),
              buttonElevated(context, "Slider", '/slider'),
              buttonElevated(
                  context, "ChangeAppBar Color", '/change_appbar_color'),
              buttonElevated(context, "DarkTheam", '/dark_theam'),
              buttonElevated(context, "CounterValuenotifier",
                  '/counter_with_valuenotifier'),
            ],
          ),
        ),
      ),
    );
  }
}
