import 'package:flutter/material.dart';
import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/domain/state/tire_detail_page_state.dart';
import 'package:tirelist/services/internal/i18n_service.dart';
import 'package:tirelist/ui/custom_widgets/image_visualizer_dialog.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';
import 'package:tirelist/view_model/tire_detail_page_view_model.dart';

class TireDetailBody extends StatefulWidget {
  final TireDetailPageViewModel viewModel;
  const TireDetailBody({
    required this.viewModel,
    super.key,
  });

  @override
  State<TireDetailBody> createState() => _TireDetailBodyState();
}

class _TireDetailBodyState extends State<TireDetailBody> {
  I18nService i18n = I18nService();

  Widget _imageButton(String imageUrl) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ImageVisualizerDialog(imageUrl: imageUrl);
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.darkBluee,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              i18n.getLabel(
                "visualize_image",
              ),
              style: AppTextStyles.secondaryColorSubtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.photo,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _information({
    required String title,
    String? value,
    Widget? child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.mainColorSubtitle,
            textAlign: TextAlign.center,
          ),
          if (value != null)
            Text(
              value,
              style: AppTextStyles.mainColorInfo,
              textAlign: TextAlign.center,
            ),
          if (child != null) child,
        ],
      ),
    );
  }

  Widget _section({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.normalMarine,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppTextStyles.secondaryColorTitle,
              textAlign: TextAlign.center,
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _allTireDetails(TireEntity tire) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _section(
            title: i18n.getLabel("general_information"),
            children: [
              _information(
                title: i18n.getLabel("make"),
                value: tire.make.name,
              ),
              _information(
                title: i18n.getLabel("serial"),
                value: tire.serialNumber ?? i18n.getLabel("undefined_serial"),
              ),
              _information(
                title: i18n.getLabel("model"),
                value: tire.model.name,
              ),
              _information(
                title: i18n.getLabel("company_group"),
                value: tire.companyGroupName,
              ),
              _information(
                title: i18n.getLabel("branch_office"),
                value: tire.branchOfficeName,
              ),
              _information(
                title: i18n.getLabel("dot"),
                value: tire.dot ?? '',
              ),
              _information(
                title: i18n.getLabel("purchase_cost"),
                value: "R\$ ${tire.purchaseCost}",
              ),
              _information(
                title: i18n.getLabel("status"),
                value: tire.status,
              ),
              if (tire.registrationImages.isNotEmpty)
                _information(
                  title: i18n.getLabel("images"),
                  child: Column(
                    children: [
                      ...tire.registrationImages.map((image) {
                        return _imageButton(image.url);
                      }),
                    ],
                  ),
                ),
            ],
          ),
          _section(
            title: i18n.getLabel("specifications"),
            children: [
              _information(
                title: i18n.getLabel("width"),
                value: tire.tireSize.width.toString(),
              ),
              _information(
                title: i18n.getLabel("height"),
                value: tire.tireSize.height.toString(),
              ),
              _information(
                title: i18n.getLabel("rim"),
                value: tire.tireSize.rim.toString(),
              ),
              _information(
                title: i18n.getLabel("recommended_pressure"),
                value: tire.recommendedPressure.toString(),
              ),
              _information(
                title: i18n.getLabel("current_pressure"),
                value: tire.currentPressure.toString(),
              ),
            ],
          ),
          _section(
            title: i18n.getLabel("health"),
            children: [
              _information(
                title: i18n.getLabel("times_retreaded"),
                value: tire.timesRetreaded.toString(),
              ),
              _information(
                title: i18n.getLabel("max_retreads_expected"),
                value: tire.maxRetreadsExpected.toString(),
              ),
              _information(
                title: i18n.getLabel("current_life_cycle"),
                value: tire.currentLifeCycle.toString(),
              ),
              if (tire.disposal != null) ...[
                _information(
                  title: i18n.getLabel("disposal_reason"),
                  value: tire.disposal!.disposalReasonDescription,
                ),
                _information(
                  title: i18n.getLabel("disposal_images"),
                  child: Column(
                    children: [
                      ...tire.disposal!.disposalImagesUrl.map((image) {
                        return _imageButton(image);
                      }),
                    ],
                  ),
                )
              ],
            ],
          ),
          _section(
            title: i18n.getLabel("current_retread"),
            children: [
              _information(
                title: i18n.getLabel("make"),
                value: (tire.currentRetread?.make.name) ?? "",
              ),
              _information(
                title: i18n.getLabel("model"),
                value: (tire.currentRetread?.model.name) ?? "",
              ),
              _information(
                title: i18n.getLabel("grooves_quantity"),
                value:
                    (tire.currentRetread?.model.groovesQuantity.toString()) ??
                        "",
              ),
              _information(
                title: i18n.getLabel("tread_depth"),
                value: (tire.currentRetread?.model.treadDepth.toString()) ?? "",
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.pageBackground,
      ),
      alignment: Alignment.center,
      child: ValueListenableBuilder(
        valueListenable: widget.viewModel.state,
        builder: (context, state, child) {
          switch (state.runtimeType) {
            case const (TireDetailPageLoadingState):
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.pageLoading,
                ),
              );
            case const (TireDetailPageSuccessfulState):
              final typedState = state as TireDetailPageSuccessfulState;
              return _allTireDetails(typedState.tire);
            default:
              final typedState = state as TireDetailPageErrorState;
              return Text(
                typedState.errorMessage,
                style: AppTextStyles.pageError,
              );
          }
        },
      ),
    );
  }
}
