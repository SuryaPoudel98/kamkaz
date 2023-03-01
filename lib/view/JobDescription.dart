// ignore_for_file: file_names, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kaamkaaz/api/Apply.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';
import 'package:kaamkaaz/model/Recomndedjobs.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class JobDescritpion extends StatefulWidget {
  Recommended jobs;
  bool isappiled;
  bool issaved;
  JobDescritpion(
      {Key? key,
      required this.jobs,
      required this.isappiled,
      required this.issaved})
      : super(key: key);
  @override
  State<JobDescritpion> createState() => _JobDescritpionState();
}

class _JobDescritpionState extends State<JobDescritpion> {
  Apply apply = Apply();
  @override
  Widget build(BuildContext context) {
    widget.jobs.jobBanner ??= "defaultbanner.jpg";
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff164482)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            widget.jobs.jobTitle.toString(),
            style: const TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
              onPressed: () {
                if (sharedPref.islog) {
                  if (widget.issaved) {
                    apply.deletejobs(widget.jobs.id);
                    setState(() {
                      widget.issaved = false;
                    });
                  } else {
                    apply.savedjobs(widget.jobs.id);
                    setState(() {
                      widget.issaved = true;
                    });
                  }
                } else {
                  Fluttertoast.showToast(
                    msg: "plase login to save and apply for job ",
                  );
                }
              },
              icon: !widget.issaved
                  ? const Icon(
                      Icons.bookmark_border_outlined,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.bookmark_added,
                      color: Color(0xffB38851),
                    ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 58, 55, 55)
                              .withOpacity(0.8),
                          BlendMode.color),
                      child: Opacity(
                        opacity: 0.7,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          imageUrl:
                              "http://kaamkaaz.com.np/jobBanners/${widget.jobs.jobBanner}",
                          // ignore: avoid_unnecessary_containers
                          placeholder: (context, url) => Container(
                            child: Image.asset(
                              'assets/kamkaaz.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            height: 90,
                            width: 85,
                            imageUrl:
                                "http://kaamkaaz.com.np/jobBanners/${widget.jobs.UserThumbnail ?? "thumbnail.jpg"}",
                            // ignore: avoid_unnecessary_containers
                            placeholder: (context, url) => Container(
                              child: Image.asset(
                                'assets/kamkaaz.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: <Widget>[
                                  // Stroked text as border.
                                  Text(
                                    widget.jobs.jobTitle.toString(),
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color = Colors.white12,
                                    ),
                                  ),
                                  // Solid text as fill.
                                  Text(
                                    widget.jobs.jobTitle.toString(),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Icon(
                                    Icons.av_timer_outlined,
                                    color: Color(0xffC59C69),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.jobs.jobDeadLine.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 1
                                        ..color = const Color.fromARGB(
                                            255, 228, 236, 228),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.jobs.jobTitle.toString(),
                        style: const TextStyle(
                            color: Color(0xff164482), fontFamily: 'Poppins'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            color: Color(0xffC59C69),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "${widget.jobs.noOfVacancy}  Vacancy",
                            style: const TextStyle(
                                color: Color(0xff7A7474),
                                fontSize: 13,
                                fontFamily: 'Poppins'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Visibility(
                        visible: widget.jobs.jobLocation != null,
                        child: Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                color: Color(0xffC59C69)),
                            const SizedBox(
                              width: 7,
                            ),
                            Flexible(
                              child: Text(
                                widget.jobs.jobLocation.toString(),
                                style: const TextStyle(
                                    color: Color(0xff7A7474),
                                    fontSize: 13,
                                    fontFamily: 'Poppins'),
                                softWrap: true,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.attach_money,
                              color: Color(0xffC59C69)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            widget.jobs.offeredSalary.toString(),
                            style: const TextStyle(
                                color: Color(0xff7A7474),
                                fontSize: 13,
                                fontFamily: 'Poppins'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Skills Required',
                        style: TextStyle(
                            color: Color(0xff164482),
                            fontSize: 17,
                            fontFamily: 'Poppins'),
                      ),
                      Html(
                        data:
                            widget.jobs.professionalSkillRequired ?? "<p> <p>",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Job Description',
                        style: TextStyle(
                            color: Color(0xff164482),
                            fontSize: 17,
                            fontFamily: 'Poppins'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Html(
                        data: widget.jobs.jobDescription ?? "<p> <p>",
                      ),
                      Visibility(
                        visible: sharedPref.islog,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Color(0xff164482),
                                    width: 1,
                                    style: BorderStyle.solid)),
                            onPressed: () {
                              if (widget.isappiled) {
                              } else {
                                apply.apply(widget.jobs.id);
                                widget.isappiled = true;
                                setState(() {});
                              }
                            },
                            color: const Color(0xff164482),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.isappiled ? 'Applied' : 'apply',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue,
                                        fontFamily: 'Poppins'),
                                  ),
                                  Visibility(
                                    visible: !widget.isappiled,
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
