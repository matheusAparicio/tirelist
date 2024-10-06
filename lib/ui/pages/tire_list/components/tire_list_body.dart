import 'package:flutter/material.dart';
import 'package:tirelist/domain/state/tire_list_page_state.dart';
import 'package:tirelist/ui/pages/tire_list/components/tire_component.dart';
import 'package:tirelist/ui/theme/app_colors.dart';
import 'package:tirelist/ui/theme/app_text_styles.dart';
import 'package:tirelist/view_model/tire_list_page_view_model.dart';

class TireListBody extends StatefulWidget {
  final TireListPageViewModel viewModel;
  const TireListBody({
    required this.viewModel,
    super.key,
  });

  @override
  State<TireListBody> createState() => _TireListBodyState();
}

class _TireListBodyState extends State<TireListBody> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.viewModel.state,
      builder: (context, state, child) {
        switch (state.runtimeType) {
          case const (TireListPageLoadingState):
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.pageLoading,
              ),
            );
          case const (TireListPageSuccessfulState):
            final typedState = state as TireListPageSuccessfulState;
            return ListView.builder(
              itemCount: typedState.tires.length,
              itemBuilder: (context, index) {
                return const TireComponent();
              },
            );
          default:
            final typedState = state as TireListPageErrorState;
            return Text(
              typedState.errorMessage,
              style: AppTextStyles.pageError,
            );
        }
      },
    );
  }
}
