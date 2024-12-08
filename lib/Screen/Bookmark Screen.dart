import 'package:flutter/material.dart';
import '../model/new_model.dart';

class BookmarkScreen extends StatefulWidget {
  final List<NewsModel> bookmarkedArticles;

  const BookmarkScreen({Key? key, required this.bookmarkedArticles})
      : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bookmarks",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: widget.bookmarkedArticles.isEmpty
          ? const Center(
        child: Text(
          "No bookmarks yet!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: widget.bookmarkedArticles.length,
        itemBuilder: (context, index) {
          final article = widget.bookmarkedArticles[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: article.urlToImage != null
                  ? Image.network(
                article.urlToImage!,
                width: 80,
                fit: BoxFit.cover,
              )
                  : const Icon(Icons.image),
              title: Text(
                article.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                article.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    widget.bookmarkedArticles.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
