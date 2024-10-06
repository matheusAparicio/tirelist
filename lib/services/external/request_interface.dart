class RequestInterface {
  Future get(String uri) async {}
  Future post(String uri, json) async {}
}