/// Custom exception for data layer
class CustomExceptions implements Exception {
  /// Constructor
  CustomExceptions({this.errorMessage = ''});

  /// A message of error
  final String errorMessage;
}

/// Error for JsonSerialzation
class JsonSerializationException extends CustomExceptions {
  /// Use superconstructor for save error message
  JsonSerializationException({super.errorMessage});
}

/// Error of Status code
class StatusCodeException extends CustomExceptions {
  /// Use superconstructor for save error message
  StatusCodeException({super.errorMessage});
}

/// Dio exception
class OnDioException extends CustomExceptions {
  /// Use superconstructor for save error message
  OnDioException({super.errorMessage});
}

/// BadResponseDio Exception
class BadResponseDioException extends CustomExceptions {
  /// Use superconstructor for save error message
  BadResponseDioException({super.errorMessage});
}

/// TimeOutDio exception
class TimeOutDioException extends CustomExceptions {
  /// Use superconstructor for save error message
  TimeOutDioException({super.errorMessage});
}

/// SocketDio exception
class SocketDioException extends CustomExceptions {
  /// Use superconstructor for save error message
  SocketDioException({super.errorMessage});
}
