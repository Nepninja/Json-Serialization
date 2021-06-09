import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable(explicitToJson: true)
class Employee {
  int id;
  String name;
  String address;
  String designation;

  Employee({
    required this.id,
    required this.name,
    required this.address,
    required this.designation,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
