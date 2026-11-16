class UserModel {
  final String name;
  final String email;
  final String phone;
  final String address;
  final List favData;
  final List myOrder;

  UserModel({
    required this.name,
    required this.email,
    this.phone = '',
    this.address = '',
    required this.favData,
    required this.myOrder,
  });

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'favData': favData,
      'myOrder': myOrder,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      favData: json['favData'] ?? [],
      myOrder: json['myOrder'] ?? [],
    );
  }
}