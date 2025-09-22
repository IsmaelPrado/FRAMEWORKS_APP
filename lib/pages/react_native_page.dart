import 'package:flutter/material.dart';

class ReactNativePage extends StatelessWidget {
  const ReactNativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("React Native")),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "React Native es un framework de Facebook que permite crear apps nativas usando JavaScript y React.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
