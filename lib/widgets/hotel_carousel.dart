import 'package:flutter/material.dart';
import 'package:travel/models/hotel_model.dart';


class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Exclusive hotels',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )),
              GestureDetector(
                onTap: () => print('see all'),
                child: Text(
                    'See all',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    )),
              ),
            ],
          ),
        ),
        Container(
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index){
                Hotel hotel = hotels[index];
                return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 300.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom:0.0,
                          child: Container(
                              height: 120.0,
                              width: 300.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotel.name,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      hotel.address,
                                      style: TextStyle(
                                        color:Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      '\$${hotel.price} / night',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color:Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 0.2),
                                    blurRadius: 6.0,
                                  )]
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    height: 180.0,
                                    width: 280.0,
                                    image: AssetImage(hotel.imageUrl),
                                    fit : BoxFit.cover,
                                  ),
                                ),
                              ],
                            )
                        )
                      ],)
                );
              },
            )
        )
      ],
    );
  }
}
