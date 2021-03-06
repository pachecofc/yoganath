import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AndroidDropdown extends StatefulWidget {
  AndroidDropdown({@required this.sourceList});
  final List<String> sourceList;

  @override
  _AndroidDropdownState createState() => _AndroidDropdownState();
}

class _AndroidDropdownState extends State<AndroidDropdown> {
  String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.sourceList[0];
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String sourceListItem in widget.sourceList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        child: Text(sourceListItem),
        value: sourceListItem,
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedItem,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedItem = value;
        });
      },
    );
  }
}

class IosPicker extends StatelessWidget {
  IosPicker({@required this.sourceList});
  final List<String> sourceList;

  @override
  Widget build(BuildContext context) {
    List<Text> picker = [];
    for (String sourceListItem in sourceList) {
      picker.add(Text(sourceListItem));
    }

    return CupertinoPicker(
      // backgroundColor: Theme.of(context).bottomAppBarColor,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        // print(selectedIndex);
      },
      children: picker,
    );
  }
}
