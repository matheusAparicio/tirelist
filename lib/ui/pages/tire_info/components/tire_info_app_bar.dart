import 'package:flutter/material.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';
import 'package:tirelist/ui/theme/measures.dart';

class TireInfoAppBar extends StatefulWidget {
  const TireInfoAppBar({super.key});

  @override
  State<TireInfoAppBar> createState() => _TireInfoAppBarState();
}

class _TireInfoAppBarState extends State<TireInfoAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Measures.APP_BAR_HEIGHT,
      title: Text(
        "Detalhes do Pneu",
        style: AppTextStyles.appBarTitle,
      ),
      backgroundColor: AppColors.normalMarine,
      centerTitle: true,
    );
  }
}
