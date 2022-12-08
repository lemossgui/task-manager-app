import 'dart:convert';

class CredentialsModel {
  final String email;
  final String password;

  CredentialsModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  String toJson() => json.encode(toMap());
}
