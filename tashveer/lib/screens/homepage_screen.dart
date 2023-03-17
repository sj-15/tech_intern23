import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:tashveer/screens/fullscreenphoto.dart';

class HomepageScreen extends StatefulWidget {
  final List<DateTime> sortedDates;

  HomepageScreen({Key? key})
      : sortedDates = [
          DateTime(2023, 03, 17),
          DateTime(2023, 03, 15),
          DateTime(2023, 03, 07),
          DateTime(2022, 11, 08),
        ].toList()
          ..sort((a, b) => b.compareTo(a)),
        super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  bool isFavourite = false;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void onClose() {
    Navigator.pop(context);
  }

  void onToggleFavourite() {
    if (mounted) {
      setState(() {
        isFavourite = !isFavourite;
      });
    }
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete photo'),
        content: const Text('Are you sure you want to delete this photo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final photoList = {
      DateTime(2023, 03, 17): [
        'assets/photo10.jpg',
        'assets/photo11.jpg',
      ],
      DateTime(2023, 03, 15): [
        'assets/photo1.JPG',
        'assets/photo2.JPG',
        'assets/photo3.JPG',
        'assets/photo4.jpg',
        'assets/photo5.jpg',
      ],
      DateTime(2023, 03, 7): [
        'assets/photo6.jpg',
        'assets/photo7.jpg',
      ],
      DateTime(2022, 11, 8): [
        'assets/photo8.jpg',
        'assets/photo9.jpg',
      ],
    };
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'tashveer',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: widget.sortedDates.length,
          itemBuilder: (context, index) {
            DateTime date = widget.sortedDates[index];
            List<String> photos = photoList[date]!;
            DateFormat formatter = DateFormat('dd MMM yy');
            String dateString = DateFormat('yyyy-MM-dd')
                .format(date); // converting to yyyy-MM-dd format for comparison
            String formattedDate =
                (dateString == DateFormat('yyyy-MM-dd').format(DateTime.now()))
                    ? 'Today'
                    : formatter.format(date);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    String photo = photos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenPhoto(
                              isFavourite: isFavourite,
                              onClose: onClose,
                              onDelete: onDelete,
                              onEdit: () {},
                              onToggleFavourite: onToggleFavourite,
                              photoUrl: photo,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(photo),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                      photos.length % 2 == 0
                          ? 1
                          : (index == photos.length ~/ 2 ? 2 : 1),
                      1),
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
