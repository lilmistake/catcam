import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widgets/camera_bottom_bar.dart';


class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.camera});
  final CameraDescription camera;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late Future<void> _futureController;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);
    _futureController = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _futureController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              CameraPreview(_cameraController),
              Expanded(
                child: CameraBottomBar(onPressed: () async {
                  try {
                    await _futureController;
                    XFile result = await _cameraController.takePicture();
                    print("PICTURE TAKEN");
                  } catch (e) {
                    print(e);
                  }
                }),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
