import 'package:flutter/material.dart';
import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/domain/model/tire_list_page_model.dart';
import 'package:tirelist/domain/state/tire_list_page_state.dart';
import 'package:tirelist/utilities/constants.dart';

class TireListPageViewModel {
  final ValueNotifier<TireListPageState> state =
      ValueNotifier<TireListPageState>(TireListPageLoadingState([]));
  final TireListPageModel model = TireListPageModel();
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<TireEntity?> tireToNavigate = ValueNotifier(null);
  final ValueNotifier<bool> showUpFloatingActionButton = ValueNotifier(false);

  void onInit() async {
    _fetchTireList();
  }

  Future<void> onListViewEndReached() async {
    if (model.canLoadTires) {
      _fetchTireList();
    }
  }

  void onUpFloatingActionButtonPressed() {
    scrollController.animateTo(
      0,
      duration: const Duration(
        milliseconds: 1000,
      ),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _fetchTireList() async {
    try {
      model.canLoadTires = false;
      state.value = TireListPageLoadingState(model.tireList);
      model
          .getTireList(
        pageNumber: model.currentPageNumber,
        pageSize: Constants.PAGE_SIZE,
        branchOfficesId: 215,
      )
          .then((response) {
        model.addToTireList(response);
        state.value = TireListPageSuccessfulState(model.tireList);
      });
    } catch (error) {
      model.resetTireList();
      state.value =
          TireListPageErrorState("Não foi possível carregar a lista de pneus.");
    }
  }
}
