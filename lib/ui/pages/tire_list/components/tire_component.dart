import 'package:flutter/material.dart';
import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/services/internal/i18n_service.dart';
import 'package:tirelist/ui/pages/tire_detail/tire_detail_page.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';

class TireComponent extends StatelessWidget {
  final TireEntity tire;
  TireComponent({
    required this.tire,
    super.key,
  });

  final I18nService i18n = I18nService();

  Widget _tag() {
    return Container(
      width: 90,
      height: 25,
      decoration: BoxDecoration(
        color: tire.newTire ? AppColors.normalBluee : AppColors.normalGreyzy,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        tire.newTire ? i18n.getLabel("new_tire") : i18n.getLabel("used_tire"),
        style: AppTextStyles.tag,
      ),
    );
  }

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
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: AppColors.lightGreyzy,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.darkMarine,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        tire.make.name,
                        style: AppTextStyles.componentTitle,
                      ),
                      Text(
                        "${i18n.getLabel("model")} ${tire.model.name}",
                        style: AppTextStyles.componentSubtitle,
                      ),
                    ],
                  ),
                  Text(
                    tire.serialNumber ?? i18n.getLabel("undefined_serial"),
                    style: AppTextStyles.componentSubtitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        tire.purchaseCost.toString(),
                        style: AppTextStyles.componentSubtitle,
                      ),
                      _tag(),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
