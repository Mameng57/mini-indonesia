class User {
  int? idUser;
  String? name;
  String? phone;
  String? email;
  String? address;
  int? idRole;

  User({
    this.idUser,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.idRole,
  });

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    idRole = json['id_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser as int;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['id_role'] = this.idRole as int;
    return data;
  }
}
