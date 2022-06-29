import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSource{
  static late final  SharedPreferences prefs;
  static init()async{
     prefs = await SharedPreferences.getInstance();
  }

  Future<String?> getDataFromShared(String key)async{
    return prefs.getString(key);
  }
  Future setDataToShared(String key,String data)async{
    return prefs.setString(key,data);
  }
  Future removeKey(String key)async{
    return prefs.remove(key);
  }
  Future isKeyExist(String key)async{
    return prefs.containsKey(key);
  }
}