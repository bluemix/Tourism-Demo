import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:tourism_demo/models/models.dart';
import 'package:tourism_demo/utils/http_utils.dart';

class OdooFlaskAPI {
  // CHECKS
  Future<List<Destination>> fetchDestinations() async {
    print('fetching destinations...');
    var checksUrlString = '';

    Response response = await getRequest(checksUrlString, {});
    List employeeChecksMap = json.decode(response.body);
    List<Destination> employeeChecks =
        employeeChecksMap.map((check) => Destination.fromJson(check)).toList();

    print('${employeeChecks.length} checks fetched...');

    if (employeeChecks.isNotEmpty) {
      return employeeChecks;
    }

    return null;
  }
}
