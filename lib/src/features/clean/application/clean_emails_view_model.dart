import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traly/src/features/clean/application/clean_ui_state.dart';
import 'package:traly/src/features/clean/models/clean_emails_response.dart';
import 'package:traly/src/shared/enum/view_state_enum.dart';
import 'package:traly/src/shared/services/api_service/email_repository.dart';

class EmailsViewModel extends AutoDisposeNotifier<EmailsUiState> {
  late EmailRepository _emailRepository;

  @override
  EmailsUiState build() {
    _emailRepository = EmailRepository();
    return EmailsUiState.empty();
  }

  Future<void> fetchEmails() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final emails = await _emailRepository.fetchEmails();

      state = state.copyWith(
        viewState: ViewState.success,
        emails: emails.emails,
        filteredEmails: emails.emails, // Initially, filtered emails are the same as all emails
      );
    } catch (e) {
      state = state.copyWith(
          viewState: ViewState.error, errorMessage: e.toString());
    }
  }

  void filterEmails(Category category) {
    final filteredEmails = state.emails.where((email) {
      if (category.isAll) {
        return true;
      } else if (category.isImportant) {
        return email.category.isImportant;
      } else if (category.isPromotion) {
        return email.category.isPromotion;
      } else if (category.isJunk) {
        return email.category.isJunk;
      }
      return false;
    }).toList();

    state = state.copyWith(filteredEmails: filteredEmails);
  }
}

final emailsViewModelProvider =
    AutoDisposeNotifierProvider<EmailsViewModel, EmailsUiState>(
  () => EmailsViewModel(),
);
