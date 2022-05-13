import 'package:flutter/material.dart';

Widget pharmacyWidget(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    color: Colors.blueAccent,
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(10),
    width: size.width * .7,
    child : Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius : BorderRadius.circular(15),
            color: Colors.red
          ),
          width: size.width * .3,
          height: size.height * .2,
        ),
        Container(
          width: size.width * .3,
            height: size.height * .2,
            color: Colors.green,
            padding: EdgeInsets.only(left: 10),
            child:Column(
          children: [
            Text('Pharmacie ', style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            Text('Gerant:',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            Text('Service:',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              color: Colors.red,
              width: size.width * .3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 1),
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: Row(
                      children: const [
                        Icon(Icons.location_city, size: 10,),
                        Text(
                          "VOIR LA CARTE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),

                        ),
                      ],
                    )),
              ),
            ),
          ],
        ))

      ],
    )
  ) ;
}
