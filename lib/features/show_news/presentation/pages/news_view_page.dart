import 'package:flutter/material.dart';

import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';

class NewsViewPage extends StatelessWidget {
  const NewsViewPage({
    Key? key,
    required this.newsInfo,
  }) : super(key: key);

  final NewsInfo newsInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Palette.deepBlue,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsInfo.title ?? '--No Title--',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: Palette.lightGrey,
                height: 300,
                child: Image.network(
                  newsInfo.imageURL ??
                      'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _getDateFormat(newsInfo.dateTime),
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.author ?? 'No Author',
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.content ?? '--No Content Avaible--',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getDateFormat(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}
