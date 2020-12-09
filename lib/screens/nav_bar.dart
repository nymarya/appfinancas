import 'package:flutter/material.dart';
import 'form_widgets.dart';
import 'goals.dart';

// final demos = [
//   // Demo(
//   //   name: 'Autofill',
//   //   route: '/autofill',
//   //   builder: (context) => AutofillDemo(),
//   // ),
//   Demo(
//     name: 'Form widgets',
//     route: '/form_widgets',
//     builder: (context) => FormWidgetsDemo(),
//   ),
//   Demo(
//     name: 'Metas',
//     route: '/goals',
//     builder: (context) => GoalsScreen(),
//   ),
// ];

// class DemoTile extends StatelessWidget {
//   final Demo demo;

//   DemoTile(this.demo);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(demo.name),
//       onTap: () {
//         Navigator.pushNamed(context, demo.route);
//       },
//     );
//   }
// }

// class Demo {
//   final String name;
//   final String route;
//   final WidgetBuilder builder;

//   const Demo({this.name, this.route, this.builder});
// }

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('assets/images/cover.jpg'))
                    ),
          ),
         // ...demos.map((d) => DemoTile(d)),
          ListTile(
            leading: Icon(Icons.verified_outlined),
            title: Text('Metas'),
            onTap: () => {Navigator.pushNamed(context, '/goals')},
          ),
          ListTile(
            leading: Icon(Icons.payments_outlined),
            title: Text('Despesas fixas'),
            onTap: () => {Navigator.pushNamed(context, '/fixed_spendings')},
          ),
          ListTile(
            leading: Icon(Icons.payments_sharp),
            title: Text('Despesas variáveis'),
            onTap: () => {Navigator.pushNamed(context, '/spendings')},
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet_outlined),
            title: Text('Receitas'),
            onTap: () => {Navigator.pushNamed(context, '/incomings')},
          ),
          ListTile(
            leading: Icon(Icons.attach_money_outlined),
            title: Text('Investimentos'),
            onTap: () => {Navigator.pushNamed(context, '/investments')},
          ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.border_color),
          //   title: Text('Feedback'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}