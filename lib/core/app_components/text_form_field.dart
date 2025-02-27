import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

Widget defaultTextFormField(context,
    {
      required TextInputType keyboardType,
      required String? Function(String?) validate,
      String? hint,
      required String label,
      bool? readOnly,

      bool secure = false,
      FocusNode? focusNode,
      void Function()? onTap,
      void Function(String)? onSubmit,
       Function()? onEditingComplete,
      Widget? prefix,
      Widget? suffix,
      //  double? width ,

      TextEditingController?  controller,
      bool? enabled ,
    }) =>

    TextFormField(
      focusNode: focusNode,
      controller: controller,
      onFieldSubmitted: onSubmit,
      readOnly: readOnly ?? false,
     
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      obscureText: secure,
      keyboardType: keyboardType,
      validator: validate,
      enabled: enabled ?? true,
      decoration: InputDecoration(
        focusColor: AppColors.primaryColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(
              color: Colors.grey,
              style: BorderStyle.solid,


            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const  BorderSide(
              color: AppColors.primaryColor,
              style: BorderStyle.solid,
              width: 2,


            )) ,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(
              color: AppColors.red,
              style: BorderStyle.solid,


            )),
        fillColor: AppColors.primaryColor,
        errorStyle: const TextStyle(height: 1),

        contentPadding:
        EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        border: OutlineInputBorder(

          gapPadding: 2,

          borderSide: const BorderSide(color: Colors.grey,),

          borderRadius: BorderRadius.circular(30.r),
        ),

        hintText: hint,
        labelText: label,
        suffixIcon: suffix ?? const Icon(Icons.add,color: Colors.white,) ,

        prefixIcon: prefix ?? const Icon(Icons.add,color: Colors.white,) ,
        alignLabelWithHint: true,

        labelStyle: TextStyle(
          fontSize: 16.sp,
          color:  Colors.grey,

        ),
      ),
    );