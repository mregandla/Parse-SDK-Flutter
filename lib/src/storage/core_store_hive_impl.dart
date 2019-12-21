part of flutter_parse_sdk;

// ignore_for_file: deprecated_member_use
class CoreStoreHiveImp implements CoreStore {
  CoreStoreHiveImp._internal(this._box);

  static CoreStoreHiveImp _instance;

  static Future<CoreStore> getInstance() async {
    if (_instance == null) {
      String dbDirectory = '';
      if (Platform.isIOS || Platform.isAndroid)
        dbDirectory = (await getApplicationDocumentsDirectory()).path;
      Hive.init('$dbDirectory/parse');
      final Box<dynamic> box = await Hive.openBox<dynamic>('parse.db');
      _instance = CoreStoreHiveImp._internal(box);
    }

    return _instance;
  }

  final Box<dynamic> _box;

  @override
  Future<bool> clear() {
    return _box.deleteFromDisk();
  }

  @override
  Future<bool> containsKey(String key) {
    return Future<bool>.value(_box.containsKey(key));
  }

  @override
  Future<dynamic> get(String key) {
    return _box.get(key);
  }

  @override
  Future<bool> getBool(String key) async {
    final bool storedItem = await _box.get(key);
    return storedItem;
  }

  @override
  Future<double> getDouble(String key) async {
    final double storedItem = await _box.get(key);
    return storedItem;
  }

  @override
  Future<int> getInt(String key) async {
    final int storedItem = await _box.get(key);
    return storedItem;
  }

  @override
  Future<String> getString(String key) async {
    final String storedItem = await _box.get(key);
    return storedItem;
  }

  @override
  Future<List<String>> getStringList(String key) async {
    final List<String> storedItem = await _box.get(key);
    return storedItem;
  }

  @override
  Future<void> remove(String key) {
    return _box.delete(key);
  }

  @override
  Future<void> setBool(String key, bool value) {
    return _box.put(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) {
    return _box.put(key, value);
  }

  @override
  Future<void> setInt(String key, int value) {
    return _box.put(key, value);
  }

  @override
  Future<void> setString(String key, String value) {
    return _box.put(key, value);
  }

  @override
  Future<void> setStringList(String key, List<String> values) {
    return _box.put(key, values);
  }
}
