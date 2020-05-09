import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'package:places/User/model/user.dart';
import 'package:places/User/ui/widgets/button_bar.dart';
import 'package:places/User/ui/widgets/user_info.dart';


class ProfileHeader extends StatefulWidget {

  User user;

  ProfileHeader({
    Key key,
    @required this.user
  });

  @override
  State<StatefulWidget> createState() {
    return _ProfileHeader();
  }

}

class _ProfileHeader extends State<ProfileHeader> {

  final Widget title = Text(
    'Profile',
    style: TextStyle(
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              this.title
            ],
          ),
          UserInfo(widget.user),
          ButtonsBar()
        ],
      ),
    );
  }

}
