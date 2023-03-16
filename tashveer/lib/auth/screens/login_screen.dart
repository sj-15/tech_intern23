import 'package:flutter/material.dart';
import 'package:tashveer/auth/screens/signin_page.dart';
import 'package:tashveer/auth/screens/signup_page.dart';
import 'package:tashveer/common/widgets/circle_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignInSelected = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/tashveer.png',
                  // color: Colors.,
                  height: size.height * 0.15,
                  alignment: Alignment.topCenter,
                ),
                const Text('Add your tashveer'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Container(
                  width: size.width * 0.8,
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFB8BFC0).withOpacity(0.8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSignInSelected = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isSignInSelected ? Colors.white : null,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: isSignInSelected
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSignInSelected = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: !isSignInSelected ? Colors.white : null,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: !isSignInSelected
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                isSignInSelected ? const SignInPage() : const SignUpPage(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: size.width * 0.8,
                    height: 50,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFB8BFC0).withOpacity(0.8),
                    ),
                    child: Center(
                      child: Text(
                        isSignInSelected ? 'Sign In' : 'Sign Up',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleIcon(imagePath: 'assets/google.png'),
                    CircleIcon(imagePath: 'assets/fb.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
