import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_stake/core/config/app_colors.dart';

import '../models/news.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'News',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const SizedBox(height: 18),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: [
              ...List.generate(
                newsList.length,
                (index) {
                  return _NewsCard(news: newsList[index]);
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 63 + MediaQuery.of(context).viewPadding.bottom),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffBF00FF).withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.url,
                height: 90,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    news.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
