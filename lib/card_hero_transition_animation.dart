library card_hero_transition_animation;

export 'package:card_hero_transition_animation/card_hero_animation/enum/card_hero_animation_open_type.dart';

import 'package:card_hero_transition_animation/card_hero_animation/enum/card_hero_animation_open_type.dart';
import 'package:card_hero_transition_animation/card_hero_animation/widgets/card_hero_animation_small.dart';
import 'package:flutter/material.dart';

/// A widget that provides a hero transition animation between two card-like widgets.
///
/// The widget takes in two child widgets, [childSmall] and [childBig], and a [heroTag]
/// which is used to identify the widget during the transition. The [bigCardConstraints]
/// can be used to set the size of the larger card. The [openType] parameter
/// determines the type of interaction that triggers the transition.
///
/// The [duration] parameter can be used to set the duration of the animation.
class CardHeroTransitionAnimation extends StatelessWidget {
  /// The smaller child widget.
  final Widget childSmall;

  /// The larger child widget.
  final Widget childBig;

  /// The tag used to identify the widget during the transition.
  final String heroTag;

  /// The constraints for the larger card.
  final BoxConstraints? bigCardConstraints;

  /// The type of interaction that triggers the transition.
  final CardHeroAnimationOpenType openType;

  /// The duration of the animation, defaults to 300 milliseconds.
  final Duration? duration;

  /// Constructs a new [CardHeroTransitionAnimation] instance.
  ///
  /// Required parameters:
  /// - [childSmall]: The smaller child widget.
  /// - [childBig]: The larger child widget.
  /// - [heroTag]: The tag used to identify the widget during the transition.
  ///
  /// Optional parameters:
  /// - [bigCardConstraints]: The constraints for the larger card.
  /// - [duration]: The duration of the animation.
  /// - [openType]: The type of interaction that triggers the transition.
  const CardHeroTransitionAnimation(
      {required this.childSmall,
      required this.childBig,
      required this.heroTag,
      this.bigCardConstraints,
      this.duration,
      this.openType = CardHeroAnimationOpenType.longPress,
      super.key});

  @override
  Widget build(BuildContext context) => CardHeroAnimatedSmall(
        childSmall: childSmall,
        childBig: childBig,
        heroTag: heroTag,
        duration: duration ?? const Duration(milliseconds: 300),
        bigCardConstraints: bigCardConstraints,
        openType: openType,
      );
}
