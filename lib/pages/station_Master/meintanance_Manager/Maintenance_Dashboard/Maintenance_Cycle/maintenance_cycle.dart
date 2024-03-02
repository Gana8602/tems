import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MaintenanceCycle extends StatefulWidget {
  const MaintenanceCycle({super.key});

  @override
  State<MaintenanceCycle> createState() => _MaintenanceCycleState();
}

class _MaintenanceCycleState extends State<MaintenanceCycle> {
  String _selectedItem = 'Preventive Maintenance';

  List<dynamic> MaintenanceDashboardValue = [
    {
      'icon': 'assets/svg/total_stations.svg',
      'text': 'Total Stations',
    },
    {
      'icon': 'assets/svg/total_cycles.svg',
      'text': 'Total Cycles',
    },
    {
      'icon': 'assets/svg/pm_completed.svg',
      'text': 'PM Completed',
    },
    {
      'icon': 'assets/svg/cm_requests.svg',
      'text': 'CM Requets',
    },
    {
      'icon': 'assets/svg/cm_completed.svg',
      'text': 'CM Completed',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6.0),
            ]),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  for (int i = 0; i < MaintenanceDashboardValue.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        height: 230,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(0, 1),
                              blurRadius: 15,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: SvgPicture.asset(
                                    '${MaintenanceDashboardValue[i]['icon']}',
                                    // ignore: deprecated_member_use
                                    color: Colors.white,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Text(
                              MaintenanceDashboardValue[i]['text'].toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Project Process",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Completed',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Planned',
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Overdue',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 240,
                          child: DropdownButtonFormField<String>(
                            value: _selectedItem,
                            items: <String>[
                              'Preventive Maintenance',
                              'Corrective Maintenance'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedItem = newValue!;
                              });
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 240,
                        child: DropdownButtonFormField<String>(
                          value: _selectedItem,
                          items: <String>[
                            'Preventive Maintenance',
                            'Corrective Maintenance'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
