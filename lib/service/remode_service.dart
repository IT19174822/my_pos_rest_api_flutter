import 'package:flutter_app_calculator1/models/employee.dart';
import 'package:http/http.dart' as http;

final String baseUrl = 'http://examination.24x7retail.com';
final String apiKey="?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf";

class RemoteService {

  Future<List<Employee>?> getEmployees(String api) async {
    var client=http.Client();

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
}