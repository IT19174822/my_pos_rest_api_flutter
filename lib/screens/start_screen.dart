import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_calculator1/screens/home_page.dart';
import 'package:flutter_app_calculator1/service/remode_service.dart';
import 'package:http/http.dart' as http;
import '../service/base_client.dart';
import '../widgets/app_button.dart';
import 'new_employee.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();


}


class _StartScreenState extends State<StartScreen> {


  void _addEmployee(){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddEmployee()));
  }
  void _fetchEmployees(){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomePage()));
  }
  void _deleteEmployees() async{
    var response = await RemoteService().delete('/api/v1.0/Employees').catchError((err) {});
    if (response == null) return;
    debugPrint('successful:');
  }




  Future<void> postDataToAPI() async {
    final String apiUrl = "http://examination.24x7retail.com/api/v1.0/Employee"; // Replace with the API endpoint

    // Define your data as a Map
    Map<String, dynamic> data = {
      "empNo": "okk",
      "empName": "string",
      "empAddressLine1": "oooo",
      "empAddressLine2": "string",
      "empAddressLine3": "string",
      "departmentCode": "string",
      "dateOfJoin": "2023-11-02T04:32:02.771Z",
      "dateOfBirth": "2023-11-02T04:32:02.771Z",
      "basicSalary": 10000,
      "isActive": false
    };

    // Convert the data to JSON format
    String jsonData = jsonEncode(data);

    // Set the headers to specify JSON content
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'apiToken':'?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf'
    };

    // Make the POST request
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonData,
    );

    // Check the response
    if (response.statusCode == 200) {
      print("Request was successful");
      print(response.body);
    } else {
      print("Request failed with status code: ${response.statusCode}");
      print(response.body);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPos'),
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const FlutterLogo(size: 72),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch Employees',
                onPressed: ()  {
                  _fetchEmployees();

                },
              ),
              AppButton(
                operation: 'POST',
                operationColor: Colors.lightBlue,
                description: 'Add Employee',
                onPressed: () {
                  _addEmployee();

                },),
              AppButton(
                operation: 'PUT',
                operationColor: Colors.orangeAccent,
                description: 'Edit Employee',
                onPressed: ()  {

                },
              ),
              AppButton(
                operation: 'DELETE',
                operationColor: Colors.red,
                description: 'Delete Employee',
                onPressed: ()  {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
