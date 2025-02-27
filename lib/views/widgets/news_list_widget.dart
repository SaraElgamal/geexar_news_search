import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/models/news_model.dart';
import 'package:geexar/views/widgets/image_loader.dart';



class NewsListItem extends StatelessWidget {
  final NewsModel news;

  const NewsListItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding:  EdgeInsets.all(12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            if (news.urlToImage != null) ImageLoader(imageUrl: news.urlToImage),
             SizedBox(height: 8.h),
            Text(news.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             SizedBox(height: 4.h),
            Text(news.description, maxLines: 2, overflow: TextOverflow.ellipsis),
         
            
          ],
        ),
      ),
    );
  }



}

