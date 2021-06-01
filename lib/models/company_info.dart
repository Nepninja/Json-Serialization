import 'dart:convert';

import 'package:manual_serialization/models/company_contact.dart';
import 'package:manual_serialization/models/employee.dart';

CompanyInfo companyInfoFromJson(String str) =>
    CompanyInfo.fromJson(json.decode(str));

String companyInfoToJson(CompanyInfo data) => json.encode(data.toJson());

class CompanyInfo {
  String? companyName;
  CompanyContact? companyContact;
  List<Employee>? employees;

  CompanyInfo({
    this.companyName,
    this.companyContact,
    this.employees,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      companyName: json["company_name"],
      companyContact: CompanyContact.fromJson(json["company_contact"]),
      employees: List<Employee>.from(
        json["employees"].map((e) => Employee.fromJson(e)),
      ).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "company_name": companyName,
      "company_contact": companyContact?.toJson(),
      "employees":
          List<dynamic>.from(employees!.map((e) => e.toJson())).toList(),
    };
  }
}
