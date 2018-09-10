import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:tourism_demo/models/destination.dart';
import 'package:tourism_demo/utils/http_utils.dart';

class ServerAPI {


  static String host = 'http://192.168.0.103:3000';
  // DESTINATIONS
  Future<List<Destination>> fetchDestinations() async {
    print('fetching destinations...');
    var url = '$host/destinations';

    Response response = await getRequest(url, {});
    List responseJSON = json.decode(response.body);
    List<Destination> destinations =
        responseJSON.map((destination) => Destination.fromJson(destination)).toList();

    print('${destinations.length} destinations fetched...');

    return destinations;
  }
}
