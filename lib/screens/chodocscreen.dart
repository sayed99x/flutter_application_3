import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second/providers/doctor.dart';
import '../widgets/doctor_item.dart';
import '../providers/doctor.dart';

class ChosserDoctor extends StatelessWidget {
  static const routeName = '/Chossedoctor';
  @override
  Widget build(BuildContext context) {
    final doctorData = Provider.of<Doctor>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Doctor'),
        actions: [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(14),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                child: Text('Chosse a doctor and contact with each other'),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => DoctorItem(
                doctorData.doctoDaata.keys.toList()[i],
                doctorData.doctoDaata.values.toList()[i].Name,
                doctorData.doctoDaata.values.toList()[i].Number,
                doctorData.doctoDaata.values.toList()[i].spcalist),
            itemCount: doctorData.doctorCount,
          ))
        ],
      ),
    );
  }
}
