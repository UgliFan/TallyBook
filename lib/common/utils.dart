import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tally_book/common/language/TBKStringBase.dart';
import 'package:tally_book/common/localization/DefaultLocalizations.dart';
import 'package:flutter/services.dart';

class CommonUtils {
    static launchOutURL(String url, BuildContext context) async {
        if (await canLaunch(url)) {
            await launch(url);
        } else {
            Fluttertoast.showToast(msg: CommonUtils.getLocale(context).webview_launcher_error + ': ' + url);
        }
    }

    static TBKStringBase getLocale(BuildContext context) {
        return TBKLocalizations.of(context).currentLocalized;
    }

    static copy(String data, BuildContext context) {
        Clipboard.setData(new ClipboardData(text: data));
        Fluttertoast.showToast(msg: CommonUtils.getLocale(context).option_share_copy_success);
    }
}