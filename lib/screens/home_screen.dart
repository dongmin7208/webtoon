import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/service/api_service.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
            return makeList(snapshot);
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

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
