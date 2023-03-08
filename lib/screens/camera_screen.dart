import 'image_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widgets/camera_bottom_bar.dart';
/// returns the preview of first avaialbe camera with bottom bar attached to itself
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.camera});
  final CameraDescription camera;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
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
                    if (context.mounted) {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (c, a, s) =>
                            ImagePreviewScreen(image: result),
                      ));
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator(color: Colors.black,));
        }
      },
    );
  }
}
