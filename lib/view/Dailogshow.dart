// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kaamkaaz/api/Searchapi.dart';
import 'package:kaamkaaz/view/Search%20job.dart';
import 'package:kaamkaaz/view/homes.dart';

import '../model/Recomndedjobs.dart';
import 'Home.dart';
import 'SelectJobCategory.dart';

class ShowDialog extends StatefulWidget {
  ShowDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  bool oldest = false;
  bool newsest = true;
  final List<String> _texts = [
    "Newest",
    "Oldest",
  ];
  List<String> list = <String>[
    'Full Time',
    'PartTime',
    'Contract',
    'Temporary',
    'Internship'
  ];
  late String dropdownValue = list.first;

  String? EmploymentType;
  List<Recommended> jobs = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController t1 = new TextEditingController();

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text("Sort By:"),
            const SizedBox(
              width: 8,
            ),
            Checkbox(
                value: newsest,
                onChanged: (value) {
                  setState(() {
                    newsest = value!;
                    oldest = false;
                    save.sortby = 0;
                  });
                }),
            Text(_texts.last),
            const SizedBox(
              width: 30,
            ),
            Checkbox(
                value: oldest,
                onChanged: (value) {
                  setState(() {
                    oldest = value!;
                    newsest = false;
                    save.sortby = 1;
                  });
                }),
            Text(_texts.first),
          ],
        ),
        const Divider(
          height: 1,
        ),
        const Divider(
          height: 1,
        ),
        InkWell(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectJobCategory()),
            );
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: 50,
                child: Row(
                  children: const [
                    Icon(Icons.cabin_sharp),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Job catergory"),
                  ],
                ),
              ),
              const Icon(Icons.arrow_right_sharp)
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        DropdownButton(
          value: save.EmploymentType,
          isExpanded: true,
          onChanged: (String? value) {
            setState(() {
              save.EmploymentType = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ));
          }).toList(),
          hint: Row(
            children: const [Icon(Icons.category), Text("Employment Type")],
          ),
        ),
        TextButton(
          child: const Text(
            "Reset filter",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            newsest = true;
            oldest = false;
            save.savedId = [];
            save.EmploymentType = null;
            setState(() {});
          },
        )
      ],
    );
  }
}
