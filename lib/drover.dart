import 'package:flutter/material.dart';

class Mdrover extends StatelessWidget {
  const Mdrover({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: Colors.white,
      
      child: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
              height: 230,
              width: 310,
              color: Colors.red,
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/yj.jpg',),
              
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}