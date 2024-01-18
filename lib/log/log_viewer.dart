

// class LogViewer extends StatelessWidget {
//   final List<String> logs;
//
//   const LogViewer({required this.logs, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print('-----------------------HereLog--------------------');
//     return ListView.builder(
//       itemCount: logs.length,
//       itemBuilder: (context, index) {
//         return Text(
//           logs[index],
//           style: const TextStyle(color: Colors.white),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogViewer extends StatelessWidget {
  final List<String> logs;

  const LogViewer({required this.logs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('-----------------------HereLog--------------------');
    return ListView.builder(
      itemCount: logs.length,
      itemBuilder: (context, index) {
        // Determine text color based on the index
        final textColor = index % 2 == 0 ? Colors.white : Colors.yellow;

        return Text(
          logs[index],
          style: TextStyle(color: textColor),
        );
      },
    );
  }
}
