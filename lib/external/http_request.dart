import 'package:http/http.dart' as http;
import 'package:tirelist/external/request_interface.dart';

class HttpRequest implements RequestInterface {
  @override
  Future<http.Response?> get(String url) async {
    http.Response response;
    try {
      Uri uri = Uri.parse(url);
      response = await http.get(
        uri,
        headers: {
          "x-prolog-api-token": "ePTC2XrkY34WKUCXq48fTxrLCzdV3M35MNpCfBYavabwwY9BJXg",
        },
      ).timeout(const Duration(milliseconds: 10000));
    } catch (error) {
      return null;
    }
    return response;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}