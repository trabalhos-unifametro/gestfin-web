class User {
  int? ID;
  String? name;
  String? email;
  String? role;
  String? gender;
  String? cellphone;
  String? telephone;
  DateTime? dateBirth;
  double? salary;
  String? password;

  User({
    this.ID,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.cellphone,
    this.telephone,
    this.dateBirth,
    this.salary,
    this.password
  });

  User.fromJson(Map<String, dynamic> json) {
    ID = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    cellphone = json['cellphone'];
    telephone = json['telephone'];
    dateBirth = DateTime.parse(json['date_birth']);
    salary = json['salary'];
  }
}

class RecoveryPassword {
  String? email;
  String? newPassword;
  String? confirmNewPassword;
  String? code;

  RecoveryPassword({
    this.email,
    this.newPassword,
    this.confirmNewPassword,
    this.code
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}