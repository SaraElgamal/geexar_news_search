import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/core/constants/app_fonts.dart';
import 'package:geexar/views/widgets/result_section_widget.dart';
import 'package:geexar/views/widgets/search_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('News Search' , style: AppFonts.style16Bold,)),
      body:   Padding(
        padding:  EdgeInsets.all(16.0.h),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SearchSection(), 
           SizedBox(height: 24.h),
          const Flexible(child:  ResultsSection()),
          ],
        ),
      ),
    );
  }
}
