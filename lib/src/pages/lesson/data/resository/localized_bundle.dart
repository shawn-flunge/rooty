


import 'package:data_source/data_source.dart';
import 'package:rooty/src/pages/lesson/domain/repository/localized_bundle_repository.dart';

class LocalizedBundleRepositoryImpl extends LocalizedBundleRepository {
  late final L10nDataSource _source;

  LocalizedBundleRepositoryImpl() {
    _source = L10nDataSource();
  }

  @override
  Future< Map<String, dynamic> > getLocalizedBundle(int lessonId) async{
    final bundle = await _source.getLessonPageLocalizedBundle(lessonId);
    return bundle;
  }
}