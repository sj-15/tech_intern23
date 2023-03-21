// import 'dart:io';
// import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../screens/fullscreenphoto.dart';
// import '../services/gdrive.dart';

class BuildPhotosScreen extends StatefulWidget {
  const BuildPhotosScreen({Key? key}) : super(key: key);

  @override
  State<BuildPhotosScreen> createState() => _BuildPhotosScreenState();
}

class _BuildPhotosScreenState extends State<BuildPhotosScreen> {
  // final drive = GoogleDrive();
  final picker = ImagePicker();
  bool isFavourite = false;
  DateTime? lastDate;

  Map<DateTime, List<Uint8List>> photoList = {};

  void onToggleFavourite() {
    if (mounted) {
      setState(() {
        isFavourite = !isFavourite;
      });
    }
  }

  void onClose() {
    Navigator.pop(context);
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
              // TODO: Implement photo deletion logic here
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  pickImage(ImageSource source) async {
    XFile? file = await picker.pickImage(source: source);
    if (file != null) {
      Uint8List bytes = await file.readAsBytes();
      // await drive.upload(file as File);
      return bytes;
    }
    // print('No Image Selected');
  }

  void _addPhoto(DateTime date) async {
    Uint8List pickedFile = await pickImage(ImageSource.gallery);
    setState(() {
      final pickedPhoto = pickedFile;
      if (photoList[date] == null) {
        photoList[date] = [pickedPhoto];
      } else {
        photoList[date]!.add(pickedPhoto);
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    // sort the keys in descending order
    List<DateTime> sortedDates = photoList.keys.toList();
    sortedDates.sort((a, b) => b.compareTo(a));

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addPhoto(DateTime.now()),
        backgroundColor: Colors.white,
        elevation: 12,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: photoList.keys.length,
          itemBuilder: (context, index) {
            DateTime date = photoList.keys.elementAt(index);
            List<Uint8List> photos = photoList[date]!;
            DateFormat formatter = DateFormat('dd MMM yy');
            String dateString = DateFormat('yyyy-MM-dd')
                .format(date); // converting to yyyy-MM-dd format for comparison
            String formattedDate =
                (dateString == DateFormat('yyyy-MM-dd').format(DateTime.now()))
                    ? 'Today'
                    : formatter.format(date);

            // Display date label only if it's a new date
            Widget dateLabel = (lastDate == null ||
                    lastDate!.difference(date).inDays != 0)
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      formattedDate,
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  )
                : const SizedBox.shrink();

            // Update lastDate to current date
            lastDate = date;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                dateLabel,
                const SizedBox(
                  height: 5,
                ),
                StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    Uint8List photo = photos[index];
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
                            image: MemoryImage(photo),
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
