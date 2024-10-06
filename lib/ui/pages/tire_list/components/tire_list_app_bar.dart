import 'package:flutter/material.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';
import 'package:tirelist/ui/theme/measures.dart';

class TireListAppBar extends StatefulWidget {
  const TireListAppBar({super.key});

  @override
  State<TireListAppBar> createState() => _TireListAppBarState();
}

class _TireListAppBarState extends State<TireListAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Measures.APP_BAR_HEIGHT,
      title: const Text(
        "TireList",
        style: AppTextStyles.appBarTitle,
      ),
      backgroundColor: AppColors.normalMarine,
      centerTitle: true,
    );
  }
}
