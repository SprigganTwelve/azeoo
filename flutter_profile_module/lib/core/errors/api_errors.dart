//API


class FetchAPIStatusException implements Exception {
  final String? message;
  
  FetchAPIStatusException([this.message]);

  @override
  String toString() => message ?? "FetchAPIStatusException";
}



class InvalidateAPIResponseException implements Exception {
  final String? message;
  
  InvalidateAPIResponseException([this.message]);

  @override
  String toString() => message ?? "InvalidateAPIResponseException";
}
