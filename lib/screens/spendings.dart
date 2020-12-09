

import 'package:appfinancas/model/spending.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
// class Goal{
//   final Float valor;
//   final String tipo;

//   Goal({this.valor, this.tipo});
// }


class SpendingsScreen extends StatefulWidget {
  @override
  _SpendingsScreen createState() => _SpendingsScreen( goals: [SpendingModel(tipo: "Lazer", valor: 3000.0)]);
}
class _SpendingsScreen extends State<SpendingsScreen> {

  List<SpendingModel> goals = [SpendingModel(tipo: "Lazer", valor: 3000.0)];

  _SpendingsScreen({this.goals});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metas'),
      ),
      body: Container(
        child: Column(children: <Widget>[ 
          Expanded(child: ListView.builder(itemCount: goals.length, itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              height: 220,
              width: double.maxFinite,
              child: Card(elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: RichText(
                              text: TextSpan(
                                text: goals[index].tipo,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                                color: Colors.black),
                                )
                              ))
              ));
          }))],)
         // This trailing comma makes auto-formatting nicer for build methods.
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Novo',
        child: Icon(Icons.add),
        onPressed: () => {Navigator.pushNamed(context, '/form_goals')},
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FormWidgetsSpendings extends StatefulWidget {
  @override
  _FormWidgetsSpendingsState createState() => _FormWidgetsSpendingsState();
}

class _FormWidgetsSpendingsState extends State<FormWidgetsSpendings> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool brushedTeeth = false;
  bool enableFeature = false;

  SpendingModel goal = SpendingModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form widgets'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Digite o nome...',
                            labelText: 'Nome',
                          ),
                          onChanged: (value) {
                            setState(() {
                              goal.tipo = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            filled: true,
                            hintText: 'Digite o valor...',
                            labelText: 'Valor',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            goal.valor = value as double;
                          },
                        ),
                        _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              //goal.date = value;
                            });
                          },
                        ),
                         RaisedButton(
                          color: Colors.blueAccent,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              Navigator.of(context).pop();

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SpendingsScreen()));
                            }
                          },
                          child: Text(
                            'Salvar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                       
                      ].expand(
                        (widget) => [
                          widget,
                          SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged onChanged;

  _FormDatePicker({
    this.date,
    this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        FlatButton(
          child: Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}