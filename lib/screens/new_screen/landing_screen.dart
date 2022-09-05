import 'package:chat_app/screens/constents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'login.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(children: [
            SizedBox(height: 30),
            Text(
              'Welcome to whatsapp',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Image.asset(
              bg,
              color: Colors.greenAccent[700],
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                          text: 'Agree and continue to accept the',
                          style: TextStyle(color: Colors.grey[600])),
                      const TextSpan(
                          text: 'Whatsapp Terms of Service and Privacy Policy',
                          style: TextStyle(color: Colors.cyan)),
                    ]),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => const Login()),
                    (route) => false);
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: Card(
                  margin: const EdgeInsets.only(top: 0),
                  elevation: 8,
                  color: Colors.greenAccent[700],
                  child: const Center(
                    child: Text(
                      'Agree and continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 110,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
