
abstract class UseCase<R, P> {
  Future<R> call(P param);
}

class NoParam {
  const NoParam();
}
