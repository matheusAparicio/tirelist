import 'package:tirelist/external/http_request.dart';

class TireApi {
  final HttpRequest httpRequest;
  TireApi(this.httpRequest);

  Future getTireList({
    required int pageNumber,
    required int pageSize,
    required int branchOfficesId,
  }) async {
    return;
  }

  Future getTireInfo({
    required int tireId,
  }) async {
    return;
  }
}
