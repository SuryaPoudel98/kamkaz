import 'package:flutter/material.dart';
import '../api/JobCategory.dart';
import '../model/JobCategory.dart';
import 'Dailogshow.dart';

class save {
  static List<JobCategoryModel> ListofJobCategory = APiJObCategory.jsonresponse;
  static List<bool> saved = [];
  static List<int> savedId = [];
  static int sortby = 0;
  static late String s;
  static List<bool> getSaved() {
    if (saved.isEmpty) {
      for (int i = 0; i <= ListofJobCategory.length - 1; i++) {
        saved.add(false);
      }
      return saved;
    } else {
      return saved;
    }
  }

  static String? EmploymentType;
}

class SelectJobCategory extends StatefulWidget {
  const SelectJobCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectJobCategory> createState() => _SelectJobCategoryState();
}

class _SelectJobCategoryState extends State<SelectJobCategory> {
  @override
  void initState() {
    super.initState();
  }

  List<JobCategoryModel> ListofJobCategory = APiJObCategory.jsonresponse;
  List<bool> checked = save.getSaved();

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List<int> Selectedhere = [];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, size: 20, color: Color(0xff164482)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Search Filter",
                style: TextStyle(
                    color: Colors.blue, fontSize: 16, fontFamily: 'Poppins'),
              ),
            ),
            const Text(
              "Job Filters       ",
              style: TextStyle(
                  color: Color(0xffB38851),
                  fontSize: 16,
                  fontFamily: 'Poppins'),
            ),
            TextButton(
              onPressed: () {
                save.savedId = [];
                save.saved = checked;
                for (int i = 0; i <= save.saved.length - 1; i++) {
                  if (save.saved[i]) {
                    save.savedId.add(ListofJobCategory[i].id);
                  }
                }
                print(save.savedId);
                Navigator.pop(context);
              },
              child: const Text(
                "Done",
                style: TextStyle(
                    color: Colors.blue, fontSize: 16, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xffEFEDED),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      for (int i = 0; i <= ListofJobCategory.length - 1; i++) {
                        checked[i] = true;
                      }
                      setState(() {});
                    },
                    child: const Text(
                      "Select All",
                      style: TextStyle(
                          color: Color(0xffB38851),
                          fontSize: 16,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      for (int i = 0; i <= ListofJobCategory.length - 1; i++) {
                        checked[i] = false;
                      }
                      setState(() {});
                      save.savedId = [];
                    },
                    child: const Text(
                      "Clear All",
                      style: TextStyle(
                          color: Color(0xffB38851),
                          fontSize: 16,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                          ListofJobCategory[index].jobCatetoryname.toString()),
                      trailing: Checkbox(
                        onChanged: ((value) {
                          setState(() {
                            checked[index] = value!;
                          });
                        }),
                        value: checked[index],
                      ),
                    ),
                    const Divider(
                      height: 2,
                    )
                  ],
                );
              },
              itemCount: ListofJobCategory.length,
            ),
          )
        ],
      )),
    );
  }
}
