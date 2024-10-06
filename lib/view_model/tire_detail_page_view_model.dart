import 'package:flutter/material.dart';
import 'package:tirelist/domain/model/tire_detail_page_model.dart';
import 'package:tirelist/domain/state/tire_detail_page_state.dart';

class TireDetailPageViewModel {
  final ValueNotifier<TireDetailPageState> state = ValueNotifier<TireDetailPageState>(TireDetailPageLoadingState());
  final TireDetailPageModel model = TireDetailPageModel();
}
