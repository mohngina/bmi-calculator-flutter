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
