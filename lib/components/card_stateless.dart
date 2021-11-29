import 'package:flutter/material.dart';
import 'package:odyssey/model/destination.dart';
import 'package:odyssey/pages/picked_explore.dart';

class CardStateless extends StatelessWidget {
  final List<Destination> destination;
  const CardStateless({required this.destination});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: destination.length,
            itemBuilder: (context, index) {
              final item = destination[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Taping ${item.name} with id ${item.id}');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PickedExplore(id: item.id)));
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
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                  Text(
                                      "${item.type} | ${item.activityLevel} | rating: ${item.rating}",
                                      style: TextStyle(
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
    //   return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: destination.length,
    //     itemBuilder: (context, index) {
    //       final item = destination[index];

    //       return ListTile(
    //         title: Row(
    //           children: [
    //             SizedBox(
    //               width: 100,
    //               child: Image.network(item.photo)
    //             ),
    //             Flexible(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(children: [
    //                   Text(item.name)
    //                 ],),
    //               ),
    //             )
    //           ],
    //         ),

    //     );
    // });
  }
}
