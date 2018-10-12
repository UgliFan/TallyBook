import 'package:redux/redux.dart';
import 'package:tally_book/models/User.dart';

// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<User>([
    TypedReducer<User, UpdateUserAction>(_updateLoaded)
]);

// 如果有UpdateUserAction发起一个请求时, 就会调用到_updateLoaded
// _updateLoaded 这里接受一个新的userInfo，并返回
User _updateLoaded(User user, action) {
    user = action.userInfo;
    return user;
}

class UpdateUserAction {
    final User userInfo;
    UpdateUserAction(this.userInfo);
}