import 'dart:convert';

CompanyContact companyContactFromJson(String str) {
  return CompanyContact.fromJson(jsonDecode(str));
}

String companyContactToJson(CompanyContact companyContact) {
  return jsonEncode(companyContact);
}

class CompanyContact {
  String? phone;
  String? email;
  String? address;

  CompanyContact({
    this.phone,
    this.email,
    this.address,
  });

  factory CompanyContact.fromJson(Map<String, dynamic> json) {
    return CompanyContact(
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "email": email,
      "address": address,
    };
  }
}
