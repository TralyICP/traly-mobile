class LeaderboardListModel {
  final List<LeaderBoardModel> leaderboard;

  LeaderboardListModel({required this.leaderboard});

  factory LeaderboardListModel.fromJson(Map<String, dynamic> json) {
    var list = json['leaderboard'] as List;
    List<LeaderBoardModel> leaderboardList = list.map((i) => LeaderBoardModel.fromJson(i)).toList();
    return LeaderboardListModel(leaderboard: leaderboardList);
  }

  Map<String, dynamic> toJson() {
    return {
      'leaderboard': leaderboard.map((person) => person.toJson()).toList(),
    };
  }

  LeaderboardListModel copyWith({List<LeaderBoardModel>? leaderboard}) {
    return LeaderboardListModel(
      leaderboard: leaderboard ?? this.leaderboard,
    );
  }

  factory LeaderboardListModel.empty() {
    return LeaderboardListModel(leaderboard: []);
  }
}

class LeaderBoardModel {
  final int rank;
  final String name;
  final int points;
  final int badges;

  LeaderBoardModel({
    required this.rank,
    required this.name,
    required this.points,
    required this.badges,
  });

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    return LeaderBoardModel(
      rank: json['rank'],
      name: json['name'],
      points: json['points'],
      badges: json['badges'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'name': name,
      'points': points,
      'badges': badges,
    };
  }

  LeaderBoardModel copyWith({
    int? rank,
    String? name,
    int? points,
    int? badges,
  }) {
    return LeaderBoardModel(
      rank: rank ?? this.rank,
      name: name ?? this.name,
      points: points ?? this.points,
      badges: badges ?? this.badges,
    );
  }

  factory LeaderBoardModel.empty() {
    return LeaderBoardModel(
      rank: 0,
      name: '',
      points: 0,
      badges: 0,
    );
  }
}
