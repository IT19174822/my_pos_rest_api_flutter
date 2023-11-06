import 'package:flutter/material.dart';

import '../models/employee.dart';
import '../service/remode_service.dart';

class EditEmployee extends StatefulWidget {
  EditEmployee({
    required this.employees,
    required this.index,
    Key? key,
  }) : super(key: key);
  List<Employee> employees;
  final int index;

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _joinController = TextEditingController();
  TextEditingController _birthController = TextEditingController();

  var _empNo = '';
  var _empName = '';
  var _empAddressLine1 = '';
  var _empAddressLine2 = '';
  var _empAddressLine3 = '';
  var _departmentCode = '';
  DateTime _dateOfJoin = DateTime.now();
  DateTime _dateOfBirth = DateTime.now();
  var _basicSalary = '';
  bool _isActive = false;
  var _isSending = false;



  Future<void> _updateEmployee() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isSending = true;
      });


      final response = await RemoteService().editEmployee(
          '/api/v1.0/Employee/', Employee(
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
      debugPrint('update successfully:');

      Navigator.of(context).pop(
          Employee(
              empNo: _empNo,
              empName: _empName,
              empAddressLine1: _empAddressLine1,
              empAddressLine2: _empAddressLine2,
              empAddressLine3: _empAddressLine3,
              departmentCode: _departmentCode,
              dateOfJoin: _dateOfJoin,
              dateOfBirth: _dateOfJoin,
              basicSalary: int.parse(_basicSalary),
              isActive: _isActive
          )
      );


    }
  }



  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }


    return SingleChildScrollView(
      child: Material(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Text('Enter Employee number',

                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onSaved: (value) {
                    _empNo = value!;
                  },
                  initialValue: widget.employees[widget.index].empNo,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(label: Text('Enter Employee Name')),
                  onSaved: (value) {
                    _empName = value!;
                  },
                  initialValue: widget.employees[widget.index].empName,

                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                      label: Text('Enter employee address line1')),
                  onSaved: (value) {
                    _empAddressLine1 = value!;
                  },
                  initialValue: widget.employees[widget.index].empAddressLine1,

                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                      label: Text('Enter employee address line2')),
                  onSaved: (value) {
                    _empAddressLine2 = value!;
                  },
                  initialValue: widget.employees[widget.index].empAddressLine2,

                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                      label: Text('Enter employee addressline3')),
                  onSaved: (value) {
                    _empAddressLine3 = value!;
                  },
                  initialValue: widget.employees[widget.index].empAddressLine3,

                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 50,
                  decoration:
                      InputDecoration(label: Text('Enter department code')),
                  onSaved: (value) {
                    _departmentCode = value!;
                  },
                  initialValue: widget.employees[widget.index].departmentCode,

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
                            _dateOfJoin = dateTime!;
                            _joinController.text =
                                _dateOfJoin.toString().split(" ")[0];
                          }
                        },
                        onSubmitted: (value) {
                          _dateOfJoin = value as DateTime;
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
                            _dateOfBirth = dateTime!;
                            _birthController.text =
                                _dateOfBirth.toString().split(" ")[0];

                            print(_dateOfBirth);
                          }
                        },
                        onSubmitted: (value) {
                          _dateOfBirth = value as DateTime;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: widget.employees[widget.index].basicSalary.toString(),

                          decoration: InputDecoration(
                            label: Text('Enter Salary'),
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            _basicSalary = value!;
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        fillColor: MaterialStateProperty.resolveWith(getColor),

                          title: Text('is Active'),
                          activeColor: Colors.white,
                          tristate: true,
                          value: _isActive,
                          onChanged: (bool? value) {
                            setState(() {
                              _isActive =value!;
                            });

                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: _isSending
                            ? null
                            : () {
                          _updateEmployee();
                                print(_empNo);
                              },
                        child: _isSending
                            ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(),
                              )
                            : Text('Update Data')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Go Back',
                          style: TextStyle(fontSize: 18),
                        ))
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
