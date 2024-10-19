import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/models.dart';
import 'package:jala_verification/app/data/local/local_storage.dart';
import 'package:jala_verification/app/services/appwrite_services.dart';

class AuthRepositories {
  User? _current;
  User? get current => _current;

  Session? _session;
  Session? get session => _session;

  Future<Session?> get _cachedSession async {
    final cached = await LocalStorage.get("session");

    if (cached == null) {
      return null;
    }

    return Session.fromMap(json.decode(cached));
  }

  Future<bool> isValid() async {
    if (session == null) {
      final cached = await _cachedSession;
      if (cached == null) {
        return false;
      }

      _session = cached;
    }

    return _session != null;
  }

  Future<void> register(String email, String password, String? name) async {
    try {
      final result = await AppwriteServices.account.create(
        userId: 'unique()',
        email: email, 
        password: password, 
        name: name
      );
      log('Success Register $result');

      _current = result;
    } catch(e) {
      log('Error Register $e');
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final result = await AppwriteServices.account.createEmailPasswordSession(email: email, password: password);
      print('result ${result.toMap()}');
      _session = result;

      LocalStorage.set("session", json.encode(result.toMap()));
    } catch(e) {
      _session = null;
      log('Error Login $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final ses = await _cachedSession;
      await AppwriteServices.account.deleteSession(sessionId: ses?.$id ?? '');

      LocalStorage.remove("session");
    } catch(e) {
      log('Error logout $e');
      rethrow;
    }
  }
}