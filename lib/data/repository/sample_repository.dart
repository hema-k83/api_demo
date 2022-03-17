import 'dart:convert';
import 'dart:io';

import 'package:api_demo/data/remote/sample_client.dart';

class SampleRepository {
  final headers = {'Content-type': 'application/json; charset=UTF-8', 'accept': 'application/json'};

  Future<String> fetchData() async {
    SampleClient sampleClient = SampleClient();
    final response = await sampleClient.call(
        HttpMethod.get, 'https://mocki.io/v1/aa2a6e00-00f3-4084-9191-7f077fd029c0');
    if ((response != null) && (response.statusCode == HttpStatus.ok)) {
      return response.body;
    }
    return "";
  }

  submitData() async {
    SampleClient sampleClient = SampleClient();
    final data = {
      "name": "test",
      "job": "leader",
    };
    final response = await sampleClient.call(HttpMethod.post, 'https://reqres.in/api/users',
        body: jsonEncode(data), headers: headers);
    if ((response != null) && (response.statusCode == HttpStatus.created)) {
      return response.body;
    }
    return {};
  }
}
