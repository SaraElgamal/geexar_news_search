import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/core/constants/app_colors.dart';

class NewsList extends StatelessWidget {
  final String title;
  final int itemCount;

  const NewsList({
    super.key,
    required this.title,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
         SizedBox(height: 12.h),
        SizedBox(
          height: 250.h, 
          child: _buildNewsItems(),
        ),
      ],
    );
  }

 

  Widget _buildNewsItems() {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), 
      separatorBuilder: (_, __) =>  SizedBox(height: 16.h),
      itemBuilder: (context, index) => const NewsListItem(),
    );
  }
}


class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding:  EdgeInsets.all(12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImagePlaceholder(),
             SizedBox(height: 12.h),
            _buildTitle(),
             SizedBox(height: 8.h),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 20.h,
      width: double.infinity,
      color: AppColors.darkGrey,
    );
  }

  Widget _buildDescription() {
    return Container(
      height: 16.h,
      width: 200.w,
      color: AppColors.darkGrey,
    );
  }
}
