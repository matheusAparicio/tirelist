import 'package:tirelist/domain/entities/tire_entity.dart';

abstract class TireDetailPageState {}

class TireDetailPageLoadingState extends TireDetailPageState {}

class TireDetailPageSuccessfulState extends TireDetailPageState {
  final TireEntity tire;

  TireDetailPageSuccessfulState(this.tire);
}

class TireDetailPageErrorState extends TireDetailPageState {
  final String errorMessage;

  TireDetailPageErrorState(this.errorMessage);
}
