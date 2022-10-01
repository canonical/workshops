import 'package:flutter/widgets.dart';

import 'terminal_intents.dart';

class ScrollUpAction extends Action<ScrollUpIntent> {
  ScrollUpAction(this.controller);

  final ScrollController controller;

  @override
  Object? invoke(covariant ScrollUpIntent intent) {
    controller.jumpTo(controller.position.pixels - 10);
    return null;
  }
}

class ScrollDownAction extends Action<ScrollDownIntent> {
  ScrollDownAction(this.controller);

  final ScrollController controller;

  @override
  Object? invoke(covariant ScrollDownIntent intent) {
    controller.jumpTo(controller.position.pixels + 10);
    return null;
  }
}

class ScrollPageUpAction extends Action<ScrollPageUpIntent> {
  ScrollPageUpAction(this.controller);

  final ScrollController controller;

  @override
  Object? invoke(covariant ScrollPageUpIntent intent) {
    controller.jumpTo(
        controller.position.pixels - controller.position.viewportDimension);
    return null;
  }
}

class ScrollPageDownAction extends Action<ScrollPageDownIntent> {
  ScrollPageDownAction(this.controller);

  final ScrollController controller;

  @override
  Object? invoke(covariant ScrollPageDownIntent intent) {
    controller.jumpTo(
        controller.position.pixels + controller.position.viewportDimension);
    return null;
  }
}

class ScrollToTopAction extends Action<ScrollToTopIntent> {
  ScrollToTopAction(this.controller);

  final ScrollController controller;

  @override
  Object? invoke(covariant ScrollToTopIntent intent) {
    controller.jumpTo(controller.position.minScrollExtent);
    return null;
  }
}

class ScrollToBottomAction extends Action<ScrollToBottomIntent> {
  ScrollToBottomAction(this.controller);

  final ScrollController controller;

  @override
  Object? invoke(covariant ScrollToBottomIntent intent) {
    controller.jumpTo(controller.position.maxScrollExtent);
    return null;
  }
}
