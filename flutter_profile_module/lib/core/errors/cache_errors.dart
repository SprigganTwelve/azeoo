

//Cache

class CheckUserInCacheException implements Exception {
  final String? message;
  
  CheckUserInCacheException([this.message]);

  @override
  String toString() => message ?? "CheckUserInCacheException";
}



class SaveUserInToCacheException implements Exception {
  final String? message;
  
  SaveUserInToCacheException([this.message]);

  @override
  String toString() => message ?? "SaveUserInToCacheException";
}
