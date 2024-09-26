import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/walk_record_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'walk record',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: WalkRecordScreen(date: DateTime.now().toString()),
    );
  }
}
