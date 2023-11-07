import 'dart:convert';
import 'package:flutter_app_calculator1/models/employee.dart';
import 'package:flutter_app_calculator1/models/department.dart';
import 'package:http/http.dart' as http;


final String baseUrl = 'http://examination.24x7retail.com';
final String apiKey="?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf";

class RemoteService {
  var client=http.Client();

  Future<List<Employee>?> getEmployees(String api) async {


    final response = await client.get(
      Uri.parse(baseUrl+api),
      headers: {
        'Content-Type': 'application/json',
        'apiToken':'?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf'// Include the API key in the headers
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      print(response.body);

      return employeeFromJson(json);
    }
  }

  Future<List<Department>?> getDepartments(String api) async {


    final response = await client.get(
      Uri.parse(baseUrl+api),
      headers: {
        'Content-Type': 'application/json',
        'apiToken':'?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf'// Include the API key in the headers
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      print(response.body);

      return departmentFromJson(json);
    }
  }



  Future<dynamic> postEmployee(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Content-Type': 'application/json',
      'apiToken': '?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf',
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }


  ///PUT Request
  Future<dynamic> editEmployee(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Content-Type': 'application/json',
      'apiToken': '?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf',
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
      'apiToken': '?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}