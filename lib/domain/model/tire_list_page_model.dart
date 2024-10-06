import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/external/http_request.dart';
import 'package:tirelist/external/tire_service.dart';

class TireListPageModel {
  final HttpRequest _httpRequest = HttpRequest();
  late final TireService _tireService = TireService(_httpRequest);

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
