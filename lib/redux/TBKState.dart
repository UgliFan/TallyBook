import 'package:flutter/material.dart';
import 'package:tally_book/models/User.dart';
import 'package:tally_book/redux/UserRedux.dart';
import 'package:tally_book/redux/LocaleRedux.dart';
import 'package:tally_book/redux/ThemeRedux.dart';

class TBKState {
    User userInfo;
    Locale locale;
    ThemeData themeData;
    TBKState({this.userInfo, this.locale, this.themeData});
}

TBKState appReducer(TBKState state, action) {
    return TBKState(
        userInfo: UserReducer(state.userInfo, action),
        locale: LocaleReducer(state.locale, action),
        themeData: ThemeDataReducer(state.themeData, action)
    );
}