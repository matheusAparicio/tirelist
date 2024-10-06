import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tirelist/ui/pages/splash_screen/splash_screen_view_model.dart';
import 'package:tirelist/ui/pages/tire_list/tire_list_page.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';

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
    _vm.onInit();
    _vm.navigateToTireList.addListener(() {
      if (_vm.navigateToTireList.value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TireListPage(),
          ),
        );
      }
    });
  }
  
  @override
  void dispose() {
    _vm.navigateToTireList.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          //color: AppColors.darkMarine,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              AppColors.softMarine,
              AppColors.darkMarine,
            ],
          ),
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
            Text(
              "TireList",
              style: AppTextStyles.splashScreen,
            ),
          ],
        ),
      ),
    );
  }
}
