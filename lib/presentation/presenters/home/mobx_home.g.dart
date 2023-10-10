// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxHome on MobxHomeBase, Store {
  late final _$concertListAtom =
      Atom(name: 'MobxHomeBase.concertList', context: context);

  @override
  ObservableList<ConcertModel> get concertList {
    _$concertListAtom.reportRead();
    return super.concertList;
  }

  @override
  set concertList(ObservableList<ConcertModel> value) {
    _$concertListAtom.reportWrite(value, super.concertList, () {
      super.concertList = value;
    });
  }

  late final _$MobxHomeBaseActionController =
      ActionController(name: 'MobxHomeBase', context: context);

  @override
  dynamic setConcertList(List<ConcertModel>? list) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.setConcertList');
    try {
      return super.setConcertList(list);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
concertList: ${concertList}
    ''';
  }
}
