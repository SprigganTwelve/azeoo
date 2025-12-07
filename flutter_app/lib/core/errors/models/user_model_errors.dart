


class UserModelCovertIntoFactoryException implements Exception {
  final String? message;
  
  UserModelCovertIntoFactoryException([this.message]);

  @override
  String toString() => message ?? "UserModelCovertIntoFactoryException";
}
