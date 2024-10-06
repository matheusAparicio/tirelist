import 'package:flutter/material.dart';
import 'package:tirelist/domain/state/tire_detail_page_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
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
            return Text(typedState.tire.status);
          default:
            final typedState = state as TireDetailPageErrorState;
            return Text(
              typedState.errorMessage,
              style: AppTextStyles.pageError,
            );
        }
      },
    );
  }
}
