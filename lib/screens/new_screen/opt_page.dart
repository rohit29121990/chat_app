import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key, required this.number, required this.countryCode})
      : super(key: key);
  final String number;
  final String countryCode;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Verify ${widget.countryCode} ${widget.number}',
            style: TextStyle(color: Colors.teal[800], fontSize: 18.5),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ))
          ]),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              const TextSpan(
                  text: 'We have sent an sms with a code to ',
                  style: TextStyle(color: Colors.black, fontSize: 14.5)),
              TextSpan(
                  text: widget.countryCode + " " + widget.number,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                text: ' Wrong number',
                style: TextStyle(color: Colors.teal[800], fontSize: 14.5),
              )
            ]),
          ),
          SizedBox(height: 5),
          OTPTextField(
            length: 4,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 30,
            style: TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            onCompleted: (pin) {
              print("Completed: " + pin);
            },
          ),
          SizedBox(height: 25),
          Text(
            'Enter 6-digit code',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 30),
          bottomText(Icons.message, 'Resend SMS'),
          const SizedBox(height: 25),
          const Divider(thickness: 1.5),
          const SizedBox(height: 25),
          bottomText(Icons.call, 'Call me'),
        ]),
      ),
    );
  }

  Widget bottomText(IconData icon, String title) {
    return Row(children: [
      Icon(icon, color: Colors.teal, size: 24),
      const SizedBox(width: 25),
      Text(
        title,
        style: const TextStyle(fontSize: 14.5),
      ),
    ]);
  }
}
