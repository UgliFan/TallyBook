import 'package:flutter/material.dart';

class TBKInput extends StatefulWidget {
    final bool obscureText;
    final String hintText;
    final IconData iconData;
    final ValueChanged<String> onChanged;
    final TextStyle textStyle;
    final TextEditingController controller;
    TBKInput({
        Key key,
        this.hintText,
        this.iconData,
        this.onChanged,
        this.textStyle,
        this.controller,
        this.obscureText = false
    }) : super(key: key);

    @override
    _TBKInputState createState() => new _TBKInputState(hintText, iconData, onChanged, textStyle, controller, obscureText);
}

class _TBKInputState extends State<TBKInput> {
    final bool obscureText;
    final String hintText;
    final IconData iconData;
    final ValueChanged<String> onChanged;
    final TextStyle textStyle;
    final TextEditingController controller;
    _TBKInputState(this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller, this.obscureText) : super();
    @override
    Widget build(BuildContext context) {
        return new TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: new InputDecoration(
                hintText: hintText,
                icon: iconData == null ? null : new Icon(iconData)
            )
        );
    }
}