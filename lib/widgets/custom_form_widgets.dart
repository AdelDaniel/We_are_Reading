import 'package:flutter/material.dart';

class MyCustomInput extends StatelessWidget {
  final String labelText;
  final EdgeInsets containerMargin;
  final String initialValue;
  final String errorText;
  final Color labelColor;
  final bool expands;
  final FormFieldValidator<String> validator;
  final int inputMaxLines;
  final bool enabled;
  final TextInputType inputType;
  final EdgeInsets contentPadding;
  final ValueChanged<String> onFieldSubmitted;
  final TextInputAction textInputAction;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final String placeholder;
  final TextEditingController textEditingController;
  final bool obsecureText;

  final Widget prefixIcon;

  final Widget prefixWidget;

  final bool filledEnabled;
  final FocusNode focusNode;
  final TextAlign textAlign;
  final bool autoFocus;
  final bool hasFocus;
  final BoxShadow boxShadow;

  Widget suffixIcon;

  final BorderSide border;

  final bool enableBorder;

  MyCustomInput({
    this.labelText,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
    this.onChanged,
    this.enabled = true,
    this.textInputAction,
    this.errorText,
    this.onSaved,
    this.textEditingController,
    this.expands = false,
    this.placeholder,
    this.initialValue,
    this.inputMaxLines = 1,
    this.containerMargin,
    this.boxShadow = const BoxShadow(
      color: Color(0x2625364F),
      offset: Offset(0.0, 5.0),
      blurRadius: 10.0,
    ),
    this.inputType,
    this.validator,
    this.prefixIcon,
    this.obsecureText = false,
    this.labelColor = const Color(0xFF02BFC5),
    Key key,
    this.prefixWidget,
    this.filledEnabled = false,
    this.hasFocus = false,
    this.focusNode,
    this.suffixIcon,
    this.border,
    this.enableBorder = true,
    this.autoFocus = false,
    this.onFieldSubmitted,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
      ),
      child: TextFormField(
        expands: expands,
        textInputAction: textInputAction,
        style: TextStyle(
          fontSize: 16.0,
          height: 1.3,
          fontFamily: obsecureText ? 'roboto' : 'Segoe',
        ),
        maxLines: inputMaxLines ?? 1,
        validator: validator,
        textAlign: textAlign,
        keyboardType: inputType,
        onFieldSubmitted: onFieldSubmitted,
        autofocus: autoFocus,
        initialValue: initialValue,
        focusNode: focusNode,
        obscureText: obsecureText,
        onChanged: onChanged,
        onSaved: onSaved,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: placeholder,
          alignLabelWithHint: true,
          prefix: prefixWidget,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
//            hintStyle: TextStyle(
//              fontSize: 13.0,
//              fontWeight: FontWeight.w400,
//              color: Color(0xFFDCE2E2),
//            ),
//              contentPadding: contentPadding,
          errorText: errorText,
//          focusedBorder: OutlineInputBorder(
//              borderSide:
//                  BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
//              borderRadius: BorderRadius.circular(28.0)),
          enabledBorder: enableBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Color(0x2625364F),
                      style: BorderStyle.solid,
                      width: 1.0))
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
          labelText: labelText,
          focusColor: Theme.of(context).primaryColor,
          fillColor: Colors.white,
          filled: filledEnabled,
          border: enableBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Color(0x2625364F),
                  ),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
          errorStyle: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: TextStyle(
            fontSize: 16.0,
            height: 1.3,
            fontFamily: 'Segoe',
            color: const Color(0x8025364F),
          ),
        ),
      ),
    );
  }
}

class MyCustomComboBox extends StatefulWidget {
  final ValueChanged onChangedEvent;
  final int value;
  final labelText;
  final BuildContext context;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final List<DropdownMenuItem> items;
  final Widget suffixIcon;
  final Widget prefixIcon;

  MyCustomComboBox({
    this.value,
    this.onSaved,
    this.validator,
    this.labelText,
    this.items = const [
      DropdownMenuItem(
        value: 0,
        child: Text(
          'القسم...',
          style: TextStyle(
              fontSize: 16.0,
              color: const Color(0x8025364F),
              fontWeight: FontWeight.normal),
        ),
      ),
    ],
    this.onChangedEvent,
    this.suffixIcon,
    this.prefixIcon,
    this.context,
  });
  @override
  _MyCustomComboBoxState createState() => _MyCustomComboBoxState();
}

class _MyCustomComboBoxState extends State<MyCustomComboBox> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.dark),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.prefixIcon == null ? 15.0 : 0.0),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          filled: false,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: const Color(0x2625364F),
                  style: BorderStyle.solid,
                  width: 1.0)),
          labelText: widget.labelText,
          focusColor: Theme.of(context).primaryColor,
          hasFloatingPlaceholder: false,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 1.0,
                color: const Color(0x2625364F),
              )),
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: const Color(0xFF25364F),
          ),
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
        onChanged: widget.onChangedEvent,
        items: widget.items,
        value: widget.value,
      ),
    );
  }
}

class MyCustomFormButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedEvent;
  final Color textColor;
  final double height;
  final double radius;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  final BorderSide borderSide;
  MyCustomFormButton({
    Key key,
    @required this.onPressedEvent,
    this.buttonText,
    this.fontSize = 16.0,
    this.height = 46.0,
    this.padding = const EdgeInsets.all(8.0),
    this.radius = 23.0,
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF286EAD),
    this.borderSide = BorderSide.none,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
//      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: MaterialButton(
          padding: padding,
          onPressed: onPressedEvent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius), side: borderSide),
          elevation: 0,
          color: backgroundColor,
          child: AnimatedSwitcher(
            switchOutCurve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                FadeTransition(
              opacity: animation,
              child: child,
            ),
            switchInCurve: Curves.easeOut,
            child: Text(
              buttonText,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: fontSize,
//                          fontWeight: FontWeight.normal,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
