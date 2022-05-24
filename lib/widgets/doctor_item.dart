import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final String id;
  final String name;
  final String Number;
  final String Spcilist;

  DoctorItem(this.id, this.name, this.Number, this.Spcilist);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                    child: FittedBox(
                  child: Text(Spcilist),
                )),
                title: Text(name),
                subtitle: Text(Number),
              //  trailing: Text('${quntity}x'),
              ),
            )),
      ),
    );
  }
}
