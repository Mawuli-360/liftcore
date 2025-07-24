import 'package:flutter/foundation.dart';
import 'package:liftcore/src/core/utils/app_logger.dart';

void registerErrorHandler() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    AppLogger.error(details);
  };

  PlatformDispatcher.instance.onError = (error, stacktrace) {
    AppLogger.error(error);
    return true;
  };

  // ErrorWidget.builder = (FlutterErrorDetails details) {

  //   String mainError = details.exception.toString();

  //   String stackTrace = details.stack.toString();
  //   List<String> stackLines = stackTrace.split('\n');
  //   String relevantStack = stackLines.take(5).join('\n');

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         "Error Occurred",
  //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //       ),
  //       backgroundColor: Colors.red,
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Card(
  //             color: Colors.red[50],
  //             child: Padding(
  //               padding: EdgeInsets.all(12.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Root Cause:",
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                       color: Colors.red[800],
  //                     ),
  //                   ),
  //                   SizedBox(height: 8),
  //                   Text(
  //                     mainError.split('\n').first,
  //                     style: TextStyle(fontSize: 14),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //           ExpansionTile(
  //             title: Text(
  //               "Error Details",
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Text(
  //                   mainError,
  //                   style: TextStyle(fontFamily: 'monospace'),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           ExpansionTile(
  //             title: Text(
  //               "Stack Trace (Top 5 lines)",
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Text(
  //                   relevantStack,
  //                   style: TextStyle(
  //                     fontFamily: 'monospace',
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // };

}
