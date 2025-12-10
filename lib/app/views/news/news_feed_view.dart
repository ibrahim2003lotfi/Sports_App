import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/news_service.dart';
import '../../models/news_model.dart';

class NewsFeedView extends StatelessWidget {
  NewsFeedView({super.key});

  final _service = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("آخر الأخبار الرياضية")),
      body: StreamBuilder<List<NewsModel>>(
        stream: _service.getNewsStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final news = snapshot.data!;

          if (news.isEmpty) {
            return const Center(child: Text("لا يوجد أخبار حالياً"));
          }

          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, i) {
              final item = news[i];

              return Card(
                margin: const EdgeInsets.all(12),
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
