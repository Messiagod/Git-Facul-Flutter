import 'package:flutter/material.dart';
import 'package:flutter_crud_agendamento/models/user.dart';
import 'package:flutter_crud_agendamento/routes/app_routes.dart';

// ignore: use_key_in_widget_constructors
class UserTile extends StatelessWidget {
  final User user;

  // ignore: use_key_in_widget_constructors
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        // ignore: prefer_const_constructors
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
                color: Colors.green,
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {},
                color: Colors.red,
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
