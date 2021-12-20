import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/pages/user_details/user_details.dart';
import 'package:flutter/material.dart';

import 'package:connect_proj/models/user_model.dart';

class ConnectionCard extends StatefulWidget {
  final UserModel user;
  ConnectionCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ConnectionCardState createState() => _ConnectionCardState();
}

class _ConnectionCardState extends State<ConnectionCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final date = (DateTime.now().year -
            int.parse(widget.user.birthDate!.substring(6, 10)))
        .toString();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetails(userUid: widget.user.uid!),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                width: size.width * .9,
                height: size.height * .7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.user.perfilPhoto!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size.width * .9,
                height: size.height * .7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      black.withOpacity(0.25),
                      black.withOpacity(0),
                    ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.72,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        widget.user.name! + ', ',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      date,
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                widget.user.skills!.isEmpty
                                    ? Container()
                                    : Row(
                                        children: List.generate(
                                          3,
                                          (indexSkills) {
                                            if (indexSkills == 0) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: white,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: white
                                                          .withOpacity(0.4)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3,
                                                            bottom: 3,
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(
                                                      widget.user
                                                          .skills![indexSkills],
                                                      style: TextStyle(
                                                          color: white),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: white.withOpacity(0.2),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3,
                                                          bottom: 3,
                                                          left: 10,
                                                          right: 10),
                                                  child: Text(
                                                    widget.user
                                                        .skills![indexSkills],
                                                    style:
                                                        TextStyle(color: white),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
