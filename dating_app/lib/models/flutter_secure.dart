import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecure {
  late FlutterSecureStorage secureStorage;
  FlutterSecure() {
    secureStorage = const FlutterSecureStorage(aOptions: AndroidOptions());
  }
  Future<void> save(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String> get(String key) async {
    return await secureStorage.read(key: key) ?? "";
  }

  Future<Map> getValue() async {
    Map<String, String> allValues = await secureStorage.readAll();
    return allValues;
  }

  void saveData(String email, String password) {
    save("Email", email);
    save("Password", password);
  }

  void clearData() {
    secureStorage.deleteAll();
  }
}
