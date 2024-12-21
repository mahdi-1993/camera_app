import 'package:camera_app/screen/camera_flash.dart';
import 'package:camera_app/screen/chart.dart';
import 'package:camera_app/screen/face_id.dart';
import 'package:camera_app/screen/header.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CameraFlash(),
                      ));
                },
                child: Text('Camera with flash')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Chart(),
                      ));
                },
                child: Text('chart')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BiometricAuthScreen(),
                      ));
                },
                child: Text('face id')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MegaMenu(),
                      ));
                },
                child: Text('mega')),
          ],
        ),
      ),
    );
  }
}
