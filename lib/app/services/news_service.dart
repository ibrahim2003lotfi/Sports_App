import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/news_model.dart';

class NewsService {
  final CollectionReference _col =
      FirebaseFirestore.instance.collection("sports_news");

  Future<void> addNews(NewsModel news) async {
    await _col.doc(news.id).set(news.toMap());
  }

  Stream<List<NewsModel>> getNewsStream() {
    return _col.orderBy("createdAt", descending: true).snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map((d) => NewsModel.fromMap(d.data() as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
