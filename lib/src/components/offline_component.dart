import 'package:flutter/material.dart';

/// [OfflineComponent]: this component gives a offline widget for you
class OfflineComponent extends StatelessWidget {
  const OfflineComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.network_check_rounded,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: null,
              child: Text(
                'YOU ARE OFFLINE :(',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
