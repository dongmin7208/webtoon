import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

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
      body: FutureBuilder<List<WebtoonModel>>(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final webtoon = snapshot.data?[index];
                return ListTile(
                  title: Text(webtoon!.title),
                  // subtitle: Text(webtoon.thumb),
                  leading: Image.network(webtoon.thumb),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Failed to load data"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
