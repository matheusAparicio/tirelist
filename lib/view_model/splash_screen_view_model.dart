import 'package:flutter/material.dart';

class SplashScreenViewModel {
  final ValueNotifier<bool> navigateToTireList = ValueNotifier(false);

  Future<void> onInit() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        navigateToTireList.value = true;
      },
    );
  }
}
