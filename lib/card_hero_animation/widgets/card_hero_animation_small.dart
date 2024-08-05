import 'package:card_hero_transition_animation/card_hero_animation/animation/hero_dialog_route.dart';
import 'package:card_hero_transition_animation/card_hero_animation/enum/card_hero_animation_open_type.dart';
import 'package:card_hero_transition_animation/card_hero_animation/widgets/card_hero_animation_base.dart';
import 'package:card_hero_transition_animation/card_hero_animation/widgets/card_hero_animation_big.dart';
import 'package:flutter/material.dart';

class CardHeroAnimatedSmall extends StatelessWidget {
  final Widget childSmall, childBig;
  final String heroTag;
  final Duration duration;
  final BoxConstraints? bigCardConstraints;
  final CardHeroAnimationOpenType openType;
  const CardHeroAnimatedSmall({
    required this.childSmall,
    required this.childBig,
    required this.heroTag,
    required this.duration,
    this.bigCardConstraints,
    required this.openType,
    super.key,
  });

  _openBigCard(BuildContext context) {
    Navigator.of(context).push(
      HeroDialogRoute(
        duration: duration,
        builder: (context) => CardHeroAnimationBig(
          heroTag: heroTag,
          duration: duration,
          boxConstraints: bigCardConstraints,
          child: childBig,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => InkResponse(
      onLongPress: openType != CardHeroAnimationOpenType.longPress
          ? null
          : () => _openBigCard(context),
      onTap: openType != CardHeroAnimationOpenType.tap
          ? null
          : () => _openBigCard(context),
      onDoubleTap: openType != CardHeroAnimationOpenType.doubleTap
          ? null
          : () => _openBigCard(context),
      child: CardHeroAnimationBase(
        heroTag: heroTag,
        duration: duration,
        child: childSmall,
      ));
}
