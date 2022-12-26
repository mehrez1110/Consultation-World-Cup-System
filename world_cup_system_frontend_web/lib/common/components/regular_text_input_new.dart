import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegularTextInputNew extends StatefulWidget {
  final label;
  final controller;
  final controller1;
  final hintText;
  final prefix;
  final keyboardType;
  final bool protectedText;
  final bool mandatory;
  final bool description;
  final inputFormatters;
  final bool email;
  final bool name;
  final bool subject;
  final bool message;
  final bool password;
  final bool phoneNumber;
  final bool confirmPassword;
  final String passwordText;
  final bool birthDate;
  final bool disable;
  final bool search;
  final bool promoCode;
  final String? Function(String?)? validator;
  String birthDateText;
  Color fillColor = Color(0x21214461);
  Color hintTextColor = Color(0x940A1F33);
  Color prefixIconColor = Color(0x94192B37);
  Color errorBorderColor = Color(0xFFFD7542);
  Color textColor;
  Color labelColor;
  final VoidCallback? onChanged;

  final showPassword;

  RegularTextInputNew({
    this.keyboardType,
    this.label = "Label",
    this.controller,
    this.hintText = "Enter data here",
    this.prefix,
    this.protectedText = false,
    this.mandatory = false,
    this.description = false,
    this.inputFormatters,
    this.email = false,
    this.password = false,
    this.showPassword,
    this.name = false,
    this.phoneNumber = false,
    this.confirmPassword = false,
    this.passwordText = " ",
    this.birthDate = false,
    this.birthDateText = "",
    this.controller1,
    required this.errorBorderColor,
    required this.fillColor,
    required this.hintTextColor,
    required this.prefixIconColor,
    required this.textColor,
    required this.labelColor,
    this.subject = false,
    this.message = false,
    this.disable = false,
    this.search = false,
    this.onChanged,
    this.promoCode = false,
    this.validator,
  });

  @override
  State<RegularTextInputNew> createState() => _RegularTextInputState();
}

class _RegularTextInputState extends State<RegularTextInputNew> {
  bool isPressed = false;
  @override
  var onchanged;
  void initState() {
    onchanged = widget.onChanged;
    super.initState();
  }

  void datePick() {
    setState(() {
      isPressed = true;
    });
    // showModalBottomSheet<void>(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return DatePicker();
    //   },
    // );
  }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ((isPressed || widget.disable) && !widget.search)
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: (2 / 844) * _height),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: (12 / 844) * _height,
                      color: widget.labelColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SfProRounded',
                    ),
                  ),
                )
              : SizedBox(height: (18 / 844) * _height),
          Container(
            child: TextFormField(
              onTap: () {
                if (widget.birthDate == false && widget.disable == false) {
                  setState(() {
                    isPressed = true;
                  });
                } else if (widget.disable == true) {
                } else {
                  datePick();
                }
              },
              readOnly: (widget.birthDate || widget.disable) ? true : false,
              onChanged: (widget.birthDate)
                  ? (value) {
                      var newDateValue = value.trim();
                      final isPressingBackspace =
                          widget.birthDateText.length >= newDateValue.length;
                      final containsSlash = newDateValue.contains('/');

                      if (newDateValue.length > 0 &&
                          !containsSlash &&
                          !isPressingBackspace) {
                        newDateValue = newDateValue.substring(0, 2) +
                            '/' +
                            newDateValue.substring(2, 4) +
                            '/' +
                            newDateValue.substring(4, 8);
                        widget.controller.text = newDateValue;
                        print(widget.controller.text);
                      }
                      setState(() {
                        widget.controller.text = newDateValue;
                        widget.controller.selection =
                            TextSelection.fromPosition(
                                TextPosition(offset: newDateValue.length));
                        widget.birthDateText = newDateValue;
                      });
                    }
                  : (value) {
                      onchanged.call();
                    },
              cursorColor: widget.textColor,
              cursorWidth: 1,
              textCapitalization: (widget.name)
                  ? TextCapitalization.sentences
                  : TextCapitalization.none,
              validator: (widget.email)
                  ? (value) {
                      if (value!.isEmpty) {
                        return 'Required!';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return "please enter email correctly";
                      }
                      return null;
                    }
                  : (widget.password)
                      ? (value) {
                          if (value!.isEmpty) {
                            return 'Required!';
                          }
                          if (value.length < 8) {
                            return 'Password must contain more than 7 characters';
                          }

                          return null;
                        }
                      : (widget.name)
                          ? (value) {
                              if (value!.isEmpty) {
                                return 'Required!';
                              }

                              return null;
                            }
                          : (widget.phoneNumber)
                              ? (value) {
                                  return null;
                                }
                              : (widget.confirmPassword)
                                  ? (value) {
                                      if (value != widget.controller1.text ||
                                          value!.isEmpty) {
                                        return "password is not matched";
                                      }
                                      return null;
                                    }
                                  : widget.validator,
              controller: widget.controller,
              keyboardType: (!widget.message)
                  ? widget.keyboardType
                  : TextInputType.multiline,
              obscureText: widget.protectedText,
              maxLines: (!widget.message)
                  ? widget.description
                      ? 5
                      : 1
                  : null,
              inputFormatters: widget.inputFormatters,
              style: TextStyle(
                fontSize: (14 / 844) * _height,
                color: widget.textColor,
                fontFamily: 'SfProRounded',
              ),
              decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxHeight: (40 / 844) * _height,
                      minHeight: (40 / 844) * _height),
                  filled: true,
                  fillColor: widget.fillColor,
                  prefixIcon: (widget.email)
                      ? Icon(
                          Icons.mail,
                          color: widget.prefixIconColor,
                        )
                      : (widget.password || widget.confirmPassword)
                          ? Icon(
                              Icons.lock_outline,
                              color: widget.prefixIconColor,
                            )
                          : (widget.phoneNumber)
                              ? Icon(
                                  Icons.phone,
                                  color: widget.prefixIconColor,
                                )
                              : (widget.name)
                                  ? Icon(
                                      Icons.person,
                                      color: widget.prefixIconColor,
                                    )
                                  : (widget.search)
                                      ? Icon(
                                          Icons.search,
                                          color: widget.prefixIconColor,
                                        )
                                      : (widget.promoCode)
                                          ? Icon(
                                              Icons
                                                  .confirmation_number_outlined,
                                              color: widget.prefixIconColor,
                                            )
                                          : null,
                  suffixIcon: (widget.password)
                      ? IconButton(
                          onPressed: widget.showPassword,
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: widget.prefixIconColor,
                          ),
                        )
                      : (widget.birthDate)
                          ? IconButton(
                              onPressed: datePick,
                              icon: Icon(
                                Icons.calendar_today,
                                color: widget.prefixIconColor,
                              ),
                            )
                          : null,
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    top: (5 / 844) * _height,
                    left: (10 / 390) * _width,
                  ),
                  prefix: widget.prefix ?? null,
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
                        color: widget.errorBorderColor,
                        width: (1.0 / 390) * _width),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide.none),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.errorBorderColor,
                        width: (1.0 / 390) * _width),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  errorStyle: TextStyle(
                      color: widget.errorBorderColor,
                      height: (0.1 / 844) * _height,
                      fontSize: (10 / 844) * _height,
                      decoration: TextDecoration.underline),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: widget.hintTextColor,
                    fontFamily: 'SfProRounded',
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
