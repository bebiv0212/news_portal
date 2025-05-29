import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_portal/api/news_api.dart';
import 'package:news_portal/app/translations/app_trans.dart';

class HotTopic extends StatefulWidget {
  const HotTopic({super.key});

  @override
  State<HotTopic> createState() => _HotTopicState();
}

class _HotTopicState extends State<HotTopic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppTrans.newsList.hotTopic.tr(),
          style: GoogleFonts.jua(
            fontSize: 40, //
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 250,
          child: CarouselView.weighted(
            flexWeights: [1, 6, 1],
            children: List.generate(5, (i) {
              return ColoredBox(
                color: Color(
                  (Random().nextDouble() * 0xFFFFFF).toInt(),
                ).withValues(alpha: 1),
              );
            }),
          ),
        ),
      ],
    );
  }
}
