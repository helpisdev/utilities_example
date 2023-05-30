library storage_service;

import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

export 'storage_service.helpis.dart';

/// Caching service
class StorageService {
  /// Storage instance
  factory StorageService.instance() => _instance ??= StorageService._();

  StorageService._();

  /// Initialize shared preferences
  Future<void> init() async {
    _box = await SharedPreferences.getInstance();

    await _box!.writeIfNull(StorageKey.isDarkMode.name, false);
    await _box!.writeIfNull(StorageKey.locale.name, 'en');
  }

  SharedPreferences? _box;
  static StorageService? _instance;

  /// Reads a value from the cache
  T? read<T>(final String key) => storage._box?.get(key) as T?;

  /// Writes a value to the cache
  Future<void> write(final String key, final Object value) async =>
      storage._box?.write(key, value);
}

/// Storage getter
StorageService get storage => StorageService.instance();

typedef ListString = List<String>;

/// Utilities to safely access cache or null
extension SafeReadWrite on SharedPreferences {
  /// Write a value if it doesn't exist already or is null
  Future<void> writeIfNull(final String key, final Object val) async {
    if (!containsKey(key) || (containsKey(key) && get(key) == null)) {
      await write(key, val);
    }
  }

  /// Write alias
  Future<void> write(final String key, final Object val) async {
    if (val is bool) {
      await setBool(key, val);
    } else if (val is int) {
      await setInt(key, val);
    } else if (val is double) {
      await setDouble(key, val);
    } else if (val is String) {
      await setString(key, val);
    } else if (val is ListString) {
      await setStringList(key, val);
    } else {
      throw StateError(
        'Unsupported type. Supported value types are:'
        '\n- bool'
        '\n- int'
        '\n- double'
        '\n- String'
        '\n- List',
      );
    }
  }
}

/// Keys of cached values
enum StorageKey {
  isDarkMode,
  locale,
}
