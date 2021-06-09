// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) {
  return CompanyInfo(
    companyName: json['company_name'] as String,
    companyContact: CompanyContact.fromJson(
        json['company_contact'] as Map<String, dynamic>),
    employees: (json['employees'] as List<dynamic>?)
            ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'company_name': instance.companyName,
      'company_contact': instance.companyContact.toJson(),
      'employees': instance.employees.map((e) => e.toJson()).toList(),
    };
