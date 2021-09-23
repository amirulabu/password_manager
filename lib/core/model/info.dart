import 'dart:convert';

class Info {
  String? website;
  String? username;
  String? password;

  Info({
    this.website,
    this.username,
    this.password,
  });

  Info.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson(Info info) => {
        'email': info.website,
        'username': info.username,
        'password': info.password,
      };

  String encodeUser(Info info) => json.encode(toJson(info));

  Info decodeUser(String user) => Info.fromJson(json.decode(user));
}

class UsernameResponse {
  String? message;
  int? status;

  UsernameResponse({this.message, this.status});

  UsernameResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
