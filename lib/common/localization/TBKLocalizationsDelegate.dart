import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tally_book/common/localization/DefaultLocalizations.dart';

class TBKLocalizationsDelegate extends LocalizationsDelegate<TBKLocalizations> {
    TBKLocalizationsDelegate();

    @override
    bool isSupported(Locale locale) {
        return ['en', 'zh'].contains(locale?.languageCode ?? 'zh');
    }

    @override
    Future<TBKLocalizations> load(Locale locale) {
        return new SynchronousFuture<TBKLocalizations>(new TBKLocalizations(locale));
    }

    @override
    bool shouldReload(LocalizationsDelegate<TBKLocalizations> old) {
        return false;
    }

    static TBKLocalizationsDelegate delegate = new TBKLocalizationsDelegate();
}