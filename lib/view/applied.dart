import 'package:flutter/material.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';

import '../api/Apply.dart';
import '../model/Recomndedjobs.dart';
import 'JobDescription.dart';

class Applied extends StatefulWidget {
  const Applied({Key? key}) : super(key: key);

  @override
  State<Applied> createState() => _AppliedState();
}

class _AppliedState extends State<Applied> {
  Apply a = Apply();
  @override
  void initState() {
    super.initState();
  }

  List<Recommended> jobs = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff164482)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(
            'Yours Applied jobs',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: a.Showapplyjobs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // ignore: unrelated_type_equality_checks
                if (snapshot.hasData == "No Internet Conncetion") {
                  return const Center(
                    child: Text("No Internet Conncetion"),
                  );
                }
                jobs = (snapshot.data as List<Recommended>?)!;
                if (jobs.isEmpty) {
                  return const Center(
                    child: Text("You have No bookmarks to show"),
                  );
                }
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
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
                              if (sharedPref.islog) {
                                await a.isApplied(jobs[index].id);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JobDescritpion(
                                        jobs: jobs[index],
                                        isappiled: a.isapplied,
                                        issaved: a.issaved,
                                      ),
                                    ));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JobDescritpion(
                                        jobs: jobs[index],
                                        isappiled: false,
                                        issaved: false,
                                      ),
                                    ));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 10, 7),
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
                                            jobs[index].jobTitle.toString(),
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                                color: const Color(0xff164482),
                                                fontSize: 17,
                                                fontFamily: 'Poppins'),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            jobs[index].jobTitle.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff7A7474),
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Visibility(
                                            visible:
                                                jobs[index].jobLocation == null,
                                            child: Text(
                                              jobs[index]
                                                  .jobLocation
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(0xff7A7474),
                                                  fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  jobs[index]
                                                      .jobLevel
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Color(0xffB38851),
                                                      fontSize: 15)),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                "Deadline:${jobs[index].jobDeadLine}",
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
              } else {
                return Center(child: Text("No data to show"));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
