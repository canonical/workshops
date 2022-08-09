import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wizard_router/wizard_router.dart';

class WizardPage extends StatelessWidget {
  const WizardPage({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  final Widget title;
  final Widget? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () {
          final wizard = Wizard.of(context);
          if (wizard.hasPrevious) {
            wizard.back();
          } else {
            wizard.done();
          }
        }
      },
      child: Focus(
        autofocus: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 24,
                top: 16,
                bottom: 16,
              ),
              child: Row(
                children: [
                  if (Wizard.of(context).hasPrevious)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8.0),
                      child: IconButton(
                        splashRadius: 16,
                        padding: EdgeInsets.zero,
                        onPressed: Wizard.of(context).back,
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.headlineSmall!,
                    child: title,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: content,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions.separated(const SizedBox(width: 8)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension _Separator<T> on Iterable<T> {
  Iterable<T> separated(T separator) {
    return expand((item) sync* {
      yield separator;
      yield item;
    }).skip(1);
  }
}
