import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/core/app_components/text_form_field.dart';
import 'package:geexar/core/constants/app_colors.dart';
import 'package:geexar/core/constants/app_icons.dart';
import 'package:geexar/viewModels/cubit.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController keyword1Controller = TextEditingController();
  final TextEditingController keyword2Controller = TextEditingController();


  @override
  void dispose() {
    keyword1Controller.dispose();
    keyword2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultTextFormField(
          context,
          label: 'Key1',
          keyboardType: TextInputType.text,
         prefix: const Icon(AppIcons.article,color: AppColors.darkGrey,),
          controller: keyword1Controller,
          validate: (value) {
            return;
          },

          suffix: const Icon(AppIcons.search,color: AppColors.darkGrey,),

          onChanged: (value) {
              if (keyword1Controller.text.isNotEmpty) {
                  context.read<NewsCubit>().fetchNews(keyword1Controller.text);
                }
          },
        ),
        SizedBox(height: 16.h),
        defaultTextFormField(
          context,
          label: 'key2',
          controller: keyword2Controller,
          keyboardType: TextInputType.text,
          prefix: const Icon(AppIcons.newsPaper, color: AppColors.darkGrey,),
          validate: (value) {
            return;
          },

          suffix: const Icon(AppIcons.search,color: AppColors.darkGrey,),

          onChanged: (value) {
             if (keyword2Controller.text.isNotEmpty) {
                  context.read<NewsCubit>().fetchCategoryNews(keyword2Controller.text);
                }
          },
        ),
      ],
    );
  }
}
