// user_model.dart
class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class UserListResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> users;
  final Support support;

  UserListResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.users,
    required this.support,
  });

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    var userList = json['data'] as List;
    List<User> users = userList.map((i) => User.fromJson(i)).toList();

    return UserListResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      users: users,
      support: Support.fromJson(json['support']),
    );
  }
}

class Support {
  final String url;
  final String text;

  Support({required this.url, required this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}