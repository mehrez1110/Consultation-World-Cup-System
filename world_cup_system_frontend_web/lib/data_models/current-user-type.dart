import 'package:world_cup_system_frontend_web/common/components/ticket.dart';

class CurrentUserType {
  int id;
  String username;
  String password;
  String firstName;
  String lastName;
  String birthDate;
  String gender;
  String nationality;
  String status;
  String email;

  List<dynamic> role;
  List<Ticket> userTickets;

  CurrentUserType({
    this.firstName = 'user',
    this.lastName = 'user',
    this.id = 0,
    this.username = '',
    this.password = '',
    this.birthDate = " ",
    this.email = '',
    this.gender = '',
    this.nationality = '',
    this.status = '',
    this.role = const [],
    this.userTickets = const [],
  });

  static fromJson(jsonResponse) {
    return CurrentUserType(
      id: jsonResponse['id'],
      username: jsonResponse['username'],
      password: jsonResponse['password'],
      firstName: jsonResponse['firstName'],
      lastName: jsonResponse['lastName'],
      birthDate: jsonResponse['birthDate'],
      gender: jsonResponse['gender'],
      nationality: jsonResponse['nationality'],
      status: jsonResponse['status'],
      email: jsonResponse['email'],
      role: List<Role>.from(jsonResponse['role'].map((x) => Role.fromJson(x))),
    );
  }
}

class Role {
  int id;
  String name;
  List users;

  Role({this.id = 0, this.name = '', this.users = const []});

  static fromJson(jsonResponse) {
    return Role(
      id: jsonResponse['id'],
      name: jsonResponse['name'],
      users: jsonResponse['users'],
    );
  }
}
