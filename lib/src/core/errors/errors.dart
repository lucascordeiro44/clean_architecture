abstract class IPostException {
  final String message;
  StackTrace? stackTrace;
  IPostException(this.message, [this.stackTrace]);
}

class ArgumentsException extends IPostException {
  ArgumentsException(String message, {StackTrace? stackTrace})
      : super(message, stackTrace);
}

class DataSoucePostException extends IPostException {
  DataSoucePostException(String message, {StackTrace? stackTrace})
      : super(message, stackTrace);
}
