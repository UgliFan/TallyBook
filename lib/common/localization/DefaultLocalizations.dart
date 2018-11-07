import 'package:flutter/material.dart';
import 'package:tally_book/common/language/TBKStringBase.dart';
import 'package:tally_book/common/language/TBKStringEn.dart';
import 'package:tally_book/common/language/TBKStringZh.dart';

class TBKLocalizations {
    final Locale locale;

    TBKLocalizations(this.locale);

    static Map<String, TBKStringBase> _localizedValues = {
        'en': new TBKStringEn(),
        'zh': new TBKStringZh()
    };

    TBKStringBase get currentLocalized {
        return _localizedValues[locale?.languageCode ?? 'zh'];
    }

    static TBKLocalizations of(BuildContext context) {
        return Localizations.of(context, TBKLocalizations);
    }
}