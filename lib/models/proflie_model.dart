class ProfileModel {
  ProfileModel({
    required this.name,
    required this.usermail,
    this.phoneNumber,
    this.profileImage,
  });
  String name;
  String usermail;
  String? profileImage;
  String? phoneNumber;
  //TODO: Add the remaining properties later
}
