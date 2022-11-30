import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:os_logo/src/os_logo.dart';

import 'os_logo_test.mocks.dart';

@GenerateMocks([AssetBundle])
void main() {
  final osVariant = ValueVariant({
    'almalinux',
    'alpine',
    'alt',
    'amazonlinux',
    'apertis',
    'archlinux',
    'centos',
    'debian',
    'devuan',
    'fedora',
    'gentoo',
    'kali',
    'mint',
    'opensuse',
    'openwrt',
    'oracle',
    'pld',
    'rockylinux',
    'ubuntu',
    'voidlinux',
  });

  Widget buildLogo({required String? os, required AssetBundle bundle}) {
    return DefaultAssetBundle(
      bundle: bundle,
      child: Builder(
        builder: (context) => OsLogo.asset(name: os, size: 48),
      ),
    );
  }

  testWidgets('os logo', (tester) async {
    final os = osVariant.currentValue;

    final bundle = MockAssetBundle();
    when(bundle.loadString(argThat(matches(RegExp('.*(-light|-dark).svg')))))
        .thenThrow(FlutterError(''));
    when(bundle.loadString('packages/os_logo/assets/$os.svg'))
        .thenAnswer((_) async => '<svg width="1" height="1"/>');

    await tester.pumpWidget(buildLogo(os: os, bundle: bundle));
    await tester.pumpAndSettle();

    expect(find.byType(SvgPicture), findsOneWidget);

    verify(bundle.loadString('packages/os_logo/assets/$os.svg'));
  }, variant: osVariant);

  testWidgets('rebuild', (tester) async {
    final bundle = MockAssetBundle();
    when(bundle.loadString(argThat(matches(RegExp('.*(-light|-dark).svg')))))
        .thenThrow(FlutterError(''));
    when(bundle.loadString('packages/os_logo/assets/ubuntu.svg'))
        .thenAnswer((_) async => '<svg width="1" height="1"/>');

    await tester.pumpWidget(buildLogo(os: null, bundle: bundle));
    await tester.pumpAndSettle();

    verifyNever(bundle.loadString('packages/os_logo/assets/ubuntu.svg'));

    await tester.pumpWidget(buildLogo(os: 'ubuntu', bundle: bundle));
    await tester.pumpAndSettle();

    verify(bundle.loadString('packages/os_logo/assets/ubuntu.svg'));
  });

  testWidgets('fail', (tester) async {
    final bundle = MockAssetBundle();
    when(bundle.loadString(any)).thenThrow(FlutterError('fail'));

    await tester.pumpWidget(buildLogo(os: 'fail', bundle: bundle));
    await tester.pumpAndSettle();

    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('light variant', (tester) async {
    final bundle = MockAssetBundle();
    when(bundle.loadString('packages/os_logo/assets/ubuntu-light.svg'))
        .thenAnswer((_) async => '<svg width="1" height="1"/>');

    await tester.pumpWidget(
      Theme(
        data: ThemeData.light(),
        child: buildLogo(os: 'ubuntu', bundle: bundle),
      ),
    );
    await tester.pumpAndSettle();

    verify(bundle.loadString('packages/os_logo/assets/ubuntu-light.svg'));
    verifyNever(bundle.loadString('packages/os_logo/assets/ubuntu.svg'));
  });

  testWidgets('dark variant', (tester) async {
    final bundle = MockAssetBundle();
    when(bundle.loadString('packages/os_logo/assets/ubuntu-dark.svg'))
        .thenAnswer((_) async => '<svg width="1" height="1"/>');

    await tester.pumpWidget(
      Theme(
        data: ThemeData.dark(),
        child: buildLogo(os: 'ubuntu', bundle: bundle),
      ),
    );
    await tester.pumpAndSettle();

    verify(bundle.loadString('packages/os_logo/assets/ubuntu-dark.svg'));
    verifyNever(bundle.loadString('packages/os_logo/assets/ubuntu.svg'));
  });
}
