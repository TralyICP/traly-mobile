class EmailListModel {
  final List<EmailModel> emails;

  const EmailListModel({required this.emails});

  factory EmailListModel.fromJson(Map<String, dynamic> json) {
    return EmailListModel(
        emails: (json['emails'] as List)
            .map((item) => EmailModel.fromJson(item))
            .toList());
  }
  Map<String, dynamic> toJson() {
    return {
      'emails': emails.map((email) => email.toJson()).toList(),
    };
  }

  EmailListModel copyWith({List<EmailModel>? emails}) {
    return EmailListModel(
      emails: emails ?? this.emails,
    );
  }

  factory EmailListModel.empty() {
    return const EmailListModel(emails: []);
  }
}

class EmailModel {
  final int id;
  final String title;
  final String subtitle;
  final Category category;
  final String imageUrl;

  EmailModel(
      {required this.category,
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      id: json['id'],
      imageUrl: json['imageUrl'] ?? '',
      title: json['title'],
      subtitle: json['subtitle'],
      category: Category.values.firstWhere((e) => e.value == json['category'].toString().toLowerCase(),
          orElse: () => Category.junk),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'title': title,
        'subtitle': subtitle,
        'category': category,
      };

  EmailModel copyWith({
    String? imageUrl,
    String? title,
    String? subtitle,
    Category? category,
    int? id,
  }) {
    return EmailModel(
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        category: category ?? this.category,
        id: id ?? this.id);
  }

  factory EmailModel.empty() => EmailModel(
      imageUrl: '', title: '', subtitle: '', category: Category.junk, id: 0);
}

enum Category {
  all("all"),
  important("important"),
  promotion("promotions"),
  junk("junk");

  final String value;

  const Category(this.value);
  bool get isAll => this == Category.all;

  bool get isImportant => this == Category.important;
  bool get isPromotion => this == Category.promotion;
  bool get isJunk => this == Category.junk;
}
