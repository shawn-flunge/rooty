// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lessonByIdHash() => r'0bcd10b4ff71b68c9258120110709ea6e96f5bbf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LessonById extends BuildlessAutoDisposeAsyncNotifier<Lesson> {
  late final String id;

  FutureOr<Lesson> build(String id);
}

/// See also [LessonById].
@ProviderFor(LessonById)
const lessonByIdProvider = LessonByIdFamily();

/// See also [LessonById].
class LessonByIdFamily extends Family<AsyncValue<Lesson>> {
  /// See also [LessonById].
  const LessonByIdFamily();

  /// See also [LessonById].
  LessonByIdProvider call(String id) {
    return LessonByIdProvider(id);
  }

  @override
  LessonByIdProvider getProviderOverride(
    covariant LessonByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lessonByIdProvider';
}

/// See also [LessonById].
class LessonByIdProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LessonById, Lesson> {
  /// See also [LessonById].
  LessonByIdProvider(String id)
    : this._internal(
        () => LessonById()..id = id,
        from: lessonByIdProvider,
        name: r'lessonByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$lessonByIdHash,
        dependencies: LessonByIdFamily._dependencies,
        allTransitiveDependencies: LessonByIdFamily._allTransitiveDependencies,
        id: id,
      );

  LessonByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<Lesson> runNotifierBuild(covariant LessonById notifier) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(LessonById Function() create) {
    return ProviderOverride(
      origin: this,
      override: LessonByIdProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LessonById, Lesson> createElement() {
    return _LessonByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LessonByIdRef on AutoDisposeAsyncNotifierProviderRef<Lesson> {
  /// The parameter `id` of this provider.
  String get id;
}

class _LessonByIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LessonById, Lesson>
    with LessonByIdRef {
  _LessonByIdProviderElement(super.provider);

  @override
  String get id => (origin as LessonByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
