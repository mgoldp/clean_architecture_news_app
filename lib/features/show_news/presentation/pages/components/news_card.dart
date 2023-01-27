import 'package:flutter/material.dart';

import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/features/show_news/presentation/pages/news_view_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.newsInfo,
  }) : super(key: key);

  final NewsInfo newsInfo;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NewsViewPage(
              newsInfo: newsInfo,
            );
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 300,
        width: deviceWidth - (2 * 16),
        child: Stack(children: [
          Container(
            height: 260,
            color: Palette.lightGrey,
            child: Image.network(
              newsInfo.imageURL ??
                  'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              height: 80,
              width: deviceWidth - (2 * 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    newsInfo.title ?? '--No Title--',
                    maxLines: 2,
                    style: const TextStyle(
                      color: Palette.deepBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
