import 'package:flutter/material.dart';
import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/domain/model/tire_detail_page_model.dart';
import 'package:tirelist/domain/state/tire_detail_page_state.dart';

class TireDetailPageViewModel {
  final ValueNotifier<TireDetailPageState> state =
      ValueNotifier<TireDetailPageState>(TireDetailPageLoadingState());
  final TireDetailPageModel model = TireDetailPageModel();

  void onInit(int tireId) {
    _fetchTireInfo(tireId: tireId);
  }

  Future<void> _fetchTireInfo({
    required int tireId,
  }) async {
    try {
      state.value = TireDetailPageLoadingState();

      TireEntity? tireResponse = await model.getTireDetail(
        tireId: tireId,
      );

      if (tireResponse != null) {
        state.value = TireDetailPageSuccessfulState(tireResponse);
      } else {
        throw Exception("Tire response was null.");
      }
    } catch (error) {
      state.value = TireDetailPageErrorState(
        "Não foi possível carregar as informações do pneu.",
      );
    }
  }
}
