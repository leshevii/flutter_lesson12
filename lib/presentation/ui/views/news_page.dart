import 'package:flutter/material.dart';
import 'package:new_application/domain/entities/article.dart';

class NewsPage extends StatelessWidget {
  Article model;
  NewsPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title.toString())),
      body: Column(
        children: [
          model.urlToImage != null
              ? Image.network(model.urlToImage!)
              : Container(),
          const SizedBox(height: 10),
          model.content != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(model.content!),
                )
              : Container(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                model.publishedAt != null
                    ? Text(model.publishedAt!)
                    : Container(),
                model.author != null ? Text(model.author!) : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
