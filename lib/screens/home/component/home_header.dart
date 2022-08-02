
import 'package:flutter/material.dart';
import 'package:sellsrateadmin/widget/rounded_icon_button.dart';

class HomeHeader extends StatelessWidget {
  
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedIconButton(
            iconData: Icons.menu,
            press: () {
              Scaffold.of(context).openDrawer();
            }),
     
        SizedBox(width: 5),

        Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 15),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(21), border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                CircleAvatar( backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.black, ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Admin'),
                )
              ],
            ),
          ),
        )
   
      ],
    );
  }
}
