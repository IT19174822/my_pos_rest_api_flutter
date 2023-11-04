import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://examination.24x7retail.com?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf';

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'api_key': "?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf",
    };

    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }




}