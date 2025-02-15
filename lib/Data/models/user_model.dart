
class UserModel {
  final String id;
  final String name;
  final String email;
  final String mobile;
  final String profileImageUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.profileImageUrl,

  });

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'Mobile': mobile,
      'ProfileImageUrl': profileImageUrl,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['Name'] ?? '',
      email: json['Email'] ?? '',
      mobile: json['Mobile'] ?? '',
      profileImageUrl: json['ProfileImageUrl'] ?? '',
    );
  }
}
