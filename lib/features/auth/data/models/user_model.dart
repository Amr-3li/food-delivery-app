class UserModel{
   String? name ;
  final String email;
  final String password;
   String ?phone ;
   String ?bio;
  String? passwordConfirmation;
  String? otp;

  UserModel({ this.name, required this.email, required this.password,  this.phone, this.bio , this.otp , this.passwordConfirmation});
 Map<String , dynamic> registerDataToJson(){
return {
  "name": name,
  "email": email,
  "password": password,
  "phone": phone,
  "bio": bio,
};
}
Map<String , dynamic> resetPasswordDataToJson(){
return {
    "email":email,
    "otp":otp,
    "password":password,
    "password_confirmation":password
};
}
}