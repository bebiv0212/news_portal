import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:news_portal/api/models/news_data.dart';
import 'package:news_portal/api/news_api.dart';
import 'package:news_portal/app/translations/app_trans.dart';

class LastestNews extends StatelessWidget {
  const LastestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Text(
          AppTrans.newsList.lastestNews.tr(),
          style: GoogleFonts.jua(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        FutureBuilder(
          future: NewsApi.getLastest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 150,
                child: Center(
                  child: CircularProgressIndicator(year2023: false),
                ),
              );
            }
            final LastestNews = snapshot.data ?? <NewsData>[];
            if (LastestNews.isEmpty) {
              return Center(child: Text(AppTrans.newsList.noData.tr()));
            }

            return GridView.builder(
              itemCount: LastestNews.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                final item = LastestNews[index];
                return Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(LucideIcons.imageOff, size: 25),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      item.pubDate,
                      style: TextStyle(
                        fontSize: 12, //
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
