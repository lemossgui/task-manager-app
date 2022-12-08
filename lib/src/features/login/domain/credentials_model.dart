import 'dart:convert';

class CredentialsModel {
  final String identifier;
  final String password;

  CredentialsModel({
    required this.identifier,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identifier': identifier});
    result.addAll({'password': password});

    return result;
  }

  String toJson() => json.encode(toMap());
}
