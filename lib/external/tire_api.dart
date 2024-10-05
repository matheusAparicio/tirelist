import 'dart:convert';

import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/external/http_request.dart';

class TireApi {
  final HttpRequest httpRequest;
  TireApi(this.httpRequest);

  Future<List<TireEntity>?> getTireList({
    required int pageNumber,
    required int pageSize,
    required int branchOfficesId,
  }) async {
    var response = await httpRequest.get(
      "https://prologapp.com/prolog/api/v3/tires?pageNumber=$pageNumber&pageSize=$pageSize&branchOfficesId=$branchOfficesId",
    );

    return response != null ? jsonDecode(response.body) : null;
  }

  Future<TireEntity> getTireInfo({
    required int tireId,
  }) async {
    var response = await httpRequest.get(
      "https://prologapp.com/prolog/api/v3/tires/$tireId",
    );

    return response != null ? jsonDecode(response.body) : null;
  }
}
