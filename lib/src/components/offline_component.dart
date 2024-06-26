import 'package:ditredi/ditredi.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

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

  @override
  void initState() {
    super.initState();
    controller = DiTreDiController(
      rotationX: -20,
      rotationY: 30,
      light: Vector3(-0.5, -0.5, 0.5),
    );
    _loadMesh();
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
          const Text(
            'YOU ARE OFFLINE :(',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
