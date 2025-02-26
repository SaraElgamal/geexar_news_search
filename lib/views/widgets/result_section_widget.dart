import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/views/widgets/news_list_widget.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const NewsList(
          title: 'Results for Keyword 1',
          itemCount: 5,
        ),
         Divider(height: 32.h, thickness: 2),
       const NewsList(
          title: 'Results for Keyword 2',
          itemCount: 5,
        ),
      ],
    );
  }
}
