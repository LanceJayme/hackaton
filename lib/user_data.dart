class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() {
    return _instance;
  }

  UserData._internal();

  String? username;

  void setUsername(String name) {
    username = name;
  }

  String? getUsername() {
    return username;
  }
}
