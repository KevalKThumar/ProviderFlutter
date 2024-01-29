import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/auth_provider.dart';
import 'package:provider_learn/Provider/catelog.provider.dart';
import 'package:provider_learn/Provider/color.provider.dart';
import 'package:provider_learn/Provider/counter.provider.dart';
import 'package:provider_learn/Provider/dark.provider.dart';
import 'package:provider_learn/Provider/slider.provider.dart';
import 'package:provider_learn/Screen/catlog_screen.dart';
import 'package:provider_learn/Screen/change_appbar_color.dart';
import 'package:provider_learn/Screen/counter_screen.dart';
import 'package:provider_learn/Screen/counter_with_valuenotifier.dart';
import 'package:provider_learn/Screen/dark_theam.dart';
import 'package:provider_learn/Screen/home_page.dart';
import 'package:provider_learn/Screen/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Screen/cart_screen.dart';
import 'Screen/slider_screen.dart';
import 'Widget/theme_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => CatelogProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final themechange = Provider.of<ThemeChangerProvider>(context);
        final counterProvider = Provider.of<CounterProvider>(context);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themechange.themeMode,
            theme: lightThemeData(),
            darkTheme: darkThemeData(),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomePage(),
              '/catlog': (context) =>  CatlogPage(),
              '/counter': (context) =>  CounterScreen(
                    counterProvider: counterProvider,
                  ),
              '/slider': (context) => const SliderPage(),
              '/change_appbar_color': (context) => const ChangeAppBarColor(),
              '/dark_theam': (context) => const DarkTheam(),
              '/counter_with_valuenotifier': (context) =>
                  const CounterWithValueNotifier(),
            });
      },
    );
  }
}
