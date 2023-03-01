// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:kaamkaaz/api/Apply.dart';
import 'package:kaamkaaz/api/Searchapi.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';
import 'package:kaamkaaz/api/recomndedjobsApi.dart';
import 'package:kaamkaaz/model/Recomndedjobs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaamkaaz/view/JobDescription.dart';
import 'package:kaamkaaz/view/Search%20job.dart';
import 'package:kaamkaaz/view/SelectJobCategory.dart';
import '../api/Connection.dart';
import '../api/JobCategory.dart';

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  void initState() {
    save.saved = [];
    save.EmploymentType = null;
    SearchSavedjobs.isFilterapply = false;
    super.initState();
  }

  Apply apply = Apply();
  search se = search();
  bool sufixicon = false;
  List<Recommended> jobs = [];
  bool checkedValue = false;
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    save.saved = [];
    save.EmploymentType = null;
    SearchSavedjobs.isFilterapply = false;
    save.savedId = [];
    save.saved = [];

    double height = MediaQuery.of(context).size.height * 0.5;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        children: [
          Image.asset(
            'assets/kamkaaz.png',
            height: 55,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 2,
          ),
          const Align(
            child: Text('    Search a  job',
                style: TextStyle(fontSize: 19, fontFamily: 'Poppins')),
            alignment: Alignment.topLeft,
          ),
          const SizedBox(
            height: 1,
          ),
          TextField(
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
                  child: IconButton(
                      hoverColor: Colors.transparent,
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        sufixicon = false;
                      }),
                  visible: sufixicon,
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
              onTap: () async {
                FocusScope.of(context).unfocus();
                SearchSavedjobs.jobs = jobs;
                APiJObCategory.getjobs();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchJob()),
                );
              }),
          Expanded(
            child: FutureBuilder(
                future: listOfJobs.getjobs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      if (snapshot.data == "no Internet") {
                        return const Center(
                          child: Text("No internet"),
                        );
                      } else {
                        jobs = (snapshot.data as List<Recommended>?)!;
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: jobs.length,
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
                                      await Connection
                                          .CheckInternetConncetion();

                                      if (sharedPref.islog) {
                                        if (Connection.connection) {
                                          await apply.isApplied(jobs[index].id);
                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    JobDescritpion(
                                                  jobs: jobs[index],
                                                  isappiled: apply.isapplied,
                                                  issaved: apply.issaved,
                                                ),
                                              ));
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:
                                                "you have no internet conncetion ",
                                          );
                                        }
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  JobDescritpion(
                                                jobs: jobs[index],
                                                isappiled: false,
                                                issaved: false,
                                              ),
                                            ));
                                      }
                                    },
                                    child: IgnorePointer(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 15, 10, 7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  minWidth: 44,
                                                  minHeight: 80,
                                                  maxWidth: 64,
                                                  maxHeight: 90,
                                                ),
                                                child: Image.network(
                                                  'http://kaamkaaz.com.np/jobBanners/${jobs[index].UserThumbnail}',
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
                                                      jobs[index]
                                                          .jobTitle
                                                          .toString(),
                                                      // ignore: prefer_const_constructors
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xff164482),
                                                          fontSize: 17,
                                                          fontFamily:
                                                              'Poppins'),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      jobs[index]
                                                          .jobLevel
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff7A7474),
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      jobs[index]
                                                          .jobLocation
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff7A7474),
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
                                                            jobs[index]
                                                                .jobLevel
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xffB38851),
                                                                fontSize: 15)),
                                                        const SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "Deadline:${jobs[index].jobDeadLine}",
                                                          // ignore: prefer_const_constructors
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
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
                                ),
                              );
                            });
                      }
                    } else {
                      return const Center(
                        child: Text("No Data found"),
                      );
                    }
                  }
                }),
          ),
        ],
      ),
    ));
  }
}
