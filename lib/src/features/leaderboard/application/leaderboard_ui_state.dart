import 'package:traly/src/features/leaderboard/models/leaderboard_response.dart';
import 'package:traly/src/shared/enum/view_state_enum.dart';

class LeaderboardUistate {
  final ViewState viewState;
  final String errorMessage;
  final String token;
  final List<LeaderBoardModel> people;

  LeaderboardUistate(
      {required this.viewState,
      required this.errorMessage,
      required this.token,
      required this.people});

  /// Factory constructor for an empty state
  factory LeaderboardUistate.empty() {
    return LeaderboardUistate(
      viewState: ViewState.idle,
      errorMessage: '',
      token: '',
       people: [],
    );
  }

  LeaderboardUistate copyWith({
    ViewState? viewState,
    String? errorMessage,
    String? token,
    List<LeaderBoardModel>? people,
  }) {
    return LeaderboardUistate(
      viewState: viewState ?? this.viewState,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage, 
      people: people ?? this.people,
      
    );
  }
}
