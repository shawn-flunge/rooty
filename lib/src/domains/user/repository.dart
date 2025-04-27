


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/domains/education/lesson/entity.dart';
import 'package:rooty/src/domains/user/entity.dart';

final educationRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

class UserRepository {

  Future<User> getUserByToken(String token) async{
    await Future.delayed(const Duration(milliseconds: 500));
    return User(nickname: 'nickname');
  }

}