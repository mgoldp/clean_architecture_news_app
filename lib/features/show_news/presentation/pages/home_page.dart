import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:news_app/features/show_news/presentation/pages/components/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<NewsCubit>().fetchNews(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(
            color: Palette.deepBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              onSubmitted: (searchText) {
                if (searchText.trim() == '') {
                  context.read<NewsCubit>().fetchNews(null);
                } else {
                  context.read<NewsCubit>().fetchNews(searchText);
                }
              },
              style: const TextStyle(
                color: Palette.deepBlue,
                fontSize: 14,
              ),
              cursorColor: Palette.deepBlue,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Palette.lightGrey,
                  size: 20,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Palette.lightGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Palette.deepBlue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsInitial) {
                  return const Text(
                    'Top News',
                    style: TextStyle(
                      color: Palette.deepBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is NewsInitialSearch) {
                  return const Text(
                    'Search News',
                    style: TextStyle(
                      color: Palette.deepBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsInitial) {
                    return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          newsInfo: state.news[index],
                        );
                      },
                    );
                  } else if (state is NewsInitialSearch) {
                    return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          newsInfo: state.news[index],
                        );
                      },
                    );
                  } else if (state is NewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Palette.deepBlue),
                    );
                  } else {
                    return Center(
                      child: IconButton(
                        onPressed: () {
                          context.read<NewsCubit>().fetchNews(null);
                        },
                        icon: const Icon(
                          Icons.replay_outlined,
                          color: Palette.deepBlue,
                          size: 24,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
