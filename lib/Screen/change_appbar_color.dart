
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/color.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeAppBarColor extends StatelessWidget {
  const ChangeAppBarColor({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);

    void changeColor(Color c) {
      colorProvider.changeColor(c);
    }

    void changeName(String c) {
      colorProvider.changeName(c);
    }

    void changeSelect() {
      colorProvider.changeSelect();
    }

    void changeBrightness() {
      colorProvider.changeBrightness();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: colorProvider.getbrightness),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            colorProvider.getname.text
                .color(Colors.white)
                .size(25)
                .make()
                .p16(),
            20.widthBox,
            ToggleButtons(
              isSelected: const [true, false],
              onPressed: (val) {
                if (val == 0) {
                  changeColor(Colors.amber);
                }
                if (val == 1) {
                  changeColor(Colors.black);
                }
              },
              children: [
                Icon(Icons.light_mode_sharp,
                    color: colorProvider.isSelect == false
                        ? Colors.white
                        : Colors.black),
                const Icon(Icons.dark_mode),
              ],
            ),
          ],
          centerTitle: true,
          title: "Change Appbar Color".text.make(),
          backgroundColor: colorProvider.currentColor,
        ),
        body: Column(
          children: [
            RadioListTile(
              title: "blue".text.color(colorProvider.currentColor).make(),
              value: Colors.blue,
              groupValue: colorProvider.color,
              onChanged: (val) {
                changeName("blue");
                changeColor(val!);
              },
            ),
            RadioListTile(
              title: "black".text.color(colorProvider.currentColor).make(),
              value: Colors.black,
              groupValue: colorProvider.color,
              onChanged: (color) {
                changeName("black");
                changeColor(color!);
              },
            ),
            RadioListTile(
              title: "deepPurple".text.color(colorProvider.currentColor).make(),
              value: Colors.deepPurple,
              groupValue: colorProvider.color,
              onChanged: (color) {
                changeName("deepPurple");
                changeColor(color!);
              },
            ),
            RadioListTile(
              title: "orange".text.color(colorProvider.currentColor).make(),
              value: Colors.orange,
              groupValue: colorProvider.color,
              onChanged: (color) {
                changeName("orange");
                changeColor(color!);
              },
            ),
            RadioListTile(
              title: "green".text.color(colorProvider.currentColor).make(),
              value: Colors.green,
              groupValue: colorProvider.color,
              onChanged: (color) {
                changeName("green");
                changeColor(color!);
              },
            ),
            CheckboxListTile(
                title: "change theme".text.make(),
                value: colorProvider.isSelect,
                onChanged: (val) {
                  changeSelect();
                  changeBrightness();
                })
          ],
        ),
      ),
    );
  }
}
