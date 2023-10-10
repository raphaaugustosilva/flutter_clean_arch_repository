// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxBaseStore on MobxBaseStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MobxBaseStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingTextAtom =
      Atom(name: 'MobxBaseStoreBase.isLoadingText', context: context);

  @override
  String? get isLoadingText {
    _$isLoadingTextAtom.reportRead();
    return super.isLoadingText;
  }

  @override
  set isLoadingText(String? value) {
    _$isLoadingTextAtom.reportWrite(value, super.isLoadingText, () {
      super.isLoadingText = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: 'MobxBaseStoreBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: 'MobxBaseStoreBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$MobxBaseStoreBaseActionController =
      ActionController(name: 'MobxBaseStoreBase', context: context);

  @override
  dynamic setIsLoading(bool value, {String? loadingTextValue}) {
    final _$actionInfo = _$MobxBaseStoreBaseActionController.startAction(
        name: 'MobxBaseStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value, loadingTextValue: loadingTextValue);
    } finally {
      _$MobxBaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHasError(bool value, {String? errorTextValue}) {
    final _$actionInfo = _$MobxBaseStoreBaseActionController.startAction(
        name: 'MobxBaseStoreBase.setHasError');
    try {
      return super.setHasError(value, errorTextValue: errorTextValue);
    } finally {
      _$MobxBaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingText: ${isLoadingText},
hasError: ${hasError},
errorText: ${errorText}
    ''';
  }
}
