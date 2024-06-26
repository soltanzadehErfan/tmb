import 'package:flutter/material.dart';

/// [EmptyContent]: This component gives an empty content widget for you
/// optional String? message: You can add your optional message by default it is 'There is no data here!'
class EmptyContent extends StatelessWidget {
  final String? message;

  const EmptyContent({
    super.key,
    this.message,
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
              color: Colors.grey[500],
            ),
            const SizedBox(height: 8),
            Text(
              message ?? 'There is no data here!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
