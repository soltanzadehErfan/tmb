import 'package:flutter/material.dart';

/// [OfflineComponent]: Use this as a offline handling widget
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
              size: 100,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            const TextButton(
              onPressed: null,
              child: Text(
                'You are offline :(',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
