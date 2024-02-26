import 'package:flutter/material.dart';
import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/bool/bool_values.dart';
import 'package:route_between_two_points/controllers/report_Controller.dart';
import 'package:route_between_two_points/pages/Drawer_right/drawer_right.dart';
import 'package:route_between_two_points/pages/Drawer_right/filter_drawer.dart';
import 'package:route_between_two_points/pages/reports/widget/report_data.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';
import 'package:route_between_two_points/pages/widget/float_Button.dart';

class ExpandableTableExample extends StatefulWidget {
  const ExpandableTableExample({super.key});

  @override
  State<ExpandableTableExample> createState() => _ExpandableTableExampleState();
}

class _ExpandableTableExampleState extends State<ExpandableTableExample> {
  final ReportController controller = Get.put(ReportController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final BoolValues value; // Declare BoolValues variable

  @override
  void initState() {
    super.initState();
    value = Get.put(BoolValues(context));
    value.setContext(context); // Set context after initializing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Head(context),
      floatingActionButton: const FloatButton(),
      endDrawer: value.showFilterDrawer.value ? FilterDrawer() : DrawerRight(),
      // ignore: prefer_const_constructors
      drawer: Drawerleft(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const Text('Reports', style: TextStyle(fontSize: 20)),
          const Row(
            children: [Text('Home | '), Text('Reports')],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              await BoolValues(context).toggleDrawer('filter');
              Future.delayed(const Duration(microseconds: 200), () {
                _scaffoldKey.currentState!.openEndDrawer();
              });
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: const Center(
                  child: Text(
                '+ Filter',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Water Quality',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4,
              )
            ]),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Search'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  )
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                    child: Icon(
                  Icons.filter_alt_outlined,
                  size: 17,
                )),
              ),
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                    child: Icon(
                  Icons.file_download_outlined,
                  size: 17,
                )),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text('10 items >'),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                width: MediaQuery.of(context).size.width,
                child: ExpandableTheme(
                  data: ExpandableThemeData(
                    context,
                    // headerColor: Colors.blue,
                    // oddRowColor: Colors.grey.withOpacity(0.3),
                    evenRowColor: Colors.grey.withOpacity(0.8),
                    rowBorder: const BorderSide(color: Colors.amber),
                    expandedBorderColor: Colors.transparent,
                    paginationSize: 40,
                    rowTextMaxLines: 1,

                    expansionIcon: Image.asset('assets/image/add.png'),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                  ),
                  child: ExpandableDataTable(
                    rows: ReportData().rows,
                    headers: ReportData().headers,
                    multipleExpansion: false,
                    visibleColumnCount: 3,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
