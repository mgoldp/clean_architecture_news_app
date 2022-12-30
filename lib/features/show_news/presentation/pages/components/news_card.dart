import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 300,
      width: deviceWidth - (2 * 16),
      child: Stack(children: [
        Container(
          height: 260,
          color: Palette.lightGrey,
          child: Image.network(
            'https://images.unsplash.com/photo-1570913149827-d2ac84ab3f9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
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
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'News Title',
                  maxLines: 2,
                  style: TextStyle(
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
    );
  }
}
