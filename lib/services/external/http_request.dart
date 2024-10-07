import 'package:http/http.dart' as http;
import 'package:tirelist/services/external/request_interface.dart';
import 'package:tirelist/utilities/constants.dart';

class HttpRequest implements RequestInterface {
  @override
  Future<http.Response?> get(String url) async {
    http.Response? response;
    try {
      Uri uri = Uri.parse(url);
      response = await http.get(
        uri,
        headers: {
          "x-prolog-api-token": Constants.API_KEY,
        },
      ).timeout(
        const Duration(milliseconds: 10000),
      );
    } catch (error) {
      response = null;
    }
    return response;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
