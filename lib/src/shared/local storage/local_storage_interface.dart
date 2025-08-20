import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traly/src/shared/local%20storage/local_storage_service.dart';


abstract interface class LocalStorageInterface {
  // Future<String> get bearerToken;

  // Future<String> get refreshToken;

  // Future<void> setBearerToken(String token);
  // Future<void> clearData();

  // Future<void> setLastBioLockTime(String dateTime);

  // Future<String> get lastBioLockTime;

  // Future<void> setRefreshToken(String refreshToken);

  // Future<String> get launchState;

  Future<void> setLaunchState(String state);

  Future<String> get userEmail;

  Future<void> setUserEmail(String email);

  Future<String> get userPassword;

  Future<String> get userPin;

  Future<void> setUserPassword(String password);

  Future<void> setTransactionPin(String pin);

  // Future<void> setPrimaryAccountNumber(String accountNumber);

  // Future<String> get primaryAccountNumber;

  // Future<bool> get biometricsEnabled;

  // Future<bool> get transactionBiometricsEnabled;

  // Future<void> setBiometricsEnabled(bool enabled);

  // Future<void> setTransactionsBiometrics(bool enabled);

  // Future<void> setHideBalance(bool hideBalance);

  // Future<bool> get getHideBalance;

  // Future<void> setShowHomeCoachMark(bool showCoachMark);

  // Future<bool> get getHomeCoachMark;

  Future<void> setThememode(String themMode);
  Future<String> get themeMode;
}

final localStorageServiceProvider =
    Provider.autoDispose<LocalStorageInterface>((ref) {
  return LocalStorageService();
});
