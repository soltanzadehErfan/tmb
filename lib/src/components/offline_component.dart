import 'package:ditredi/ditredi.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

import '../logic/connectivity_service.dart';
import '../logic/tambord_launcher.dart';
import '../utils/assets.dart';

/// [OfflineComponent]: Use this as an offline handling widget
class OfflineComponent extends StatefulWidget {
  const OfflineComponent({super.key});

  @override
  State<OfflineComponent> createState() => _OfflineComponentState();
}

class _OfflineComponentState extends State<OfflineComponent> {
  late DiTreDiController controller;
  Mesh3D? mesh;
  String _connectionStatus = 'unknown';

  @override
  void initState() {
    super.initState();
    controller = DiTreDiController(
      rotationX: -20,
      rotationY: 30,
      light: Vector3(-0.5, -0.5, 0.5),
    );
    _loadMesh();
    _checkConnectivity();
  }

  Future<void> _loadMesh() async {
    try {
      final List<Face3D> faces =
          await ObjParser().loadFromResources(dinosaurObj);
      setState(() {
        mesh = Mesh3D(faces);
      });
    } catch (e) {
      print("Error loading 3D object: $e");
    }
  }

  Future<void> _checkConnectivity() async {
    final status = await connectivityChecker();
    setState(() {
      _connectionStatus = status;
    });

    if (status == 'online') {
      _launchUrl();
    }
  }

  void _launchUrl() async {
    try {
      await launchTambord();
      _showSuccessSnackBar();
    } catch (e) {
      _showErrorSnackBar(e);
    }
  }

  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'خوش برگشتی :)',
          style: TextStyle(fontFamily: 'IranSans'),
        ),
      ),
    );
  }

  void _showErrorSnackBar(dynamic error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to launch URL: ${error.toString()}')),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: mesh == null
                    ? const CircularProgressIndicator()
                    : DiTreDiDraggable(
                        controller: controller,
                        child: DiTreDi(
                          figures: [
                            mesh!,
                          ],
                          controller: controller,
                        ),
                      ),
              ),
              ElevatedButton(
                onPressed: _checkConnectivity,
                child: const Text(
                  '! آفلاینی',
                  style: TextStyle(
                    fontFamily: 'IranSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
