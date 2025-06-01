

import 'package:package_info_plus/package_info_plus.dart';
import 'package:rooty/src/core/usecase.dart';

class GetVersion extends UseCase<String, NoParam> {
  @override
  Future<String> call(NoParam param) async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }
  
  
}