import 'package:flutter/material.dart';
import 'package:new_application/domain/entities/article.dart';
import 'package:new_application/presentation/ui/views/news_page.dart';

class NewsCardWidget extends StatelessWidget {
  final Article article;
  const NewsCardWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return NewsPage(model: article);
        }));
      },
      child: SizedBox(
        height: 200,
        child: Row(
          children: [
            Container(
              width: 140,
              height: 180,
              padding: const EdgeInsets.all(7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: article.urlToImage != null
                    ? Image.network(
                        article.urlToImage as String,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/no_image.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/images/no_image.jpg',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 160,
                child: Column(
                  children: [
                    Text(
                      article.title.toString(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Butler',
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.description.toString(),
                      maxLines: 2,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          article.publishedAt.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
