// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$documentsGetterHash() => r'577b8d6912968813d64628b4c59befcd9322708a';

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

abstract class _$DocumentsGetter
    extends BuildlessAutoDisposeAsyncNotifier<List<Document>> {
  late final String? messageId;

  FutureOr<List<Document>> build(
    String? messageId,
  );
}

/// See also [DocumentsGetter].
@ProviderFor(DocumentsGetter)
const documentsGetterProvider = DocumentsGetterFamily();

/// See also [DocumentsGetter].
class DocumentsGetterFamily extends Family<AsyncValue<List<Document>>> {
  /// See also [DocumentsGetter].
  const DocumentsGetterFamily();

  /// See also [DocumentsGetter].
  DocumentsGetterProvider call(
    String? messageId,
  ) {
    return DocumentsGetterProvider(
      messageId,
    );
  }

  @override
  DocumentsGetterProvider getProviderOverride(
    covariant DocumentsGetterProvider provider,
  ) {
    return call(
      provider.messageId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'documentsGetterProvider';
}

/// See also [DocumentsGetter].
class DocumentsGetterProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DocumentsGetter, List<Document>> {
  /// See also [DocumentsGetter].
  DocumentsGetterProvider(
    String? messageId,
  ) : this._internal(
          () => DocumentsGetter()..messageId = messageId,
          from: documentsGetterProvider,
          name: r'documentsGetterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$documentsGetterHash,
          dependencies: DocumentsGetterFamily._dependencies,
          allTransitiveDependencies:
              DocumentsGetterFamily._allTransitiveDependencies,
          messageId: messageId,
        );

  DocumentsGetterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.messageId,
  }) : super.internal();

  final String? messageId;

  @override
  FutureOr<List<Document>> runNotifierBuild(
    covariant DocumentsGetter notifier,
  ) {
    return notifier.build(
      messageId,
    );
  }

  @override
  Override overrideWith(DocumentsGetter Function() create) {
    return ProviderOverride(
      origin: this,
      override: DocumentsGetterProvider._internal(
        () => create()..messageId = messageId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        messageId: messageId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DocumentsGetter, List<Document>>
      createElement() {
    return _DocumentsGetterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DocumentsGetterProvider && other.messageId == messageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, messageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DocumentsGetterRef
    on AutoDisposeAsyncNotifierProviderRef<List<Document>> {
  /// The parameter `messageId` of this provider.
  String? get messageId;
}

class _DocumentsGetterProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DocumentsGetter,
        List<Document>> with DocumentsGetterRef {
  _DocumentsGetterProviderElement(super.provider);

  @override
  String? get messageId => (origin as DocumentsGetterProvider).messageId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
