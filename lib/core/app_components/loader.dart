import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geexar/core/constants/app_animation.dart';
import 'package:lottie/lottie.dart';

Widget loader() => Lottie.asset(AppAnimation.loader,height: 200.h,width: 250.w);
