import 'package:flutter/material.dart';

// Start import halaman aplikasi
import 'components/ui/bottonNav.dart'; // Fixed the import path
// End import halaman aplikasi

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Daftar Makanan', // Fixed the title for consistency
      // Application theme data
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const BottomNav(), // Fixed the class name
    );
  }
}
