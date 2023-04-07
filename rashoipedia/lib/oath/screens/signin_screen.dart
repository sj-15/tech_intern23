import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:rashoipedia/screens/homepage_screen.dart';
import 'package:rashoipedia/widgets/custom_button.dart';
import 'package:rashoipedia/widgets/text_input_field.dart';

import '../../components/colors/color.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_text.dart';
import '../services/auth_methods.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() async {
    String res = await AuthMethods().signInUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: background,
      content: SizedBox(
        height: size.height * 0.5,
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
              delay: const Duration(milliseconds: 500),
              child: Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                shadowColor: Colors.white.withOpacity(0.5),
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextInputField(
                        icon: Icons.mail,
                        hintText: 'Enter your email',
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        controller: _emailController,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 1,
                      ),
                      TextInputField(
                        icon: Icons.lock,
                        hintText: 'Enter your password',
                        textInputType: TextInputType.text,
                        isPassword: true,
                        controller: _passwordController,
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
              onPressed: signInUser,
            ),
          ],
        ),
      ),
    );
  }
}
