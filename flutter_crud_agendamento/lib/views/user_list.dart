import 'package:flutter/material.dart';
import 'package:flutter_crud_agendamento/components/user_tile.dart';
import 'package:flutter_crud_agendamento/models/user.dart';
import 'package:flutter_crud_agendamento/provider/users.dart';
import 'package:flutter_crud_agendamento/routes/app_routes.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios '),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
