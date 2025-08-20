import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traly/src/shared/local%20storage/local_storage_interface.dart';
import 'package:traly/src/features/splash/application/splash_routing.dart';



enum AppState { login, signOut, logout }

class AppUiState extends Equatable {
  final AppState appState;

  const AppUiState({this.appState = AppState.logout});

  AppUiState copyWith({AppState? appState}) {
    return AppUiState(appState: appState ?? this.appState);
  }

  @override
  List<Object?> get props => [appState];
}

class AppStateViewModel extends Notifier<AppUiState> {
  late final LocalStorageInterface _storageService;

  @override
  AppUiState build() {
    _storageService = ref.read(localStorageServiceProvider);
    return const AppUiState();
  }

  void login() {
    _storageService.setLaunchState(ProgramStart.loggedIn.state);
    state = state.copyWith(appState: AppState.login);
  }

  void logout() {
    _storageService.setLaunchState(ProgramStart.loggedOut.state);
    state = state.copyWith(appState: AppState.logout);
  }

  void signOut() {
    _storageService.setLaunchState(ProgramStart.firstLaunch.state);
    
   // _storageService.clearData();
   // _storageService.setBiometricsEnabled(false);
 //   _storageService.setTransactionsBiometrics(false);
    state = state.copyWith(appState: AppState.signOut);
  }
}

final appStateVMNotifier =
    NotifierProvider<AppStateViewModel, AppUiState>(() => AppStateViewModel());
