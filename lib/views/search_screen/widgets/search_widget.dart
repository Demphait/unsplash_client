import 'package:flutter/material.dart';
import 'package:unsplash_client/styles/app_text_styles.dart';

class SearchWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    super.key,
    required this.onChanged,
    required this.hintText,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.primaryTextStyle.white,
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: AppTextStyles.primaryTextStyle.secondaryWhite,
        hintText: widget.hintText,
      ),
      onChanged: widget.onChanged,
    );
  }
}
