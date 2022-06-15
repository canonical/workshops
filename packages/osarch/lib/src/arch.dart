import 'package:collection/collection.dart';
import 'package:libc/libc.dart';

enum Arch {
  /// ARCH_32BIT_INTEL_X86
  i686(
    personality: 'linux32',
    supportedPersonalities: {},
    aliases: ['i386', 'i586', '386', 'x86', 'generic_32'],
  ),

  /// ARCH_64BIT_INTEL_X86
  x86_64(
    personality: 'linux64',
    supportedPersonalities: {Arch.i686},
    aliases: ['amd64', 'generic_64'],
  ),

  /// ARCH_32BIT_ARMV7_LITTLE_ENDIAN
  armv7l(
    personality: 'linux32',
    supportedPersonalities: {},
    aliases: [
      'armel',
      'armhf',
      'arm',
      'armhfp',
      'armv7a_hardfp',
      'armv7',
      'armv7a_vfpv3_hardfp',
    ],
  ),

  /// ARCH_64BIT_ARMV8_LITTLE_ENDIAN
  aarch64(
    personality: 'linux64',
    supportedPersonalities: {Arch.armv7l},
    aliases: ['arm64', 'arm64_generic'],
  ),

  /// ARCH_32BIT_POWERPC_BIG_ENDIAN
  ppc(
    personality: 'linux32',
    supportedPersonalities: {},
    aliases: ['powerpc'],
  ),

  /// ARCH_64BIT_POWERPC_BIG_ENDIAN
  ppc64(
    personality: 'linux64',
    supportedPersonalities: {Arch.ppc},
    aliases: ['powerpc64', 'ppc64'],
  ),

  /// ARCH_64BIT_POWERPC_LITTLE_ENDIAN
  ppc64le(
    personality: 'linux64',
    supportedPersonalities: {},
    aliases: ['ppc64el'],
  ),

  /// ARCH_64BIT_S390_BIG_ENDIAN
  s390x(
    personality: 'linux64',
    supportedPersonalities: {},
    aliases: [],
  ),

  /// ARCH_32BIT_MIPS
  mips(
    personality: 'linux32',
    supportedPersonalities: {},
    aliases: ['mipsel'],
  ),

  /// ARCH_64BIT_MIPS
  mips64(
    personality: 'linux64',
    supportedPersonalities: {Arch.mips},
    aliases: ['mips64el'],
  ),

  /// ARCH_32BIT_RISCV_LITTLE_ENDIAN
  riscv32(
    personality: 'linux32',
    supportedPersonalities: {},
    aliases: [],
  ),

  /// ARCH_64BIT_RISCV_LITTLE_ENDIAN
  riscv64(
    personality: 'linux64',
    supportedPersonalities: {},
    aliases: [],
  );

  const Arch({
    required this.personality,
    required this.supportedPersonalities,
    required this.aliases,
  });

  final String personality;
  final Set<Arch> supportedPersonalities;
  final List<String> aliases;

  static Arch? byName(String arch) {
    try {
      return Arch.values.byName(arch);
    } on ArgumentError catch (_) {
      return Arch.values.firstWhereOrNull((v) => v.aliases.contains(arch));
    }
  }

  static Arch? local() => Arch.byName(uname().machine);
}
