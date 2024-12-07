import 'dart:io';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:untitled5/config/theme/widget_manager.dart';

import 'package:untitled5/presentation/widgets/add_file.dart';

import '../../config/theme/sizes_manager.dart';

class FilesListWidget extends StatefulWidget {
  final Key fileKey;
  final List<String> media;

  const FilesListWidget({
    super.key,
    required this.media,
    required this.fileKey,
  });

  @override
  _FilesListWidgetState createState() => _FilesListWidgetState();
}

class _FilesListWidgetState extends State<FilesListWidget> {
  late List<String> gallery;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    gallery = List.from(widget.media); // Initializing gallery with the provided media
  }

  void _removeFromGallery(String item) {
    setState(() {
      gallery.remove(item); // Remove file from gallery
    });
  }

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value; // Control the loading state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
         // color: Theme.of(context).cardColor,
        ),
      ),
      child: Row(
        children: [
          // Files List
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...gallery.map(
                      (currentMedia) => badges.Badge(
                    showBadge: true,
                    badgeContent: FittedBox(
                      child: GestureDetector(
                        onTap: () => _removeFromGallery(currentMedia),
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        ).paddingAll(Sizes.size2),
                      ),
                    ),
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                       // color: Colors.cyanAccent,
                      ),
                      child: Center(
                        child: Text(
                          currentMedia.split('/').last,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,

                          ),
                        ),
                      ),
                    ),
                  ),
                ).toList(),
                SizedBox(width: 10), // Separator
              ],
            ),
          ),

          // Add File Button and Loading Indicator
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddFileWidget(
                isLoading: _setLoading,
                onGet: (List<File> files) {
                  setState(() {
                    gallery.addAll(files.map((file) => file.path));
                  });
                },
              ),
              if (_isLoading)
                Container(
                  width: 100,
                  margin: EdgeInsetsDirectional.only(start: Sizes.size10),
                  decoration: BoxDecoration(
                    //color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
