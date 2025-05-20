

import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/lesson/domain/repository/localized_bundle_repository.dart';

class GetLocalizedBundleById extends UseCase<Map<String, dynamic>, int> {

  final LocalizedBundleRepository repository;

  GetLocalizedBundleById(this.repository);

  @override
  Future< Map<String, dynamic> > call(int param) async{
    return repository.getLocalizedBundle(param);
  }

}