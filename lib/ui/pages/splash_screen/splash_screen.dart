import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tirelist/ui/pages/splash_screen/splash_screen_view_model.dart';
import 'package:tirelist/ui/utilities/app_colors.dart';
import 'package:tirelist/ui/utilities/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashScreenViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = SplashScreenViewModel();
    _vm.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.darkMarine,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "assets/lottie/tire.json",
              width: 150,
              height: 150,
              fit: BoxFit.fitWidth,
            ),
            const Text(
              "TireList",
              style: AppTextStyles.splashScreen,
            ),
          ],
        ),
      ),
    );
  }
}
