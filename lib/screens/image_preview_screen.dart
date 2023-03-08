import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

/// shows the sent image, pops context if rejected or goes forward if accepted (todo)
class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({super.key, required this.image});
  final XFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Image.file(
                  File(image.path),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.cancel_sharp,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
