import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(jsonDecode(str));

String employeeToJson(Employee employee) => json.encode(employee.toJson());

class Employee {
  int? id;
  String? name;
  String? address;
  String? designation;

  Employee({
    this.id,
    this.name,
    this.address,
    this.designation,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      designation: json['designation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "designation": designation,
    };
  }
}
