import 'package:flutter/material.dart';
import 'package:webtoon/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: const Color.fromARGB(255, 71, 98, 195),
        foregroundColor: Colors.green,
        title: const Text(
          "Today's Webtoon",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  void getTodaysToons() {
    ApiService().getTodaysToons();
  }
}
// getTodaysToons

