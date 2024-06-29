import 'package:flutter/material.dart';

/// [EmptyComponent]: This component provides a widget to display when there is no data available.
///
/// Optional parameters:
/// - [message]: A custom message to display. If not provided, it defaults to 'There is no data here!'.
class EmptyComponent extends StatelessWidget {
  final String? message;

  /// Creates an [EmptyComponent] with an optional [message].
  ///
  /// If [message] is not provided, it defaults to 'There is no data here!'.
  const EmptyComponent({
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
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              message ?? 'There is no data here!',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
