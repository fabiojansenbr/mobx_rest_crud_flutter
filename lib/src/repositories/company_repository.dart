import 'package:dio/dio.dart';
import 'package:mobx_api_flutter/src/models/company_model.dart';

class CompanyRepository {
  Future<List<CompanyModel>> getCompanies() async {
    var url = "https://codefirst.herokuapp.com/api/v1/companies";

    Response response = await Dio().get(url);

    final companyData = response.data['companies']['companies'];

    return (companyData as List)
        .map((company) => CompanyModel.fromJson(company))
        .toList();
  }

  Future addCompany(String name, String email) async {
    final bodyData = {'name': name, 'email': email};

    var url = "https://codefirst.herokuapp.com/api/v1/companies";

    final headers = {'contentType': 'application/json'};

    Response response = await Dio()
        .post(url, data: bodyData, options: Options(headers: headers));

    print(response.data);
  }

  Future updateCompany(String id, String name, String email) async {
    final bodyData = {'name': name, 'email': email};

    var url = "https://codefirst.herokuapp.com/api/v1/companies/$id";

    final headers = {'contentType': 'application/json'};

    Response response = await Dio()
        .put(url, data: bodyData, options: Options(headers: headers));

    print(response.data);
  }

  Future removeCompany(String id) async {
    var url = "https://codefirst.herokuapp.com/api/v1/companies/$id";

    final headers = {'contentType': 'application/json'};

    Response response =
        await Dio().delete(url, options: Options(headers: headers));

    print(response.data);
  }
}
