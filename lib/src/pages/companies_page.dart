import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_api_flutter/src/controllers/company_controller.dart';

class CompaniesPage extends StatefulWidget {
  CompaniesPage({Key key}) : super(key: key);

  @override
  _CompaniesPageState createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  final companyController = CompanyController();

  @override
  void initState() {
    companyController.fetchCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (BuildContext context) {
            return Text('Empresas - ${companyController.companies.length}');
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Observer(
          builder: (BuildContext context) {
            print('buildei o componente');
            return (companyController.companies.length != 0 ||
                    companyController.companies == null)
                ? Observer(
                    builder: (BuildContext context) {
                      return ListView.builder(
                        itemCount: companyController.companies.length,
                        itemBuilder: (BuildContext context, int index) {
                          final company = companyController.companies[index];
                          return ListTile(
                            title: Text(company.name),
                          );
                        },
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _dialog,
        child: Icon(Icons.add),
      ),
    );
  }

  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Nova Empresa'),
            content: Container(
              padding: EdgeInsets.all(10),
              height: 170,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      companyController.setName(value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nome'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {
                      companyController.setEmail(value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  companyController.addCompany();
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
            ],
          );
        });
  }
}
