 import 'package:flutter/material.dart';

Widget _buildCard() => SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Aumenta tu masa muscular con estos trucos',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('No imaginarás que es lo que nos contaron los doctores...'),
              leading: Icon(
                Icons.fitness_center_outlined,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('(408) 555-1212',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('costa@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );