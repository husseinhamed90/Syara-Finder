import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';

class ShimmerWidget extends StatefulWidget {
  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 255, 184, 92),
      highlightColor: const Color.fromARGB(255, 255, 116, 23),
      direction: ShimmerDirection.ltr,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 30,
                      child: Container(
                        width: 180,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft:
                                Radius.circular(20),
                                topRight:
                                Radius.circular(20))),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10),
                        width: 180,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft:
                                Radius.circular(30),
                                bottomRight:
                                Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 8),
                            Container(
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            Container(
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            Container(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
