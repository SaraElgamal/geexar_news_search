import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/views/widgets/text_field_search_widget.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchField(label: 'Keyword 1'),
         SizedBox(height: 16.h),
        const SearchField(label: 'Keyword 2'),
      ],
    );
  }
}
