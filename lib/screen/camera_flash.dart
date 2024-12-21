import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraFlash extends StatefulWidget {
  const CameraFlash({super.key});

  @override
  State<CameraFlash> createState() => _CameraFlashState();
}

class _CameraFlashState extends State<CameraFlash> {
  late CameraController _controller;
  List<CameraDescription> cameras = [];
  int _selectedCameraIdx = 0;
  bool _cameraInitialized = false;

  @override
  void initState() {
    super.initState();
    cam();
  }

  void cam() async {
    cameras = await availableCameras();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      cameras[_selectedCameraIdx],
      ResolutionPreset.medium,
    );
    await _controller.initialize();
    await _controller.setZoomLevel(1.0);
    await _controller.setFlashMode(FlashMode.torch); // Turn on the flash
    if (!mounted) return;
    setState(() {
      _cameraInitialized = true;
    });
  }

  void _toggleCamera() async {
    if (_selectedCameraIdx == 0) {
      _selectedCameraIdx = 1; // Switch to front camera
    } else {
      _selectedCameraIdx = 0; // Switch to rear camera
    }
    await _controller.dispose();
    setState(() {
      _cameraInitialized = false;
    });
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    if (!_cameraInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera with Flash and Toggle'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1 / _controller.value.aspectRatio,
            child: Stack(
              children: [
                CameraPreview(_controller),
                Positioned(
                  left: size.width * .30,
                  right: size.width * .30,
                  top: size.height * .18,
                  child: Container(
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2)),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _controller
                  .setFlashMode(FlashMode.torch); // Set flash mode to torch
            },
            child: Text('Turn Flash On'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _controller
                  .setFlashMode(FlashMode.off); // Turn off the flash
            },
            child: Text('Turn Flash Off'),
          ),
        ],
      ),
    );
  }
}
