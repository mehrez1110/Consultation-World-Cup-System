class CurrentUserType {
  final area;
  final firstName;
  final lastName;
  final phoneNumber;
  final id;
  final accessToken;
  final isEmailVerified;
  final isDeleted;
  final isPhoneVerified;
  final isNotificationEnabled;
  final gender;
  final birthDate;
  final favoriteSport;
  final wallet;
  final fcmToken;
  final nationality;

  CurrentUserType({
    this.firstName = 'user',
    this.area,
    this.lastName,
    this.phoneNumber,
    this.id,
    this.accessToken,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.isDeleted,
    this.isNotificationEnabled,
    this.gender,
    this.birthDate,
    this.favoriteSport,
    this.wallet = 0.0,
    this.fcmToken,
    this.nationality,
  });
}
