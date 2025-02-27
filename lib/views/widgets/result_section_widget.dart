// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geexar/core/app_components/loader.dart';
// import 'package:geexar/core/constants/app_fonts.dart';
// import 'package:geexar/viewModels/cubit.dart';
// import 'package:geexar/viewModels/states.dart';
// import 'package:geexar/views/widgets/news_list_widget.dart';

// class ResultsSection extends StatelessWidget {
//   const ResultsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewsCubit, NewsState>(
//       builder: (context, state) {
//         if (state is NewsLoading) {
//           return  Center(child: loader());
//         } else if (state is NewsLoaded) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               NewsList(newsList: state.newsList1),
//               NewsList(newsList: state.newsList2),
//             ],
//           );
//         }
//         else if (state is NewsError) {
//                   return Center(child: Text(state.message, style: AppFonts.style14normal,));
//                 }
//                 return  Center(child: Text("Enter a keyword to search", style: AppFonts.style14Bold,));
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geexar/core/app_components/loader.dart';
import 'package:geexar/core/constants/app_fonts.dart';
import 'package:geexar/viewModels/cubit.dart';
import 'package:geexar/viewModels/states.dart';
import 'package:geexar/views/widgets/news_list_widget.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return Center(child: loader());
        } else if (state is NewsLoaded) {
          return CustomScrollView(
            slivers: [
              if (state.newsList1.isNotEmpty)
                SliverList.builder(
                  itemBuilder:
                      (context, index) => InkWell(
                        onTap: () {
                          context.read<NewsCubit>().updateListBySource(
                            state.newsList1[index].source,
                            true,
                          );
                        },
                        child: NewsListItem(state.newsList1[index]),
                      ),
                  itemCount: state.newsList1.length,
                ),
              if (state.newsList2.isNotEmpty)
                SliverList.builder(
                  itemBuilder:
                      (context, index) =>  InkWell(
                        onTap: () {
                          context.read<NewsCubit>().updateListBySource(
                            state.newsList1[index].source,
                            false,
                          );
                        },
                        child:  NewsListItem(state.newsList2[index]),
                      ),
                  itemCount: state.newsList2.length,
                ),
            ],
          );
        } else if (state is NewsError) {
          return Center(
            child: Text(state.message, style: AppFonts.style14normal),
          );
        }
        return Center(
          child: Text("Enter a keyword to search", style: AppFonts.style14Bold),
        );
      },
    );
  }
}
