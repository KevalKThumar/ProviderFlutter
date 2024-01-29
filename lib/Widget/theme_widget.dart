import 'package:flutter/material.dart';

ThemeData darkThemeData() {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigo[400], // Change to your preferred color
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.red,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.pink, // Change to your preferred color
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo[400],
    ),
  );
}

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal[400], // Change to your preferred color
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.blue, // Change to your preferred color
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.teal[400],
    ),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.teal[400],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal[400]),
      ),
    ),
  );
}

SizedBox buttonElevated(
  BuildContext context,
  String title,
  String routeName,
) {
  return SizedBox(
    height: 50,
    width: 200,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    ),
  );
}
