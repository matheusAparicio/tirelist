import 'package:flutter/material.dart';
import 'package:tirelist/domain/entities/tire_entity.dart';
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
  ListView _tireListView({
    required List<TireEntity> tires,
    bool loading = false,
  }) {
    return ListView.builder(
      itemCount: loading ? tires.length + 1 : tires.length,
      physics: const BouncingScrollPhysics(),
      controller: widget.viewModel.scrollController,
      itemBuilder: (context, index) {
        if (loading && index == tires.length) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const CircularProgressIndicator(
                color: AppColors.pageLoading,
              ),
            ),
          );
        } else {
          return TireComponent(
            tire: tires[index],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.pageBackground,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ValueListenableBuilder(
        valueListenable: widget.viewModel.state,
        builder: (context, state, child) {
          switch (state.runtimeType) {
            case const (TireListPageLoadingState):
              final typedState = state as TireListPageLoadingState;
              return state.tires.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.pageLoading,
                      ),
                    )
                  : _tireListView(
                      tires: typedState.tires,
                      loading: true,
                    );
            case const (TireListPageSuccessfulState):
              final typedState = state as TireListPageSuccessfulState;
              return _tireListView(tires: typedState.tires);
            default:
              final typedState = state as TireListPageErrorState;
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
