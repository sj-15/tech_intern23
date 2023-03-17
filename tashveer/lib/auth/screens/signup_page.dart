import 'package:flutter/material.dart';
import 'package:tashveer/common/widgets/text_input_field.dart';
import 'package:tashveer/screens/homepage_screen.dart';

import '../../common/widgets/snackbar.dart';
import '../method/auth_methods.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
      username: _namecontroller.text,
    );
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomepageScreen()),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextInputField(
                hintText: 'Your Name',
                textInputType: TextInputType.emailAddress,
                icon: Icons.person,
                isPassword: false,
                controller: _namecontroller),
          ),
          SizedBox(
            height: 60,
            child: TextInputField(
                hintText: 'Your email',
                textInputType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
                isPassword: false,
                controller: _emailcontroller),
          ),
          SizedBox(
            height: 60,
            child: TextInputField(
                hintText: 'Password',
                textInputType: TextInputType.text,
                icon: Icons.lock_outline,
                isPassword: true,
                controller: _passwordcontroller),
          ),
          InkWell(
            onTap: signUpUser,
            child: Container(
              width: size.width * 0.8,
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFB8BFC0).withOpacity(0.8),
              ),
              child: Center(
                child: !isLoading
                    ? const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.black,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
