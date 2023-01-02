import 'package:flutter/material.dart';

import '../constants.dart';

class CreditcardTextInput extends StatefulWidget {
  const CreditcardTextInput({
    Key? key,
    required this.textInputCtrl,
    required this.setTextInputData,
    required this.textInputLabel,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.validtor,
    this.hintText,
  }) : super(key: key);

  final TextEditingController textInputCtrl;
  final Function(String)? setTextInputData;
  final String textInputLabel;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validtor;
  final String? hintText;
  @override
  State<CreditcardTextInput> createState() => _CreditcardTextInputState();
}

class _CreditcardTextInputState extends State<CreditcardTextInput> {
  bool isTextInputPress = false;
  @override
  Widget build(BuildContext context) {
    final fillColor = Color(0x21FFFFFF);
    final hintTextColor = Color(0x94FFFFFF);
    final prefixIconColor = Color(0x94192B37);
    final errorBorderColor = Color(0xFFFD7542);
    final labelColor = secondary;

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
          bottom: (20 / 844) * _height,
          right: (10 / 390) * _width,
          left: (10 / 390) * _width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (isTextInputPress)
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: (2 / 844) * _height),
                  child: Text(
                    widget.textInputLabel,
                    style: TextStyle(
                      fontSize: (12 / 844) * _height,
                      color: labelColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SfProRounded',
                    ),
                  ),
                )
              : SizedBox(height: (18 / 844) * _height),
          Container(
            child: TextFormField(
              validator: widget.validtor,
              keyboardType: widget.keyboardType,
              onTap: () {
                setState(() {
                  isTextInputPress = true;
                });
              },
              controller: widget.textInputCtrl,
              cursorColor: secondary,
              style: TextStyle(color: secondary),
              decoration: InputDecoration(
                constraints: BoxConstraints(
                    maxHeight: (40 / 844) * _height,
                    minHeight: (40 / 844) * _height),
                filled: true,
                fillColor: fillColor,
                prefixIcon: Icon(
                  Icons.card_membership,
                  color: prefixIconColor,
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(
                  top: (5 / 844) * _height,
                  left: (10 / 390) * _width,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorBorderColor, width: (1.0 / 390) * _width),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide.none),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorBorderColor, width: (1.0 / 390) * _width),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                errorStyle: TextStyle(
                    color: errorBorderColor,
                    height: (0.1 / 844) * _height,
                    fontSize: (10 / 844) * _height,
                    decoration: TextDecoration.underline),
                hintText: (widget.hintText != null)
                    ? widget.hintText
                    : widget.textInputLabel,
                hintStyle: TextStyle(
                  color: hintTextColor,
                  fontFamily: 'SfProRounded',
                ),
                counterText: "",
              ),
              onChanged: widget.setTextInputData,
              focusNode: widget.focusNode,
              maxLength: widget.maxLength,
            ),
          ),
        ],
      ),
    );
  }
}
