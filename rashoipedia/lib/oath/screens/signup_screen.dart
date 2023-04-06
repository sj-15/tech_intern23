import 'dart:typed_data';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rashoipedia/components/colors/color.dart';
import 'package:rashoipedia/screens/homepage_screen.dart';
import 'package:rashoipedia/widgets/text_input_field.dart';

import '../../utils/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
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
            ], text: 'Make Dish', fontSize: 36),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/OIG.EUcbDDgzjK5veRlfLXdy?pcl=1b1a19&pid=ImgGn'),
                      ),
                Positioned(
                  bottom: -10,
                  left: 42,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo, color: Colors.blue),
                  ),
                ),
              ],
            ),
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
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextInputField(
                        icon: Icons.person,
                        hintText: 'Enter your name',
                        textInputType: TextInputType.text,
                        isPassword: false,
                        controller: _namecontroller,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 1,
                      ),
                      TextInputField(
                        icon: Icons.mail,
                        hintText: 'Enter you email',
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        controller: _emailcontroller,
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
                        controller: _passwordcontroller,
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
