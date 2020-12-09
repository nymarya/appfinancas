import 'package:appfinancas/screens/nav_bar.dart';
import 'package:flutter/material.dart';
import 'screens/form_widgets.dart';
import 'screens/goals.dart';
import 'screens/incomings.dart';
import 'screens/investments.dart';
import 'screens/spendings.dart';
import 'screens/fixed_spendings.dart';
import 'screens/notifications.dart';
import 'screens/profile.dart';

void main() {
  runApp(MyApp());
}
 final demos = [
  // Demo(
  //   name: 'Autofill',
  //   route: '/autofill',
  //   builder: (context) => AutofillDemo(),
  // ),
  Demo(
    name: 'Form widgets',
    route: '/form_widgets',
    builder: (context) => FormWidgetsDemo(),
  ),
  Demo(
    name: 'Metas',
    route: '/goals',
    builder: (context) => GoalsScreen(),
  ),
   Demo(
    name: 'Nova meta',
    route: '/form_goals',
    builder: (context) => FormWidgetsGoals(),
  ),
  Demo(
    name: 'Receitas',
    route: '/incomings',
    builder: (context) => IncomingsScreen(),
  ),
   Demo(
    name: 'Nova receita',
    route: '/form_incomings',
    builder: (context) => FormWidgetsIncomings(),
  ),
  Demo(
    name: 'Despesas fixas',
    route: '/fixed_spendings',
    builder: (context) => FixedSpendingsScreen(),
  ),
   Demo(
    name: 'Nova despesa fixa',
    route: '/form_fixed_spendings',
    builder: (context) => FormWidgetFixedSpendings(),
  ),
  Demo(
    name: 'Despesas variáveis',
    route: '/spendings',
    builder: (context) => SpendingsScreen(),
  ),
   Demo(
    name: 'Nova despesa variável',
    route: '/form_spendings',
    builder: (context) => FormWidgetsSpendings(),
  ),
  Demo(
    name: 'Investimentos',
    route: '/investments',
    builder: (context) => InvestmentsScreen(),
  ),
   Demo(
    name: 'Novo investmento',
    route: '/form_investments',
    builder: (context) => FormWidgetsInvestments(),
  ),
  Demo(
    name: 'Notificações',
    route: '/notifications',
    builder: (context) => NotificationsScreen(),
  ),
   Demo(
    name: 'Perfil',
    route: '/profile',
    builder: (context) => ProfileScreen(),
  ),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Finanças',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: Map.fromEntries(demos.map((d) => MapEntry(d.route, d.builder))),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('App Finanças'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.notifications),
                     onPressed: (){ Navigator.pushNamed(context, '/notifications'); })
        ],
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}