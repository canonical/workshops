import 'package:flutter/material.dart';

class WizardPageTransitionsBuilder extends PageTransitionsBuilder {
  const WizardPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _WizardPageTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }
}

class _WizardPageTransition extends StatelessWidget {
  _WizardPageTransition({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required this.child,
  })  : _position = animation.drive(_tween.chain(_fastOutSlowInTween)),
        _secondaryPosition = secondaryAnimation
            .drive(_secondaryTween.chain(_fastOutSlowInTween)),
        _opacity = animation.drive(_easeInTween),
        _secondaryOpacity = secondaryAnimation.drive(_easeInTween);

  static final _tween = Tween(begin: const Offset(0.1, 0.0), end: Offset.zero);
  static final _secondaryTween =
      Tween(begin: Offset.zero, end: const Offset(-0.1, 0.0));
  static final _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);
  static final _easeInTween = CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _position, _secondaryPosition;
  final Animation<double> _opacity, _secondaryOpacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    return SlideTransition(
      position: _secondaryPosition,
      textDirection: textDirection,
      child: FadeTransition(
        opacity: ReverseAnimation(_secondaryOpacity),
        child: SlideTransition(
          position: _position,
          textDirection: textDirection,
          child: FadeTransition(
            opacity: _opacity,
            child: child,
          ),
        ),
      ),
    );
  }
}
