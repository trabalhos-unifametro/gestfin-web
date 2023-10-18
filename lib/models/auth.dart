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
}