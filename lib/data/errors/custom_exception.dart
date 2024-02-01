class CustomExceptions implements Exception {
  CustomExceptions({this.errorMessage = ''});

  final String errorMessage;
}

class JsonSerializationException extends CustomExceptions {
  JsonSerializationException({super.errorMessage});
}

class StatusCodeException extends CustomExceptions {
  StatusCodeException({super.errorMessage});
}

class OnDioException extends CustomExceptions {
  OnDioException({super.errorMessage});
}
