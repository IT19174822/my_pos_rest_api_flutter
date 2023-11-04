import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_calculator1/models/employee.dart';
import 'package:flutter_app_calculator1/service/remode_service.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _joinController=TextEditingController();
  TextEditingController _birthController=TextEditingController();


  var _empNo='';
  var _empName='';
  var _empAddressLine1='';
  var _empAddressLine2='';
  var _empAddressLine3='';
  var _departmentCode='';
  DateTime _dateOfJoin=DateTime.now();
  DateTime _dateOfBirth=DateTime.now();
   var _basicSalary='';
  bool _isActive=false;
  var _isSending = false;



  Future<void> _saveEmployee() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isSending = true;
      });



      final response = await RemoteService().postEmployee(
          '/api/v1.0/Employee', Employee(
          empNo: _empNo,
          empName: _empName,
          empAddressLine1: _empAddressLine1,
          empAddressLine2: _empAddressLine2,
          empAddressLine3: _empAddressLine3,
          departmentCode: _departmentCode,
          dateOfJoin: _dateOfJoin,
          dateOfBirth: _dateOfBirth,
          basicSalary: int.parse(_basicSalary),
          isActive: _isActive
      ).toJson()
      ).catchError((err){
        print(err);
      });
      if (response == null) return;
      debugPrint('successful:');

      Navigator.of(context).pop(
          Employee(
              empNo: _empNo,
              empName: _empName,
              empAddressLine1: _empAddressLine1,
              empAddressLine2: _empAddressLine2,
              empAddressLine3: _empAddressLine3,
              departmentCode: _departmentCode,
              dateOfJoin: _dateOfJoin,
              dateOfBirth: _dateOfBirth,
              basicSalary: int.parse(_basicSalary),
              isActive: _isActive
          )
      );


    }
  }










  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 100),
            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter employee number:',style: TextStyle(
                          fontSize: 18
                        ),
                        ),
                        ),

                    onSaved: (value){
                      _empNo=value!;
                    },

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration: InputDecoration(label: Text('Enter employee name')),
                  onSaved: (value){
                      _empName=value!;

                  },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter employee address line1')),
                  onSaved: (value){
                      _empAddressLine1=value!;
                  },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter employee address line2')),

                  onSaved: (value){
                      _empAddressLine2=value!;
                  },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter employee addressline3')),
                  onSaved: (value){
                      _empAddressLine3=value!;
                  },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter department code')),
                 onSaved: (value){
                      _departmentCode=value!;
                 },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _joinController,
                          decoration: InputDecoration(
                            labelText: 'Enter Join Date',
                            filled: true,
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onTap: () async {
                            final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );
                            if (dateTime != null) {
                              setState(() {
                                _dateOfJoin=dateTime!;
                                _joinController.text=_dateOfJoin.toString().split(" ")[0];
                              });

                            }
                          },
                        onSubmitted: (value){
                            _dateOfJoin=value as DateTime;
                        },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(

                          controller: _birthController,
                          decoration: InputDecoration(
                            labelText: 'Enter Date of Birth',
                            filled: true,
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onTap: () async {
                            final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (dateTime != null) {
                              setState(() {
                                _dateOfBirth = dateTime!;
                                _birthController.text=_dateOfBirth.toString().split(" ")[0];

                              });
                              print(_dateOfBirth);
                            }
                          },
                        onSubmitted: (value){
                            _dateOfBirth=value as DateTime;
                        },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            
                            decoration:
                            InputDecoration(
                              label: Text('Enter Salary'),

                            ),
                           keyboardType: TextInputType.number,
                            onSaved: (value){
                              setState(() {
                               _basicSalary=value!;
                              });

                            },

                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('is Active'),
                            activeColor: Colors.white,
                              tristate:true,
                              value: _isActive, onChanged: (value){
                                setState(() {
                                  _isActive=value!;

                                });
                          }

                          ),
                        )
                      ],
                    ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: _isSending? null:(){

                        _saveEmployee();
                        print(_empNo);

                      },child: _isSending? SizedBox(height: 16,width: 16,child: CircularProgressIndicator(

            ),):Text('Save Data')),

                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('Go Back',style: TextStyle(
                          fontSize: 18
                      ),))

                    ],
                  )



                ],
              ),
            ),
          ),

      ),
    );
  }
}
