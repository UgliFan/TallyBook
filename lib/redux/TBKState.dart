import 'package:tally_book/models/User.dart';
import 'package:tally_book/redux/UserRedux.dart';

class TBKState {
    User userInfo;
    TBKState({this.userInfo});
}

TBKState appReducer(TBKState state, action) {
    return TBKState(
        userInfo: UserReducer(state.userInfo, action)
    );
}