class UserModel {
  String? uId;
  String? name;
  String? image;
  String? phone;
  String? address;

  UserModel({
    this.uId,
    this.name,
    this.image,
    this.phone,
    this.address,
  });

  UserModel.fromMap(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toMap() => {
    'uId': uId,
    'name': name,
    'image': image,
    'phone': phone,
    'address': address,
  };
}