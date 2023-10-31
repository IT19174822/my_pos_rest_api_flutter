import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://examination.24x7retail.com';

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

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': 'Bearer ?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf',
      'Content-Type': 'application/json',
      'api_key': '?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf',
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  ///PUT Request
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': 'Bearer ?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf=',
      'Content-Type': 'application/json',
      'api_key': '?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': 'Bearer ?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf=',
      'api_key': '?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}