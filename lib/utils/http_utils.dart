import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


Future<Response> getRequest(String url, Map<String, String> headers,) async {
  final _client = new http.Client();
  Response response = await _client
      .get(url, headers: headers)
      .whenComplete(_client.close);
  return response;
}

Future<Response> postRequest(
    String url, Map<String, String> headers, Map<String, dynamic> body) async {
    final _client = new http.Client();
  Response response = await _client
      .post(url, body: json.encode(body), headers: headers)
      .whenComplete(_client.close);
  return response;
}
