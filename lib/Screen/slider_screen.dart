import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/slider.provider.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // print("Build");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Slider"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(
              builder: (context, sliderProvider, child) {
                // print("Slider only build");
                return Slider(
                  value: sliderProvider.value,
                  onChanged: (val) {
                    sliderProvider.getValue(val);
                  },
                  min: 0,
                  max: 1,
                );
              },
            ),
            Consumer<SliderProvider>(
              builder: (context, sliderProvider, child) {
                // print("Row only build");
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.blue.withOpacity(sliderProvider.value),
                        child: const Center(child: Text("container 1")),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.red.withOpacity(sliderProvider.value),
                        child: const Center(child: Text("container 1")),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ));
  }
}

double value = 0.5;
