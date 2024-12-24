import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eventcard extends StatelessWidget {
  const Eventcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,

      width:220,

      child: Stack(
        children: [
          Positioned(
            bottom: 50,
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xff303030),
                borderRadius: BorderRadius.circular(20)
                ,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 130),
                    const Text(
                      'Darshan Stage Show in Rajshahi City',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Directly seated and inside for you to enjoy the show.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 20,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.confirmation_num,
                            color: Colors.white, size: 10),
                        label: const Text(
                          'Buy Ticket',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            child: Image.asset(
              'assets/images/darshan.png',
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),


    );
  }
}