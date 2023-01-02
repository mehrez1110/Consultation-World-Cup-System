import 'dart:math' as math;
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/signin-button.dart';
import '../../controllers/auth-controller.dart';
import '../../controllers/vip-ticket-controller.dart';
import '../constants.dart';
import 'creditcard-text-input.dart';

class NewCreditCardView extends StatefulWidget {
  final ticketId;
  final matchId;
  final price;
  NewCreditCardView({Key? key, this.ticketId, this.matchId, this.price})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewCreditCardView> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();
  TextEditingController cardHolderNameTextCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  bool isPressedCardNum = false;
  bool isPressedExpiryDate = false;
  bool isPressedCardName = false;
  bool isPressedCVV = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MomentumBuilder(builder: (context, snapshot) {
      return Material(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            // height: (720 / 844) * _height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF56042C),
                Color.fromARGB(255, 80, 0, 39),
              ],
            )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: (10 / 844) * _height,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: secondary,
                          size: (35 / 844) * _height,
                        )),
                  ),
                  CreditCard(
                    width: _width * 0.3,
                    height: _height * 0.25,
                    cardNumber: cardNumber,
                    cardExpiry: expiryDate,
                    cardHolderName: cardHolderName,
                    cvv: cvv,
                    cardType: (cardNumber.startsWith('5'))
                        ? CardType.masterCard
                        : CardType.visa,
                    showBackSide: showBack,
                    frontBackground: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular((10 / 844) * _height),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF56042C),
                              Color.fromARGB(255, 80, 0, 39),
                            ],
                          )),
                    ),

                    backBackground: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular((10 / 844) * _height),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF56042C),
                              Color.fromARGB(255, 80, 0, 39),
                            ],
                          )),
                    ),
                    showShadow: true,
                    // mask: getCardTypeMask(cardType: CardType.americanExpress),
                  ),
                  SizedBox(
                    height: (10 / 844) * _height,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CreditcardTextInput(
                          validtor: ((value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            }
                            if (value.length < 16) {
                              return "Invalid card number";
                            }
                            return null;
                          }),
                          textInputCtrl: cardNumberCtrl,
                          setTextInputData: (value) {
                            final newCardNumber = value.trim();
                            var newStr = '';
                            final step = 4;

                            for (var i = 0;
                                i < newCardNumber.length;
                                i += step) {
                              newStr += newCardNumber.substring(
                                  i, math.min(i + step, newCardNumber.length));
                              if (i + step < newCardNumber.length)
                                newStr += ' ';
                            }

                            setState(() {
                              cardNumber = newStr;
                            });
                          },
                          textInputLabel: 'Card Number',
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                        ),
                        CreditcardTextInput(
                          validtor: ((value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            }
                            if (value.length < 5) {
                              return "Invalid expiry date";
                            }
                            return null;
                          }),
                          hintText: "MM/YY",
                          textInputCtrl: expiryFieldCtrl,
                          setTextInputData: (value) {
                            var newDateValue = value.trim();
                            final isPressingBackspace =
                                expiryDate.length > newDateValue.length;
                            final containsSlash = newDateValue.contains('/');

                            if (newDateValue.length >= 2 &&
                                !containsSlash &&
                                !isPressingBackspace) {
                              newDateValue = newDateValue.substring(0, 2) +
                                  '/' +
                                  newDateValue.substring(2);
                            }
                            setState(() {
                              expiryFieldCtrl.text = newDateValue;
                              expiryFieldCtrl.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: newDateValue.length));
                              expiryDate = newDateValue;
                            });
                          },
                          textInputLabel: 'Expiry Date',
                          keyboardType: TextInputType.datetime,
                          maxLength: 5,
                        ),
                        CreditcardTextInput(
                          validtor: ((value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            }
                            return null;
                          }),
                          textInputCtrl: cardHolderNameTextCtrl,
                          setTextInputData: (value) {
                            setState(() {
                              cardHolderName = value;
                            });
                          },
                          textInputLabel: 'Card Holder Name',
                        ),
                        CreditcardTextInput(
                          validtor: ((value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            }
                            if (value.length < 3) {
                              return "Invalid CVV";
                            }
                            return null;
                          }),
                          textInputCtrl: cvvCtrl,
                          setTextInputData: (value) {
                            setState(() {
                              cvv = value;
                            });
                          },
                          textInputLabel: 'CVV',
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: (10 / 844) * _height,
                              bottom: (10 / 844) * _height),
                          child: SignInButton(
                            survey: false,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                List<String> expiryDate =
                                    expiryFieldCtrl.text.split('/');
                                List<String> fullName =
                                    cardHolderNameTextCtrl.text.split(' ');
                                Momentum.controller<VipTicketController>(
                                        context)
                                    .bookVipTicket(
                                        widget.ticketId,
                                        widget.matchId,
                                        Momentum.controller<AuthController>(
                                                context)
                                            .model
                                            .id,
                                        context);
                                Navigator.pop(
                                  context,
                                );
                              }
                            },
                            signIn: false,
                            getStarted: true,
                            title: 'Pay ' + widget.price.toString() + " L.E",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
