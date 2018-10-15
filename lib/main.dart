import 'package:flutter/material.dart';
import 'package:tally_book/pages/TabBarPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tally_book/redux/TBKState.dart';
import 'package:tally_book/models/User.dart';

void main() {
    runApp(new TallyBookApp());
}

class TallyBookApp extends StatelessWidget {
    final store = new Store<TBKState>(appReducer, initialState: new TBKState(userInfo: User.empty()));
    @override
    Widget build(BuildContext context) {
        return new StoreProvider(
            store: store,
            child: new MaterialApp(
                title: 'Tally Book',
                theme: new ThemeData(
                    primaryColor: Colors.black,
                    buttonColor: Colors.white
                ),
                home: new TabBarPage()
            )
        );
    }
}
