import 'package:flutter/material.dart';
import 'package:rashoipedia/categories/brakefast.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: DefaultTabController(
            length: 5,
            initialIndex: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'hello,\nSourav 👋🏻',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/meal1.jpg'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TabBar(
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: const [
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
                    children: [
                      BrakeFastScreen(
                        index: tabController.index,
                      ),
                      BrakeFastScreen(
                        index: tabController.index,
                      ),
                      BrakeFastScreen(
                        index: tabController.index,
                      ),
                      BrakeFastScreen(
                        index: tabController.index,
                      ),
                      BrakeFastScreen(
                        index: tabController.index,
                      ),
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
