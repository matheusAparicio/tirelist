import 'package:flutter/material.dart';
import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/ui/pages/tire_detail/tire_detail_page.dart';
import 'package:tirelist/ui/theme/app_colors.dart';

class TireComponent extends StatelessWidget {
  final TireEntity tire;
  const TireComponent({
    required this.tire,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TireDetailPage(
              tire: tire,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          color: AppColors.lightGreyzy,
        ),
      ),
    );
  }
}
