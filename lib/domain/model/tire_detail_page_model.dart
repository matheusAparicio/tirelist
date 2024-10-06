import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/external/http_request.dart';
import 'package:tirelist/external/tire_service.dart';

class TireDetailPageModel {
  final HttpRequest _httpRequest = HttpRequest();
  late final TireService _tireService = TireService(_httpRequest);

  Future<TireEntity?> getTireDetail({
    required int tireId,
  }) async {
    return await _tireService.getTireDetail(
      tireId: tireId,
    );
  }
}
