import 'package:flutter/material.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';
import 'package:tirelist/ui/theme/measures.dart';

class TireDetailAppBar extends StatefulWidget {
  const TireDetailAppBar({super.key});

  @override
  State<TireDetailAppBar> createState() => _TireDetailAppBarState();
}

class _TireDetailAppBarState extends State<TireDetailAppBar> {
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
      iconTheme: const IconThemeData(
        color: AppColors.appBarText
      ),
    );
  }
}
