import 'package:json_annotation/json_annotation.dart';
import 'package:manual_serialization/models/automatic/company_contact.dart';
import 'package:manual_serialization/models/automatic/employee.dart';

part 'company_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyInfo {
  @JsonKey(name: "company_name")
  String companyName;
  @JsonKey(name: "company_contact")
  CompanyContact companyContact;
  @JsonKey(defaultValue: [])
  List<Employee> employees;

  CompanyInfo({
    required this.companyName,
    required this.companyContact,
    required this.employees,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);
}
