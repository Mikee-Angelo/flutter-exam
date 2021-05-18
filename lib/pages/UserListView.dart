import 'package:exam/models/UserListViewModel.dart';
import 'package:flutter/material.dart';

class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final users = UserListViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: users.fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User ID: ${snapshot.data[i].id}'),
                  Text('${snapshot.data[i].name}'),
                  Text('${snapshot.data[i].imageUrl}'),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int i) {
              return Divider();
            },
          );
        },
      ),
    );
  }
}
