import 'package:flutter/material.dart';
import 'package:geexar/core/app_components/text_form_field.dart';
import 'package:geexar/core/constants/app_icons.dart';

class SearchField extends StatelessWidget {
  final String label;

  const SearchField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
      context,
      label: label,
      keyboardType: TextInputType.text,
      validate: (value) {
        return;
      },

      suffix: const Icon(AppIcons.search),

      onChanged: (value) => _handleSearch(value),
    );
  }

  void _handleSearch(String query) {
    //  search logic
  }
}
