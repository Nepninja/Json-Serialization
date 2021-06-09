// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyContact _$CompanyContactFromJson(Map<String, dynamic> json) {
  return CompanyContact(
    phone: json['phone'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$CompanyContactToJson(CompanyContact instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };
