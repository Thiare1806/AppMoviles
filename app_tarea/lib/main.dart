import 'package:flutter/material.dart';
import 'package:app_tarea/login_fields.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login y tareas",
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),

      home: const Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: SafeArea(child: LoginFields()),
        ),
      ),
    );
  }
}
