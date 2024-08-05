import 'package:card_hero_transition_animation/card_hero_animation/animation/custom_rec_teen.dart';
import 'package:flutter/material.dart';

class CardHeroAnimationBase extends StatelessWidget {
  final Widget child;
  final String heroTag;
  final BoxConstraints? boxConstraints;

  /// [duration] defaults to 300ms
  final Duration duration;
  const CardHeroAnimationBase({
    required this.child,
    required this.heroTag,
    this.boxConstraints,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Hero(
        tag: heroTag,
        createRectTween: (begin, end) =>
            CustomRectTween(begin: begin, end: end),
        child: AnimatedContainer(
          duration: duration,
          constraints: boxConstraints,
          child: child,
        ),
      );
}
