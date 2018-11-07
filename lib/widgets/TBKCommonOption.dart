import 'package:flutter/material.dart';
import 'package:tally_book/common/utils.dart';
import 'package:share/share.dart';

class TBKCommonOption extends StatelessWidget {
    final List<TBKOptionModel> otherList;
    final OptionControl control;
    TBKCommonOption(this.control, { this.otherList });

    _renderHeaderPopItem(List<TBKOptionModel> list) {
        return new PopupMenuButton<TBKOptionModel>(
            child: new Icon(Icons.more),
            onSelected: (model) {
                model.selected(model);
            },
            itemBuilder: (BuildContext context) {
                return _renderHeaderPopItemChild(list);
            },
        );
    }
    _renderHeaderPopItemChild(List<TBKOptionModel> data) {
        List<PopupMenuEntry<TBKOptionModel>> list = new List();
        for (TBKOptionModel item in data) {
            list.add(PopupMenuItem<TBKOptionModel>(
                value: item,
                child: new Text(item.name)
            ));
        }
        return list;
    }

    @override
    Widget build(BuildContext context) {
        List<TBKOptionModel> list = [
            new TBKOptionModel(CommonUtils.getLocale(context).option_web, CommonUtils.getLocale(context).option_web, (model) {
                CommonUtils.launchOutURL(control.url, context);
            }),
            new TBKOptionModel(CommonUtils.getLocale(context).option_copy, CommonUtils.getLocale(context).option_copy, (model) {
                CommonUtils.copy(control.url ?? '', context);
            }),
            new TBKOptionModel(CommonUtils.getLocale(context).option_share, CommonUtils.getLocale(context).option_share, (model) {
                Share.share(CommonUtils.getLocale(context).option_share_title + control.url ?? '');
            })
        ];
        if (otherList != null && otherList.length > 0) {
            list.addAll(otherList);
        }
        return _renderHeaderPopItem(list);
    }
}

class OptionControl {
    String url = 'https://139.224.133.72/';
}

class TBKOptionModel {
    final String name;
    final String value;
    final PopupMenuItemSelected<TBKOptionModel> selected;

    TBKOptionModel(this.name, this.value, this.selected);
}