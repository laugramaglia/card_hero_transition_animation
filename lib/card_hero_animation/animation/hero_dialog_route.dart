import 'package:flutter/material.dart';

class HeroDialogRoute<T> extends PageRoute<T> {
  final Color color;
  final Duration duration;

  HeroDialogRoute({
    this.color = Colors.black54,
    this.duration = const Duration(milliseconds: 300),
    required WidgetBuilder builder,
    super.settings,
    super.fullscreenDialog,
  }) : _builder = builder;

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => duration;

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => color;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      _builder(context);

  @override
  String get barrierLabel => 'Hero dialog open';
}
