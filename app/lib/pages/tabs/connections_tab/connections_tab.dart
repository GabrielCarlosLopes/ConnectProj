import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/controller/home_controller/home_controller.dart';

class ConnectionTab extends StatefulWidget {
  final HomeController homeController;
  ConnectionTab({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  _ConnectionTabState createState() => _ConnectionTabState();
}

class _ConnectionTabState extends State<ConnectionTab> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return StreamBuilder<QuerySnapshot>(
      stream: widget.homeController.response(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        widget.homeController.setPeoples(snapshot.data!.docs);

        final controller = widget.homeController;

        if (controller.peoplesList.isEmpty) {
          Size size = MediaQuery.of(context).size;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.user!.definition == 0
                  ? Center(
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
                          child: Container(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Buscando Novos Realizadores',
                                  style: GoogleFonts.nunitoSans(color: white),
                                ),
                                SizedBox(height: 50),
                                Center(
                                  child:
                                      CircularProgressIndicator(color: green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
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
                          child: Container(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Buscando Novos Idealizadores',
                                  style: GoogleFonts.nunitoSans(color: white),
                                ),
                                SizedBox(height: 50),
                                Center(
                                  child:
                                      CircularProgressIndicator(color: green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          );
        }

        return Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SwipeableCardsSection(
                cardController: _cardController,
                context: context,
                items: controller.peoplesWidget,
                onCardSwiped: (dir, index, widget) {
                  if (counter != 1) {
                    Size size = MediaQuery.of(context).size;
                    _cardController.addItem(
                      Center(
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
                            child: Container(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Buscando Novos Usuários',
                                    style: GoogleFonts.nunitoSans(color: white),
                                  ),
                                  SizedBox(height: 50),
                                  Center(
                                    child:
                                        CircularProgressIndicator(color: green),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                    counter++;
                  }

                  if (dir == Direction.left) {
                    controller.onDislike();
                  } else if (dir == Direction.right) {
                    controller.onLike(controller.peoplesList[0].uid!);
                  }
                },
                enableSwipeUp: false,
                enableSwipeDown: false,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _cardController.triggerSwipeLeft();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: blue, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () => _cardController.triggerSwipeRight(),
                        icon: SvgPicture.asset('assets/space.svg'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
      },
    );
  }
}
