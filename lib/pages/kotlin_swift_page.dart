import 'package:flutter/material.dart';

class KotlinSwiftPage extends StatelessWidget {
  const KotlinSwiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kotlin / Swift")),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Kotlin es el lenguaje oficial para Android y Swift para iOS, ideales para apps nativas con máximo rendimiento.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
