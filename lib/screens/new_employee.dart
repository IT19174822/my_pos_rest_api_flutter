import 'package:flutter/material.dart';
import 'package:flutter_app_calculator1/models/employee.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _formKey = GlobalKey();
  DateTime _joinDate = DateTime.now();
  DateTime _dateOfBirth = DateTime.now();
  TextEditingController _joinController=TextEditingController();
  TextEditingController _birthController=TextEditingController();
  bool isActive= false;


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
                        ),)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration: InputDecoration(label: Text('Enter employee name')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter employee address line1')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter employee address line2')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter employee addressline3')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 50,
                    decoration:
                        InputDecoration(label: Text('Enter department code')),
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
                                _joinDate=dateTime!;
                                _joinController.text=_joinDate.toString().split(" ")[0];
                              });

                            }
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
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text('is Active'),
                            activeColor: Colors.white,
                              tristate:true,
                              value: isActive, onChanged: (newBool){
                                setState(() {
                                  isActive=newBool!;

                                });
                          }),
                        )
                      ],
                    ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){}, child: Text('Save Data',style: TextStyle(
                          fontSize: 18
                      ),)),
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
