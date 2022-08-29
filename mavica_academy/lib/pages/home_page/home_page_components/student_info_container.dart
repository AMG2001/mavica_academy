import 'package:flutter/material.dart';
import 'package:mavica_academy/config/user_logs/user_info.dart';

class StudentInfoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              UserInfo.photoUrlSharedPref.getString("photoUrl")!),
        ),
        title: Text(UserInfo.userNameSharedPref.getString("userName")!),
        subtitle: Text(
          UserInfo.emailSharedPref.getString("email")!,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
