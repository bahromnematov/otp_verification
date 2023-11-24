import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  TextEditingController pinController = TextEditingController();
  String? otp;


  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: const TextStyle(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: Colors.amberAccent),
        borderRadius: BorderRadius.circular(5));

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
        border: Border.all(color: Colors.amberAccent),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage("assets/otp_img.png"),
                    ),
                  ),
                  const SizedBox(height: 67),
                  Text("Enter the code sent to the email",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                        fontFamily: 'Nexa Bold',
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 5),
                  Text("bahromnematov999@gmail.com",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontFamily: 'Nexa Light',
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(height: 20),
                  Center(
                      child: Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        length: 6,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) async {
                          otp = pin;
                        },
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: 296,
                      height: 46,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: Colors.amberAccent),
                          child: const Text("Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Nexa Bold',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.01,
                              )))),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Did not recieve the code? \n ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Nexa Light',
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Resend',
                          style: const TextStyle(
                            color: Colors.amberAccent,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
