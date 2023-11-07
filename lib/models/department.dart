import 'dart:convert';


List<Department> departmentFromJson(String str) => List<Department>.from(json.decode(str).map((x) => Department.fromJson(x)));

String departmentToJson(List<Department> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Department {
  String  departmentCode;
  String departmentName;
  bool isActive;

  Department({ required this.departmentCode, required this.departmentName,required this.isActive});


 factory Department.fromJson(Map<String, dynamic> json)=>Department(
    departmentCode: json['departmentCode'],
    departmentName:json['departmentName'],
    isActive: json['isActive'],
  );


  Map<String, dynamic> toJson()=> {
    'departmentCode' :departmentCode,
    'departmentName' : departmentName,
    'isActive' :isActive,

};
}