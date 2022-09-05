import 'dart:io';

import 'package:chat_app/screens/new_screen/country_page.dart';
import 'package:chat_app/screens/new_screen/opt_page.dart';
import 'package:flutter/material.dart';
import '../../model/conuntry_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String countryName = 'India';
  String countryCode = '+91';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Enter your phone number',
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              wordSpacing: 1),
        ),
        centerTitle: true,
        elevation: 0,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          const Text(
            'Whatsapp will send an sms message to verify your number',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 5),
          Text(
            'What\'s my number?',
            style: TextStyle(fontSize: 12, color: Colors.cyan[800]),
          ),
          countryCard(),
          const SizedBox(height: 5),
          number(),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              if (controller.text.length < 10) {
                showMyDialogue1();
              } else {
                showMyDialogue();
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.teal[400],
              height: 40,
              width: 70,
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => CountryPage(setCountryData: setCountryData),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  countryName,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            )
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(children: [
        Container(
          width: 70,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.teal, width: 1.8),
            ),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "+",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Text(
              countryCode.substring(1).trim(),
              style: const TextStyle(fontSize: 15),
            ),
          ]),
        ),
        const SizedBox(width: 30),
        Container(
          width: MediaQuery.of(context).size.width / 1.5 - 100,
          height: 38,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.teal, width: 1.8),
            ),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: 'phone number'),
          ),
        ),
      ]),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMyDialogue() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'We will be verifying your phone number',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(countryCode + " " + controller.text,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const Text(
                      'Is this ok, or would you like to edit the number ?',
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Edit')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpPage(
                                  countryCode: countryCode,
                                  number: controller.text,
                                )));
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  Future<void> showMyDialogue1() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('There is no number, you entered'),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Edit')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }
}
