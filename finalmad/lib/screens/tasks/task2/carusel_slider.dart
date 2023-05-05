import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class caruselSlider extends StatefulWidget {
  const caruselSlider({Key? key}) : super(key: key);

  @override
  State<caruselSlider> createState() => _caruselSliderState();
}

class _caruselSliderState extends State<caruselSlider> {
  List imageList = [
    {"id": 1, "image_path": 'images/f.png'},
    {"id": 2, "image_path": 'images/g.png'},
    {"id": 3, "image_path": 'images/t.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Scaffold(
        body: Column(children: [
          Stack(
            children: [
        InkWell(
        onTap: () {},
        child: CarouselSlider(
          items: imageList.map((item)=>
              Image.asset(
                item['image_path'],
                fit: BoxFit.cover,
              )
          ).toList(),
          carouselController: carouselController,
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        ),
              Positioned(
                bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry){
                        return GestureDetector(
                          onTap: (){
                            carouselController.animateToPage(entry.key);
                          },
                          child: Container(
                              width: currentIndex == entry.key ? 20:10,
                            height: 7.0,
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:currentIndex == entry.key?Colors.red:Colors.teal[200]
                            ),
                          ),
                        );
                    }).toList(),
                  ))

            ],
          )
        ],),
      ),
    );
  }
}
