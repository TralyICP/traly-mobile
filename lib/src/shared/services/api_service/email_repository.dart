import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:traly/src/features/clean/models/clean_emails_response.dart';

class EmailRepository {
  Future<EmailListModel> fetchEmails() async {
    try {
      final String response = 
    await rootBundle.loadString('assets/json/emails.json');
      final Map<String, dynamic> data = json.decode(response);
      return EmailListModel.fromJson(data);
    } catch (e) {  
    return EmailListModel.empty();
    }
  }

  Future<EmailModel> getEmailById(int id) async {
    try {
      final emailList = await fetchEmails();
      return emailList.emails.firstWhere(
        (email) => email.id == id,
        orElse: () => EmailModel.empty(),
      );
    } catch (e) {
      return EmailModel.empty();
    }
  }


}