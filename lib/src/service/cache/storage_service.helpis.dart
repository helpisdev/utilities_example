library storage_service;

import 'dart:core';

import 'package:flutter/foundation.dart';
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

    if (!_box!.containsKey(StorageKey.isDarkMode.name)) {
      await _box!.write(StorageKey.isDarkMode.name, null);
    }

    if (!_box!.containsKey(StorageKey.locale.name)) {
      await _box!.write(StorageKey.locale.name, null);
    }
  }

  SharedPreferences? _box;
  static StorageService? _instance;

  /// Reads a value from the cache
  T? read<T>(final String key) => storage._box?.get(key) as T?;

  /// Writes a value to the cache
  Future<bool> write(final String key, final Object? value) async =>
      storage._box?.write(key, value) ?? Future<bool>.value(false);
}

/// Storage getter
StorageService get storage => StorageService.instance();

typedef ListString = List<String>;

/// Utilities to safely access cache or null
extension SafeReadWrite on SharedPreferences {
  /// Write a value if it doesn't exist already or is null
  Future<bool> writeIfNull(final String key, final Object val) async {
    if (!containsKey(key) || get(key) == null) {
      return write(key, val);
    }

    return false;
  }

  /// Write alias
  Future<bool> write(final String key, final Object? val) async {
    if (val == null) {
      // Assigning null is not supported, but trying to access a non-existant
      // key will also return null, so we remove the key if it exists.
      if (containsKey(key)) {
        return remove(key);
      }
      return true;
    }
    return switch (val.runtimeType) {
      bool => await setBool(key, bool.parse(val.toString())),
      int => await setInt(key, int.parse(val.toString())),
      double => await setDouble(key, double.parse(val.toString())),
      String => await setString(key, val.toString()),
      ListString => await setStringList(key, val as ListString),
      _ => throw StateError(
          'Unsupported type ${objectRuntimeType(val, 'unknown')}.'
          '\nSupported value types are:'
          '\n  - bool'
          '\n  - int'
          '\n  - double'
          '\n  - String'
          '\n  - List<String>',
        ),
    };
  }
}

/// Keys of cached values
enum StorageKey {
  isDarkMode,
  locale,
}
