import 'package:flutter/material.dart';
import 'package:tirelist/ui/pages/tire_list/tire_list_page.dart';

class SplashScreenViewModel {
  Future<void> onInit(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => {
        if (context.mounted)
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TireListPage(),
              ),
            )
          } else {
            throw Exception("Context is not mounted")
          }
      },
    );
  }
}
