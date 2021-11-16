import 'package:flutter/material.dart';
import 'package:flutter_crud_agendamento/models/user.dart';
import 'package:flutter_crud_agendamento/provider/users.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserForm extends StatelessWidget {
  // ignore: unused_field
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final Object? user = ModalRoute.of(context)!.settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Formulário de Agendamento'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Users>(context, listen: false).put(User(
                    id: _formData['id'] ?? ' ',
                    name: _formData['name'] ?? ' ',
                    email: _formData['email'] ?? ' ',
                    avatarUrl: _formData['avatarUrl'] ?? ' ',
                  ));
                }
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome invalido';
                    }

                    if (value.trim().length < 3) {
                      return 'Nome muito pequeno. No mínimo 3 letras.';
                    }

                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Horário e dia'),
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  onSaved: (value) => _formData['email'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: const InputDecoration(labelText: 'URL do Avatar'),
                  onSaved: (value) => _formData['avatarUrl'] = value!,
                ),
              ],
            ),
          )),
    );
  }
}
