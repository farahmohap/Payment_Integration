abstract class Failure {
  final String errMesage;

  Failure(this.errMesage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMesage);
}
