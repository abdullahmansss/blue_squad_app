class UserModel {
  String? uId;
  String? name;
  String? phone;
  String? address;

  UserModel({
    this.uId,
    this.name,
    this.phone,
    this.address,
  });

  UserModel.fromMap(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toMap() => {
    'uId': uId,
    'name': name,
    'phone': phone,
    'address': address,
  };
}
