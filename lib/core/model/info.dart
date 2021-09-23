class Info {
  String website = "";
  String username = "";
  String password = "";

  Info({required this.website, required this.username, required this.password});

  Info.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['website'] = this.website;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
