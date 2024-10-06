import 'dart:convert';
import 'package:tirelist/domain/entities/tire_entity.dart';
import 'package:tirelist/external/http_request.dart';
import 'package:tirelist/utilities/constants.dart';

class TireService {
  final HttpRequest httpRequest;
  TireService(this.httpRequest);

  Future<List<TireEntity>> getTireList({
    required int pageNumber,
    required int pageSize,
    required int branchOfficesId,
  }) async {
    var response = await httpRequest.get(
      "${Constants.API_URL}tires?pageNumber=$pageNumber&pageSize=$pageSize&branchOfficesId=$branchOfficesId",
    );

    if (response != null && response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)["content"] as List;

      return jsonResponse.map((tire) {
        return TireEntity.fromJson(tire);
      }).toList();
    }

    return [];
  }

  Future<TireEntity?> getTireInfo({
    required int tireId,
  }) async {
    var response = await httpRequest.get(
      "${Constants.API_URL}tires/$tireId",
    );

    if (response != null && response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      return TireEntity.fromJson(jsonResponse);
    }

    return null;
  }
}
