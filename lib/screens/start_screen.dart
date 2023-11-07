import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_calculator1/screens/home_page.dart';
import 'package:flutter_app_calculator1/screens/view_departments.dart';
import 'package:flutter_app_calculator1/service/remode_service.dart';
import 'package:http/http.dart' as http;
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));

                },
              ),
              AppButton(
                operation: 'DELETE',
                operationColor: Colors.red,
                description: 'Delete Employee',
                onPressed: ()  {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
              ),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch Departments',
                onPressed: ()  {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewDepartment()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
