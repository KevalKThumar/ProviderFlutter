import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CounterWithValueNotifier extends StatelessWidget {
  const CounterWithValueNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> count = ValueNotifier<int>(0);
    ValueNotifier<bool> isVisible = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: "Counter with ValueNotifier".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              builder: (context, value, child) {
                return "Value : $value".text.xl3.makeCentered();
              },
              valueListenable: count,
            ),
            20.heightBox,
            ValueListenableBuilder(
              valueListenable: isVisible,
              builder: (context, value, child) {
                return TextField(
                  decoration: InputDecoration(
                    hintText: "password",
                    border: const OutlineInputBorder(),
                    label: "Password".text.make(),
                    suffixIcon: Icon(
                      value ? Icons.visibility : Icons.visibility_off,
                    ).onInkTap(() {
                      isVisible.value = !value;
                    }),
                  ),
                  obscureText: value,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value = count.value + 1;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
