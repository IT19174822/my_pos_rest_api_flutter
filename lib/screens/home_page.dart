import 'package:flutter/material.dart';
import 'package:flutter_app_calculator1/models/employee.dart';
import 'package:http/http.dart' as http;
import '../service/remode_service.dart';
import 'dart:convert';
import 'new_employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee>? employees;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {

      employees = await RemoteService().getEmployees('/api/v1.0/Employees');
      if (employees != null) {
        setState(() {
          isLoaded = true;
          print(employees);
        });

      } else {
        print('No internet connection');
      }
    }


      void _addEmployee(){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddEmployee()));
}
  void _deleteEmployee(String empNo) async{
    var response = await RemoteService().delete('/api/v1.0/Employee/$empNo').catchError((err) {
      print(err);
    });
    if (response == null) return;
    debugPrint('successful:');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _addEmployee, icon: Icon(Icons.add))
        ],
        title: const Text('Employees'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: employees?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            employees![index].empName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                          subtitle: Text(
                            employees![index].empNo ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: (){
                            _deleteEmployee(employees![index].empNo);

                            print(employees![index].empNo);
                          },

                        ),


                      ],
                    ),
                  ),
                ],
              ),

            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}