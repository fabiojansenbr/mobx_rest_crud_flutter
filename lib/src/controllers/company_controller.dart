import 'package:mobx/mobx.dart';
import 'package:mobx_api_flutter/src/models/company_model.dart';
import 'package:mobx_api_flutter/src/repositories/company_repository.dart';
part 'company_controller.g.dart';

class CompanyController = _CompanyControllerBase with _$CompanyController;

abstract class _CompanyControllerBase with Store {
  CompanyRepository companyRepository = CompanyRepository();

  @observable
  ObservableFuture<List<CompanyModel>> companies;

  @observable
  String name;

  @observable
  String email;

  @action
  setName(String value) => name = value;

  @action
  setEmail(String value) => email = value;

  @action
  fetchCompanies() async {
    companies = companyRepository.getCompanies().asObservable();
  }

  @action
  Future addCompany() async {
    await companyRepository.addCompany(name, email);
    fetchCompanies();
  }
}
