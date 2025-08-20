import 'package:traly/src/features/clean/models/clean_emails_response.dart';
import 'package:traly/src/shared/enum/view_state_enum.dart';

class EmailsUiState {
  final ViewState viewState;
  final String errorMessage;
  final String token;
  final List<EmailModel> emails;
  final List<EmailModel> filteredEmails;

  EmailsUiState(
      {this.viewState = ViewState.idle,
      required this.errorMessage,
      required this.token,
      required this.emails,
      required this.filteredEmails,
  });

  /// Factory constructor for an empty state
  factory EmailsUiState.empty() {
    return EmailsUiState(
      viewState: ViewState.idle,
      errorMessage: '',
      token: '',
      emails: [],
      filteredEmails: [],
    );
  }

  /// CopyWith method to create a new instance with modified fields
  EmailsUiState copyWith({
    ViewState? viewState,
    String? errorMessage,
    String? token,
    List<EmailModel>? emails,
    List<EmailModel>? filteredEmails,
  }) {
    return EmailsUiState(
      viewState: viewState ?? this.viewState,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
      emails: emails ?? this.emails,
      filteredEmails: filteredEmails ?? this.filteredEmails,
    );
  }
}
