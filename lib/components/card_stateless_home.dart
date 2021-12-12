import 'package:flutter/material.dart';
import 'package:odyssey/model/destination.dart';
import 'package:odyssey/pages/picked_explore.dart';

class CardStatelessHome extends StatefulWidget {
  final List<Destination> destination;
  final String userId;
  // ignore: use_key_in_widget_constructors
  const CardStatelessHome({required this.destination, required this.userId});

  @override
  State<CardStatelessHome> createState() => _CardStatelessHomeState();
}

class _CardStatelessHomeState extends State<CardStatelessHome>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.destination.length,
            itemBuilder: (context, index) {
              final item = widget.destination[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PickedExplore(
                                    id: item.id,
                                    userId: widget.userId,
                                  )));
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: ClipRRect(
                                child: Image.network(item.photo),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(item.name,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                  Text(
                                      "${item.type} | ${item.activityLevel} | rating: ${item.rating}",
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black,
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
