import 'package:flutter/material.dart';
import 'package:flutter_app_calculator1/models/department.dart';
import 'package:flutter_app_calculator1/service/remode_service.dart';
import 'dart:convert';

class ViewDepartment extends StatefulWidget {
  const ViewDepartment({Key? key}) : super(key: key);

  @override
  _ViewDepartmentState createState() => _ViewDepartmentState();
}


class _ViewDepartmentState extends State<ViewDepartment> {
List<Department>? departments;
var isLoaded = false;

@override
void initState() {
  super.initState();

  //fetch data from API
  getData();
}



  getData() async {

    departments = await RemoteService().getDepartments('/api/v1.0/Departments');
    if (departments != null) {
      setState(() {
        isLoaded = true;
        print(departments);
      });

    } else {
      print('No internet connection');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: departments?.length,
            itemBuilder:(context,index){
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
                              departments![index].departmentName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            subtitle: Text(
                              departments![index].departmentCode ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),


                          ),



                        ],
                      ),
                    ),
                  ],
                )
              );

    },


    ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),

    );
  }
}
