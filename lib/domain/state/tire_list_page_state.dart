import 'package:tirelist/domain/entities/tire_entity.dart';

abstract class TireListPageState {}

class TireListPageLoadingState extends TireListPageState {
  final List<TireEntity> tires;

  TireListPageLoadingState(this.tires);
}

class TireListPageSuccessfulState extends TireListPageState {
  final List<TireEntity> tires;

  TireListPageSuccessfulState(this.tires);
}

class TireListPageErrorState extends TireListPageState {
  final String errorMessage;

  TireListPageErrorState(this.errorMessage);
}
