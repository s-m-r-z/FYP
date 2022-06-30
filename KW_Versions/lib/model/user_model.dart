class User {
  final String name;
  final String? email;
  final String phone;
  final String? userid;
  final String? docId;
  final String? password;

  const User(
      {required this.name,
      this.email,
      required this.phone,
      this.userid,
      this.docId,
      this.password});

  factory User.fromJson(Map<String, dynamic> map, String docId) {
    return User(
        name: map['Name'],
        email: map['email'],
        phone: map['phone'],
        password: map['password'],
        docId: docId);
  }

  Map<String, dynamic> toJson() {
    return {'Name': name, 'phone': phone, 'email': email};
  }
}
