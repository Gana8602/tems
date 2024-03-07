import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:route_between_two_points/utils/style.dart';

class AddStation extends StatefulWidget {
  const AddStation({super.key});

  @override
  State<AddStation> createState() => _AddStationState();
}

class _AddStationState extends State<AddStation> {
  MultiSelectController _controller = MultiSelectController();
  bool istick = false;
  String SelectedParameterType = 'Water Quality';
  List<String> parametertype = ['Water Quality'];
  String Selectedparameter = 'Water Temprature';
  List<String> parameter = [
    'Water Temprature',
    'Specific Conductance',
    'Salinity',
    'pH',
    'Dissolved Oxygen Saturation',
    'Turbidity',
    'Dissolved Oxygen',
    'tds',
    'Chlorophyll',
    'Depth',
    'Oxygen Reduction Potential',
    'External Voltage'
  ];
  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'Bhitarkanika National Park', value: '2'),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
                title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Advance Customization'),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      istick = !istick;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: istick ? Colors.blue : Colors.grey,
                            strokeAlign: 1)),
                    child: Center(
                      child: istick
                          ? Icon(
                              Icons.check,
                              color: Colors.blue,
                            )
                          : SizedBox(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'All Station',
                  style: GoogleFonts.ubuntu(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MultiSelectDropDown(
              showClearIcon: true,
              controller: _controller,
              onOptionSelected: (options) {
                debugPrint(options.toString());
              },
              options: items,
              selectionType: SelectionType.multi,
              chipConfig: const ChipConfig(wrapType: WrapType.wrap),
              dropdownHeight: 300,
              optionTextStyle: GoogleFonts.ubuntu(fontSize: 16),
              selectedOptions: istick
                  ? [
                      ValueItem(label: 'WQ 1', value: '1'),
                      ValueItem(label: 'Bhitarkanika National Park', value: '2')
                    ]
                  : [],
              showChipInSingleSelectMode: true,
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Parameter Type*'),
                Drop(SelectedParameterType, parametertype, (value) {
                  SelectedParameterType = value!;
                }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Parameter*'),
                Drop(Selectedparameter, parameter, (value) {
                  Selectedparameter = value!;
                }),
              ],
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: AppColor.Blue, strokeAlign: 1),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.ubuntu(color: AppColor.Blue),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(color: Colors.blue, strokeAlign: 1),
                      color: AppColor.Blue),
                  child: Center(
                    child: Text(
                      'Search',
                      style: GoogleFonts.ubuntu(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget Drop(
    String? selectedValue,
    List<String> list,
    void Function(String?)? onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: list.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
        ),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}
