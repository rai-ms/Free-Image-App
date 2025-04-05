// import 'package:flutter/material.dart';
// import 'package:lyf_heal/core/internet/internet_builder/ui/no_internet_screen.dart';
// import 'package:lyf_heal/core/services/internet_service/internet_service.dart';
//
// class InternetBuilder extends StatelessWidget {
//   final Widget Function(BuildContext context, bool isConnected) builder;
//   final Widget? noInternetWidget;
//
//   const InternetBuilder({
//     super.key,
//     required this.builder,
//     this.noInternetWidget,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool?>(
//       valueListenable: InternetService.service.netListener,
//       builder: (context, isConnected, child) {
//         if (isConnected == null) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (isConnected == false) {
//           return noInternetWidget ?? const NoInternetScreen();
//         } else {
//           return builder(context, isConnected);
//         }
//       },
//     );
//   }
// }
