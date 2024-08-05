import 'package:card_hero_transition_animation/card_hero_animation/widgets/card_hero_animation_base.dart';
import 'package:flutter/material.dart';

class CardHeroAnimationBig extends StatelessWidget {
  final String heroTag;
  final Widget child;
  final BoxConstraints? boxConstraints;
  final Duration duration;

  const CardHeroAnimationBig({
    required this.child,
    required this.heroTag,
    this.boxConstraints,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardHeroAnimationBase(
                heroTag: heroTag,
                boxConstraints: boxConstraints,
                duration: duration,
                child: child,
              ),
            ),
          ),
        ),
      );
}
