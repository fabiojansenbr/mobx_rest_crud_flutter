import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
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
        title: Observer(builder: (_) {
          if (companyController.companies.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (companyController.companies.status == FutureStatus.rejected) {
            return Center(
              child: Text('Erro ao obter companies'),
            );
          }
          return Text(
              'Companies - ${companyController.companies.value.length}');
        }),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Observer(
          builder: (_) =>
              companyController.companies.status == FutureStatus.pending
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: companyController.companies.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        final company =
                            companyController.companies.value[index];
                        return Dismissible(
                          child: InkWell(
                            onTap: () {
                              _dialog(
                                  id: company.id,
                                  name: company.name,
                                  email: company.email);
                            },
                            child: ListTile(
                              title: Text(company.name),
                            ),
                          ),
                          key: Key(company.id),
                          onDismissed: (direction) async {
                            await companyController.deleteCompany(company.id);

                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${company.name} - removida'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _dialog({String id, String name, String email}) {
    print(id);
    String titulo = '';

    if (id == null) {
      titulo = 'Nova empresa';
    } else {
      titulo = 'Editar empresa';
      companyController.setName(name);
      companyController.setEmail(email);
    }

    print('$name - $email');

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(titulo),
            content: Container(
              padding: EdgeInsets.all(10),
              height: 170,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: name,
                    onChanged: (value) {
                      companyController.setName(value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nome'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: email,
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
                  if (id == null) {
                    companyController.addCompany();
                    Navigator.pop(context);
                  } else {
                    companyController.updateCompany(id);
                    Navigator.pop(context);
                  }
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
