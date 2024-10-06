import 'package:flutter/material.dart';
import 'package:tirelist/domain/model/tire_list_page_model.dart';
import 'package:tirelist/domain/state/tire_list_page_state.dart';

class TireListPageViewModel {
  final ValueNotifier<TireListPageState> state =
      ValueNotifier<TireListPageState>(TireListPageLoadingState());
  final TireListPageModel model = TireListPageModel();

  void onInit() async {
    _fetchTireList(
      pageNumber: 1,
      pageSize: 20,
      branchOfficesId: 215,
    );
  }

  Future<void> _fetchTireList({
    required int pageNumber,
    required int pageSize,
    required int branchOfficesId,
  }) async {
    try {
      state.value = TireListPageLoadingState();
      model
          .getTireList(
        pageNumber: pageNumber,
        pageSize: pageSize,
        branchOfficesId: branchOfficesId,
      )
          .then((response) {
        state.value = TireListPageSuccessfulState(response);
      });
    } catch (error) {
      state.value =
          TireListPageErrorState("Não foi possível carregar a lista de pneus.");
    }
  }
}
