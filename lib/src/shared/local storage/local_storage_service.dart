import 'local_storage_interface.dart';

final class LocalStorageService implements LocalStorageInterface {
  
  @override
  Future<void> setLaunchState(String state) {
    // TODO: implement setLaunchState
    throw UnimplementedError();
  }
  
  @override
  Future<void> setThememode(String themMode) {
    // TODO: implement setThememode
    throw UnimplementedError();
  }
  
  @override
  Future<void> setTransactionPin(String pin) {
    // TODO: implement setTransactionPin
    throw UnimplementedError();
  }
  
  @override
  Future<void> setUserEmail(String email) {
    // TODO: implement setUserEmail
    throw UnimplementedError();
  }
  
  @override
  Future<void> setUserPassword(String password) {
    // TODO: implement setUserPassword
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement themeMode
  Future<String> get themeMode => throw UnimplementedError();
  
  @override
  // TODO: implement userEmail
  Future<String> get userEmail => throw UnimplementedError();
  
  @override
  // TODO: implement userPassword
  Future<String> get userPassword => throw UnimplementedError();
  
  @override
  // TODO: implement userPin
  Future<String> get userPin => throw UnimplementedError();

  
  // static const _bearerKey = 'bearer_token';
  // static const _refreshTokenKey = 'refresh_token';
  // static const _emailKey = 'user_email';
  // static const _passwordKey = 'user_password';
  // static const _pinKey = 'user_pin';
  // static const _biometricsEnabledKey = 'biometrics_enabled';
  // static const _transactionsBiometricsKey = 'transactions_biometrics';
  // static const _hideBalanceKey = 'hide_balance';
  // static const _primaryAccountNumberKey = 'primary_account_number';
  // static const _homeCoachMarkKey = 'home_coach_mark';
  // static const _themeModeKey = 'theme_mode';
  // static const _lastBioLockedDate = 'last_bio_lock';
  
}
