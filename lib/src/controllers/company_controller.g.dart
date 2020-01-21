// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyController on _CompanyControllerBase, Store {
  final _$companiesAtom = Atom(name: '_CompanyControllerBase.companies');

  @override
  ObservableFuture<List<CompanyModel>> get companies {
    _$companiesAtom.context.enforceReadPolicy(_$companiesAtom);
    _$companiesAtom.reportObserved();
    return super.companies;
  }

  @override
  set companies(ObservableFuture<List<CompanyModel>> value) {
    _$companiesAtom.context.conditionallyRunInAction(() {
      super.companies = value;
      _$companiesAtom.reportChanged();
    }, _$companiesAtom, name: '${_$companiesAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_CompanyControllerBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_CompanyControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$fetchCompaniesAsyncAction = AsyncAction('fetchCompanies');

  @override
  Future fetchCompanies() {
    return _$fetchCompaniesAsyncAction.run(() => super.fetchCompanies());
  }

  final _$addCompanyAsyncAction = AsyncAction('addCompany');

  @override
  Future<dynamic> addCompany() {
    return _$addCompanyAsyncAction.run(() => super.addCompany());
  }

  final _$_CompanyControllerBaseActionController =
      ActionController(name: '_CompanyControllerBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_CompanyControllerBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_CompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_CompanyControllerBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_CompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
