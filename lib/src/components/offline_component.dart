import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/icons.dart';

/// [OfflineComponent]: Use this as a offline handling widget
class OfflineComponent extends StatelessWidget {
  const OfflineComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  tambordLogo,
                ),
                const SizedBox(height: 64),
                const SpinKitWaveSpinner(
                  color: Colors.white,
                  trackColor: Colors.blue,
                  size: 100.0,
                  child: Icon(Icons.network_check_rounded),
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
        )
      ],
    );
  }
}
