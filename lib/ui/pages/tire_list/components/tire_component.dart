import 'package:flutter/material.dart';
import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/services/internal/i18n_service.dart';
import 'package:tirelist/ui/custom_widgets/visualizable_image.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';
import 'package:tirelist/view_model/tire_list_page_view_model.dart';

class TireComponent extends StatelessWidget {
  final TireEntity tire;
  final TireListPageViewModel viewModel;
  TireComponent({
    required this.tire,
    required this.viewModel,
    super.key,
  });

  final I18nService i18n = I18nService();

  Widget _tag() {
    return Container(
      width: 70,
      height: 25,
      decoration: BoxDecoration(
        color: tire.newTire ? AppColors.normalBluee : AppColors.normalGreyzy,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        tire.newTire ? i18n.getLabel("new") : i18n.getLabel("used"),
        style: AppTextStyles.tag,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.tireToNavigate.value = tire;
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
            if (tire.registrationImages.isNotEmpty)
              VisualizableImage(
                width: 80,
                height: 80,
                imageUrl: tire.registrationImages[0].url,
              ),
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
                        tire.make.name.trim(),
                        style: AppTextStyles.mainColorTitle,
                      ),
                      Text(
                        tire.serialNumber ?? i18n.getLabel("undefined_serial"),
                        style: AppTextStyles.mainColorSubtitle,
                      ),
                    ],
                  ),
                  Text(
                    "${i18n.getLabel("model")} ${tire.model.name}",
                    style: AppTextStyles.mainColorSubtitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "R\$ ${tire.purchaseCost}",
                        style: AppTextStyles.mainColorSubtitle,
                      ),
                      _tag(),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25),
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
