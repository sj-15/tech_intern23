import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rashoipedia/categories/brakefast.dart';
import 'package:rashoipedia/models/user_model.dart' as model;
import 'package:rashoipedia/oath/services/auth_methods.dart';
import 'package:rashoipedia/widgets/custom_text.dart';
import 'package:rashoipedia/widgets/text_input_field.dart';

import '../categories/deserts.dart';
import '../categories/dinner.dart';
import '../categories/lunch.dart';
import '../categories/new.dart';
import '../categories/snacks.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this, initialIndex: 0);
  }

  Future<DocumentSnapshot> getData() async {
    String uid = auth.currentUser!.uid;
    return await firestore.collection('users').doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: DefaultTabController(
            length: 6,
            initialIndex: 0,
            child: Column(
              children: [
                FutureBuilder<model.User>(
                  future: AuthMethods().getUserDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      model.User userData = snapshot.data!;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            shadows: const [
                              Shadow(
                                blurRadius: 40,
                                color: Colors.blue,
                              )
                            ],
                            text: 'hey, ${userData.username} 👋🏻',
                            fontSize: 30,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(userData.photoUrl),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextInputField(
                    icon: Icons.search,
                    hintText: "Find your recipe",
                    textInputType: TextInputType.text,
                    isPassword: false,
                    controller: searchController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TabBar(
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: 'New',
                    ),
                    Tab(
                      text: 'Brakefast',
                    ),
                    Tab(
                      text: 'Lunch',
                    ),
                    Tab(
                      text: 'Dinner',
                    ),
                    Tab(
                      text: 'Deserts',
                    ),
                    Tab(
                      text: 'Snacks',
                    ),
                  ],
                  indicator: BoxDecoration(
                    border: Border.all(
                        width: 2, style: BorderStyle.solid, color: Colors.blue),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  indicatorColor: Colors.transparent,
                  splashBorderRadius: BorderRadius.circular(30),
                  onTap: (index) {
                    setState(
                      () {
                        tabController.index = index;
                      },
                    );
                  },
                ),
                Flexible(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      NewScreen(),
                      BrakeFastScreen(),
                      LunchScreen(),
                      DinnerScreen(),
                      DesertsScreen(),
                      SnackScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
