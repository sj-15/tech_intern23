import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:rashoipedia/screens/homepage_screen.dart';
import 'package:rashoipedia/widgets/custom_button.dart';

import '../../widgets/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomText(shadows: [
            Shadow(
              blurRadius: 40,
              color: Colors.blue,
            )
          ], text: 'Welcome', fontSize: 36),
          DelayedDisplay(
            delay: const Duration(milliseconds: 2000),
            child: Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              shadowColor: Colors.white.withOpacity(0.5),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.email,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.lock,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomButton(
              text: 'Start Cooking',
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }),
        ],
      ),
    );
  }
}
