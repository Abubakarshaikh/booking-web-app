import 'package:bravos_tix/features/sign_in/controller/sign_in_controller.dart';
import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "/signInScreen";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  SignInController? _controller;

  @override
  void initState() {
    _controller = Get.put(SignInController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: PRIMARY_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(48.0),
              ),
              child: Image.asset("assets/images/Logo.png"),
            ),
            Column(
              children: [
                Text(
                  S.of(context).welcome_back("Lisa"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: "Circular Std",
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(16.0)),
                  child: Text(
                    S.of(context).signIn_pinCode_message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 18,
                        fontFamily: "Circular Std",
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(72.0)),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    enableActiveFill: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "Circular Std",
                    ),
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      selectedColor: Colors.transparent,
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      selectedFillColor: INPUT_BACKGROUND.withOpacity(0.3),
                      activeFillColor: INPUT_BACKGROUND.withOpacity(0.3),
                      inactiveFillColor: INPUT_BACKGROUND.withOpacity(0.3),
                      fieldHeight: getProportionateScreenHeight(52.0),
                      fieldWidth: getProportionateScreenWidth(44.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      shape: PinCodeFieldShape.box,
                    ),
                    onChanged: (pin) {
                      if (pin.length == 4) {
                        _controller?.login();
                      }
                    },
                  ),
                ),
                Text(
                  S.of(context).signIn_pinCode_hint,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.5),
                      fontFamily: "Circular Std"),
                ),
              ],
            ),
            Container(
              height: getProportionateScreenHeight(100),
            )
          ],
        ),
      ),
    );
  }
}
