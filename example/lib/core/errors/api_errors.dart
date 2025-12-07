//API

class FetchAPIException implements Exception {
  final String? message;
  
  FetchAPIException([this.message]);

  @override
  String toString() => message ?? "FetchAPIException";
}



class InvalidateAPIResponseException implements Exception {
  final String? message;
  
  InvalidateAPIResponseException([this.message]);

  @override
  String toString() => message ?? "InvalidateAPIResponseException";
}
