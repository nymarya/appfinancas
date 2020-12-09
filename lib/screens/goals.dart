import 'dart:ffi';

import 'package:appfinancas/model/goal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
// class Goal{
//   final Float valor;
//   final String titulo;

//   Goal({this.valor, this.titulo});
// }

// class Goals extends StatefulWidget {
//   @override
//   State<Goals> createState() => _GoalsState();
// }

// class _GoalsState extends State<Goals> {
//   final _saved = <Goal>{};
//   final _biggerFont = TextStyle(fontSize: 18.0);
//   // #enddocregion RWS-var

//   // #docregion _buildSuggestions
//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: EdgeInsets.all(16.0),
//         itemBuilder: /*1*/ (context, i) {
//           if (i.isOdd) return Divider(); /*2*/

//           final index = i ~/ 2; /*3*/

//           return _buildRow(_saved);
//         });
//   }
//   // #enddocregion _buildSuggestions

//   // #docregion _buildRow
//   Widget _buildRow(Goal goal) {
//     final alreadySaved = _saved.contains(goal);
//     return ListTile(
//       title: Text(
//         goal.titulo,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
//   // #enddocregion _buildRow

//   // #docregion RWS-build
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Startup Name Generator'),
//         actions: [
//           IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
//         ],
//       ),
//       body: _buildSuggestions(),
//     );
//   }
//   // #enddocregion RWS-build

//   void _pushSaved() {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         // NEW lines from here...
//         builder: (BuildContext context) {
//           final tiles = _saved.map(
//             (Goal pair) {
//               return ListTile(
//                 title: Text(
//                   pair.titulo,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList();

//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Saved Suggestions'),
//             ),
//             body: ListView(children: divided),
//           );
//         }, //...to here.
//       ),
//     );
//   }
//   // #docregion RWS-var
// }
class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreen createState() => _GoalsScreen();
}
class _GoalsScreen extends State<GoalsScreen> {

  GoalModel goal;

  _GoalsScreen({this.goal});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Pop here with "Yep"...
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Pop here with "Nope"
                },
                child: Text('Nope.'),
              ),
            ),
            
          ],

        ), // This trailing comma makes auto-formatting nicer for build methods.
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

class FormWidgetsGoals extends StatefulWidget {
  @override
  _FormWidgetsGoalsState createState() => _FormWidgetsGoalsState();
}

class _FormWidgetsGoalsState extends State<FormWidgetsGoals> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool brushedTeeth = false;
  bool enableFeature = false;

  GoalModel goal = GoalModel();

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
                              goal.titulo = value;
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

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GoalsScreen()));
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