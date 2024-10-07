import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/services/external/http_request.dart';
import 'package:tirelist/services/external/tire_service.dart';

class TireListPageModel {
  final HttpRequest _httpRequest = HttpRequest();
  late final TireService _tireService = TireService(_httpRequest);

  int _currentPageNumber = 1;
  List<TireEntity> _tireList = [];
  bool canLoadTires = true;

  List<TireEntity> get tireList => _tireList;
  int get currentPageNumber => _currentPageNumber;

  void addToTireList(List<TireEntity> newTires) {
    if (newTires.isNotEmpty) {
      _tireList = [..._tireList, ...newTires];
      _currentPageNumber++;
      canLoadTires = true;
    }
  }

  void resetTireList() {
    _tireList = [];
    _currentPageNumber = 1;
    canLoadTires = true;
  }

  Future<List<TireEntity>> getTireList({
    required int pageNumber,
    required int pageSize,
    required int branchOfficesId,
  }) async {
    return await _tireService.getTireList(
      pageNumber: pageNumber,
      pageSize: pageSize,
      branchOfficesId: branchOfficesId,
    );
  }
}
