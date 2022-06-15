import 'dart:io';

import 'package:osarch/osarch.dart';
import 'package:test/test.dart';

void main() {
  test('by name', () {
    expect(Arch.byName('x86'), equals(Arch.i686));
    expect(Arch.byName('386'), equals(Arch.i686));
    expect(Arch.byName('i686'), equals(Arch.i686));

    expect(Arch.byName('x86_64'), equals(Arch.x86_64));
    expect(Arch.byName('amd64'), equals(Arch.x86_64));

    expect(Arch.byName('arm'), equals(Arch.armv7l));
    expect(Arch.byName('armv7'), equals(Arch.armv7l));
    expect(Arch.byName('armv7l'), equals(Arch.armv7l));

    expect(Arch.byName('unknown'), isNull);
  });

  test('local', () {
    expect(Arch.local(), isNotNull);
  }, skip: !Platform.isLinux);
}
