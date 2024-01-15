import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: Colors.grey[300],
      child: ListView(
        children: [
            UserAccountsDrawerHeader(accountName: Text('User'), accountEmail: Text('user@gmail.com'),
            
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset("assets/profile.jpg",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              ),
              
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[900]
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(onPressed: (){
              
            },
            icon: Icon(Icons.dark_mode_sharp,
            size: 50,
            
            )),
          )

        ],
      ),
    );
  }
}