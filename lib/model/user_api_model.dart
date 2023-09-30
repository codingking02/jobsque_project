class Post {
  int userId;
  String name;
  String email;
  String password;
  Post({
    required this.name,
    required this.email,
    required this.password,
    required this.userId,
  });
  factory Post.fromJson(Map<String, dynamic> _map) {
    Post _post = Post(
      name: _map["body"] ?? '',
      email: _map["title"] ?? '',
      password: _map["title"] ?? '',
      userId: _map["userId"] ?? 0,
    );
    return _post;
  }
}
