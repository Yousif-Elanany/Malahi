class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return message;
  }
}

// You can also create specific failure types if needed
class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}
