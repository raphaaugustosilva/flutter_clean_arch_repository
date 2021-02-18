// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_order_list_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxOrderListPresenter on _MobxOrderListPresenterBase, Store {
  final _$isLoadingAtom = Atom(name: '_MobxOrderListPresenterBase.isLoading');

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

  final _$_MobxOrderListPresenterBaseActionController =
      ActionController(name: '_MobxOrderListPresenterBase');

  @override
  dynamic addOrders(dynamic value) {
    final _$actionInfo = _$_MobxOrderListPresenterBaseActionController
        .startAction(name: '_MobxOrderListPresenterBase.addOrders');
    try {
      return super.addOrders(value);
    } finally {
      _$_MobxOrderListPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading(dynamic value) {
    final _$actionInfo = _$_MobxOrderListPresenterBaseActionController
        .startAction(name: '_MobxOrderListPresenterBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_MobxOrderListPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
