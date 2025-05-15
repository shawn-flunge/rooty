



import 'package:data_source/data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rooty/supabase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  setUp(() async{
    SharedPreferences.setMockInitialValues({});
    await SupabaseOptions.initialize();
  });

  test('test education data source works', () async {

    final source = EducationDataSource();
    await source.getRoots();
  });

}