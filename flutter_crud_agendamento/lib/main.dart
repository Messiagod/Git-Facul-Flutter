import 'package:flutter/material.dart';
import 'package:flutter_crud_agendamento/provider/users.dart';
import 'package:flutter_crud_agendamento/routes/app_routes.dart';
import 'package:flutter_crud_agendamento/views/user_form.dart';
import 'package:flutter_crud_agendamento/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (ctx) => UserForm()
        },
      ),
    );
  }
}
