


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/domains/education/lesson/entity.dart';

final educationRepositoryProvider = Provider<EducationRepository>((ref) {
  return EducationRepository();
});

class EducationRepository {

  Future<Lesson> getLessonById(String id) async{
    await Future.delayed(const Duration(milliseconds: 500));
    return Lesson(title: 'title', description: 'description');
  }

}