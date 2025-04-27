

import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/domains/user/entity.dart';
import 'package:rooty/src/domains/user/repository.dart';

class GetUserByToken extends UseCase<User, String> {

  final UserRepository repository;
  GetUserByToken(this.repository);

  @override
  Future<User> call(String param) async{
    return repository.getUserByToken(param);
  }
}