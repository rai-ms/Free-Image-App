import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:wall_paper_app/core/dot_env/env_error.dart';
import 'parser.dart';


class DotEnv
{
  bool _isInitialized = false;
  final Map<String, String> _envMap = {};

  /// A copy of variables loaded at runtime from a file + any entries from mergeWith when loaded.
  Map<String, String> get env {
    if (!_isInitialized) {
      throw NotInitializedError();
    }
    return _envMap;
  }

  bool get isInitialized => _isInitialized;

  /// Clear [env]
  void clearEnv(){
    _envMap.clear();

    _isInitialized = false;
  }

  String getDataFromEnv(String name, {String? fallback}) {
    final value = mayGetDataFromEnv(name, fallback: fallback);
    if(value == null){
      throw Exception('$name variable not found. A non-null fallback is required for missing entries');
    }
    return value;
  }

  String? mayGetDataFromEnv(String name, {String? fallback}) => env[name] ?? fallback;

  /// Loads environment variables from the env file into a map
  /// Merge with any entries defined in [mergeWith]
  Future<void> loadEnv({String fileName = 'app.env', EnvParser parser = const EnvParser(),Map<String, String> mergeWith = const {}, bool isOptional = false}) async {
    clearEnv();
    List<String> linesFromFile;
    try {
      linesFromFile = await _getEntriesFromFile(fileName);
    } on FileNotFoundError {
      if (isOptional) {
        linesFromFile = [];
      } else {
        rethrow;
      }
    }

    final linesFromMergeWith = mergeWith.entries.map((entry) => "${entry.key}=${entry.value}").toList();
    final allLines = linesFromMergeWith..addAll(linesFromFile);
    final envEntries = parser.parse(allLines);
    _envMap.addAll(envEntries);
    _isInitialized = true;
  }

  void loadForTesting({String fileInput = '',
        EnvParser parser = const EnvParser(),
        Map<String, String> mergeWith = const {}}) {
    clearEnv();
    final linesFromFile = fileInput.split('\n');
    final linesFromMergeWith = mergeWith.entries.map((entry) => "${entry.key}=${entry.value}").toList();
    final allLines = linesFromMergeWith..addAll(linesFromFile);
    final envEntries = parser.parse(allLines);
    _envMap.addAll(envEntries);
    _isInitialized = true;
  }

  /// True if all supplied variables have nonempty value; false otherwise.
  /// Differs from [containsKey](dart:core) by excluding null values.
  /// Note [loadEnv] should be called first.
  bool isAllKeyDefined(Iterable<String> vars) => vars.every((k) => _envMap[k]?.isNotEmpty ?? false);

  Future<List<String>> _getEntriesFromFile(String filename) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      var envString = await rootBundle.loadString(filename);
      if (envString.isEmpty) {
        throw EmptyEnvFileError();
      }
      return envString.split('\n');
    } on FlutterError {
      throw FileNotFoundError();
    }
  }
}


