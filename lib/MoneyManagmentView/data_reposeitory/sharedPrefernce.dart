
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileHelper {
  static late SharedPreferences sharedPreferences;
  static initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setFirstTime() {
    sharedPreferences.setBool('isFirst', false);
  }

  static bool getFirstTime() {
    return sharedPreferences.getBool('isFirst') ?? true;
  }
}
