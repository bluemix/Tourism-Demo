import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:tourism_demo/models/destination.dart';
import 'package:tourism_demo/utils/http_utils.dart';

class ServerAPI {
  static String host = 'https://api.jsonbin.io/b/5b96db5eab9a186eafe86a97/1';

  // DESTINATIONS
  Future<List<Destination>> fetchDestinations() async {
    print('fetching destinations...');
    var url = '$host';

    Response response = await getRequest(url, {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    });
    List responseJSON = json.decode(response.body);
    List<Destination> destinations = responseJSON
        .map((destination) => Destination.fromJson(destination))
        .toList();

    print('${destinations.length} destinations fetched...');

    return destinations;
  }
}
