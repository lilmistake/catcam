import 'package:flutter/material.dart';

class CameraBottomBar extends StatelessWidget {
  const CameraBottomBar({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 5)),
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: onPressed,
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 50,
              ),
            ),
          ),
        )
      ],
    );
  }
}