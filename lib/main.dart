import 'package:auxzon_task/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/string_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.foodDeliveryText,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFD55049),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD55049),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
        ),
      ),
      home: const ResponsiveBuilder(child: SplashScreen()),
    );
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget child;

  const ResponsiveBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        final padding = MediaQuery.of(context).padding;
        final width = size.width - padding.left - padding.right;

        const breakpoint = 600.0;

        if (width > breakpoint) {
          return Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: breakpoint,
              child: child,
            ),
          );
        } else {
          return child;
        }
      },
    );
  }
}