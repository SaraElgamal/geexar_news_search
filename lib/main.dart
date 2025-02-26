import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/core/DI/service_locator.dart' as di;
import 'package:geexar/viewModels/cubit.dart';
import 'package:geexar/viewModels/states.dart';
import 'package:geexar/views/home_screen.dart';

void main() {
 // debugRepaintRainbowEnabled = true;
   di.init();
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {

        return MaterialApp(
          title: 'News Search',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
        create: (_) => di.sl<NewsCubit>(),
       child: 
           const HomeScreen(),
       
      ),
        );
      },
    );
  }
}
