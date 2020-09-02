class UserProfile {
  final imageUrl;

  UserProfile(this.imageUrl);
}

class User {
  final username;
  final email;
  final UserProfile profile;

  User(this.username, this.email, this.profile);

  static User fetchUser() {
    return User(
      'trixy',
      'trixy@mail.com',
      UserProfile('https://randomuser.me/api/portraits/women/21.jpg'),
    );
  }
}

class TestUser {
  final id;
  final email;
  final username;
  // final UserProfile profile;

  TestUser({this.id, this.username, this.email});

  factory TestUser.fromJson(Map<String, dynamic> json) {
    return TestUser(
      id: json['id'],
      email: json['email'],
      username: json['username'],
    );
  }

  // static User fetchUser() {
  //   return User(
  //     'trixy',
  //     'trixy@mail.com',
  //     UserProfile('https://randomuser.me/api/portraits/women/21.jpg'),
  //   );
  // }
}
