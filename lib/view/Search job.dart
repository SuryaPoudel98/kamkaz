import 'package:flutter/material.dart';

import 'package:kaamkaaz/api/Apply.dart';
import 'package:kaamkaaz/api/Searchapi.dart';
import 'package:kaamkaaz/model/Recomndedjobs.dart';
import 'package:kaamkaaz/view/SelectJobCategory.dart';

import '../api/Connection.dart';
import '../api/JobCategory.dart';
import 'Dailogshow.dart';
import 'JobDescription.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class SearchSavedjobs {
  static List<Recommended> jobs = [];
  static List<Recommended> jobs1 = jobs;
  static search s = search();

  static Future<List<Recommended>> getList() async {
    return jobs;
  }

  static bool isFilterapply = false;
}

class SearchJob extends StatefulWidget {
  SearchJob({
    super.key,
  });

  @override
  State<SearchJob> createState() => _SearchJobState();
}

class _SearchJobState extends State<SearchJob> {
  search se = search();
  setsearchjob(String s) async {
    SearchSavedjobs.jobs = await se.serchjobs(s);
    setState(() {});
  }

  Future SearchFilter() async {
    SearchSavedjobs.jobs = await se.SearchwithFilter(
        sear, save.savedId, save.EmploymentType, save.sortby);
    setState(() {
      print("im in set state");
    });
  }

  String? sear;
  bool sufixicon = false;
  Apply apply = Apply();
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).size.height * 0.75;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Search Jobs",
          style: TextStyle(color: Color(0xffB38851)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 40, 0),
              child: TextField(
                autofocus: true,
                controller: t1,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xffFDF7F7),
                  hintText: 'serch for your ideal job',
                  hintStyle:
                      const TextStyle(color: Color(0xffAA9F9F), fontSize: 14.0),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  suffixIcon: Visibility(
                    visible: sufixicon,
                    child: IconButton(
                        hoverColor: Colors.transparent,
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          sufixicon = false;
                        }),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffFDF7F7)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffFDF7F7)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (String s) {
                  if (s.isEmpty) {
                    SearchSavedjobs.jobs = SearchSavedjobs.jobs1;
                    setState(() {});
                  }
                  sear = s;
                  setsearchjob(s);
                  setState(() {});
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () async {
                    setState(() {});
                    Connection.CheckInternetConncetion();

                    APiJObCategory.getjobs();
                    Connection.connection
                        ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                  builder: (stfContext, stfSetState) {
                                return Dialog(
                                  insetPadding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.65),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  elevation: 4,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  save.saved = [];
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("cancel")),
                                            const Text(
                                              "Search filter",
                                              style: TextStyle(
                                                  color: Color(0xffB38851)),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  print(save.EmploymentType);
                                                  print(save.savedId);
                                                  if (save.EmploymentType ==
                                                          null &&
                                                      save.savedId.isEmpty &&
                                                      save.sortby == 0) {
                                                    print("im on one null");
                                                    Navigator.pop(context);
                                                  } else {
                                                    SearchFilter();
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: const Text("Done")),
                                          ],
                                        ),
                                        ShowDialog()
                                      ],
                                    ),
                                  ),
                                );
                              });
                            })
                        : Fluttertoast.showToast(
                            msg: "you have no internet conncetion ",
                          );
                  },
                  icon: const Icon(Icons.more)),
            )
          ]),
          SearchSavedjobs.jobs.isEmpty
              ? const Center(child: Text("No jobs to show"))
              : Flexible(child: FutureBuilder(builder: (context, snapshot) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: SearchSavedjobs.jobs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Color(0xffB38851),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 1,
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () async {
                                if (sharedPref.islog) {
                                  await apply.isApplied(
                                      SearchSavedjobs.jobs[index].id);
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JobDescritpion(
                                          jobs: SearchSavedjobs.jobs[index],
                                          isappiled: apply.isapplied,
                                          issaved: apply.issaved,
                                        ),
                                      ));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JobDescritpion(
                                          jobs: SearchSavedjobs.jobs[index],
                                          isappiled: false,
                                          issaved: false,
                                        ),
                                      ));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 15, 10, 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 80,
                                          maxWidth: 64,
                                          maxHeight: 90,
                                        ),
                                        child: Image.network(
                                          'http://kaamkaaz.com.np/jobBanners/${SearchSavedjobs.jobs[index].UserThumbnail}',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Text(
                                              SearchSavedjobs
                                                  .jobs[index].jobTitle
                                                  .toString(),
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff164482),
                                                  fontSize: 17,
                                                  fontFamily: 'Poppins'),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              SearchSavedjobs
                                                  .jobs[index].jobLevel
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(0xff7A7474),
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              SearchSavedjobs
                                                  .jobs[index].jobLocation
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(0xff7A7474),
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    SearchSavedjobs
                                                        .jobs[index].jobLevel
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffB38851),
                                                        fontSize: 15)),
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  "Deadline:${SearchSavedjobs.jobs[index].jobDeadLine}",
                                                  // ignore: prefer_const_constructors
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: const Color(
                                                          0xffB38851)),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                })),
        ]),
      ),
    );
  }
}
