import '../../../data/models/Car.dart';
import 'package:syara_finder/Shared/Componantes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/AvailableCars/FavouriteIcon.dart';

class CarDetails extends StatefulWidget {
  final Car car;
  CarDetails(this.car,);

  @override
  State<CarDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CarDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        return ListView(
          children: [
            Stack(
              children: [
                ImageSlideshow(
                  height: height * 0.4,
                  children: widget.car.images!
                      .map(
                        (e) => Image.network(
                      e.url!,
                      fit: BoxFit.cover,
                    ),
                  )
                      .toList(),
                ),
                FavouriteIconWidget(currentCar: widget.car,key: Key(widget.car.id.toString()),),

              ],
            ),
            ListTile(
              tileColor: Colors.grey[300],
              title: Text(
                widget.car.model!.modelName!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.car.model!.brand!.brandName!),
              trailing: Text(
                "\$ ${widget.car.price}",
                style: TextStyle(
                  color: HexColor("#FF8308"),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1,
                vertical: height * 0.04,
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.speed),
                        Text(" ${widget.car.carMeter}KM"),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.grey, //color of divider
                      width: 10, //width space of divider
                      thickness: 1, //thickness of divier line
                      indent: 1, //Spacing at the top of divider.
                      endIndent: 1, //Spacing at the bottom of divider.
                    ),
                    Row(
                      children: const [
                        Icon(Icons.list_alt),
                        Text(" OCC"),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.grey, //color of divider
                      width: 10, //width space of divider
                      thickness: 1, //thickness of divier line
                      indent: 1, //Spacing at the top of divider.
                      endIndent: 1, //Spacing at the bottom of divider.
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        Text(" ${widget.car.year!.yearName}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey, //color of divider
              height: 1, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 25, //spacing at the start of divider
              endIndent: 25, //spacing at the end of divider
            ),
            ListTile(
              title: const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.car.description.toString()),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildButton(
                textSize: 20,
                onTap: () {
                  openLinkOfCurrentCar(widget.car.originUrl!);
                },
                buttonText: 'Go to website',
                height: 70.h,
                width: 90.w),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }
}
