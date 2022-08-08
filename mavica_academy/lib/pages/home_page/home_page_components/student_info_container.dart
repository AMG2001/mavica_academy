import 'package:flutter/material.dart';

class StudentInfoContainer extends StatelessWidget {
  const StudentInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/application/ana.png'),
        ),
        title: Text('mohamad amgad'),
        subtitle: Text(
          'mohamadamgad09@gmail.com',
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
