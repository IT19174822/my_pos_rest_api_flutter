import 'package:flutter_app_calculator1/models/employee.dart';
import 'package:http/http.dart' as http;

final String baseUrl = 'http://examination.24x7retail.com?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf';
final String apiKey="?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf";

class RemoteService {

  Future<List<Employee>?> getEmployees(String api) async {
    var client=http.Client();

    final response = await client.get(
      Uri.parse(baseUrl+api),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'api_key':'$apiKey'   // Include the API key in the headers
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      print(response.body);

      return employeeFromJson(response.body);
    }
  }
}