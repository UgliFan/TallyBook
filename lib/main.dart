import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tally_book/pages/TabBarPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tally_book/redux/TBKState.dart';
import 'package:tally_book/models/User.dart';
import 'package:tally_book/common/localization/TBKLocalizationsDelegate.dart';

void main() {
    runApp(new TallyBookApp());
}

class TallyBookApp extends StatelessWidget {
    final store = new Store<TBKState>(appReducer, initialState: new TBKState(userInfo: User.empty()));
    @override
    Widget build(BuildContext context) {
        return new StoreProvider(
            store: store,
            child: new StoreBuilder<TBKState>(
                builder: (context, store) {
                    return new MaterialApp(
                        title: 'Tally Book',
                        localizationsDelegates: [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            TBKLocalizationsDelegate.delegate
                        ],
                        locale: store.state.locale,
                        supportedLocales: [store.state.locale],
                        theme: store.state.themeData,
                        home: new TabBarPage()
                    );
                }
            )
        );
    }
}
