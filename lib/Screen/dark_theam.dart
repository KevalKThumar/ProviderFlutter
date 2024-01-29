import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Provider/dark.provider.dart';

class DarkTheam extends StatelessWidget {
  const DarkTheam({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dark Theam"),
      ),
      body: Center(
        child: Column(
          children: [
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.changeTheme,
              title: "Light theme".text.size(15).make(),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.changeTheme,
              title: "Dark theme".text.size(15).make(),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.changeTheme,
              title: "System theme".text.size(15).make(),
            ),
            const Icon(
              Icons.favorite,
              size: 50,
            ).p16(),
          ],
        ),
      ),
    );
  }
}
