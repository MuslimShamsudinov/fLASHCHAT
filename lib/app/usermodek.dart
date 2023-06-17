class Usermodel {
  final String? name;
  final String? email;
  final String? id;

  Usermodel({this.name, this.email, this.id});
  Map<String, dynamic> fromJson() {
    return {'name': name, 'email': email, 'id': id};
  }
}
