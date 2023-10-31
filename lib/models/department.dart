

class Department {
  String? departmentCode;
  String? departmentName;
  bool? isActive;

  Department({this.departmentCode, this.departmentName, this.isActive});

  Department.fromJson(Map<String, dynamic> json) {
    departmentCode = json['departmentCode'];
    departmentName = json['departmentName'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentCode'] = this.departmentCode;
    data['departmentName'] = this.departmentName;
    data['isActive'] = this.isActive;
    return data;
  }
}