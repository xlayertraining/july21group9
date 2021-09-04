import 'package:flutter/widgets.dart';
import 'package:untitled2/my_news/submit_news.dart';
class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget child;

  FadeRouteBuilder({required this.child, })
      : super(
    pageBuilder: (context, animation1, animation2) => child,
    transitionsBuilder: (context, animation1, animation2, child) {
      return FadeTransition(opacity: animation1, child: child);
    },
  );
}
