import 'package:flutter/material.dart';

class TrendingCategoriesSection extends StatelessWidget {
  const TrendingCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black54,
      ),
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                height: 28,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(5), // Correct way to apply border radius
                ),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Music',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),


                  const SizedBox(width: 15),
                  Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(5), // Correct way to apply border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Health',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5), // Correct way to apply border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Holiday',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5), // Correct way to apply border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sports',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),


                  const SizedBox(width: 15),
                  Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5), // Correct way to apply border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Food & Drink',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5), // Correct way to apply border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Movies & Series',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                ],
              ),

            ],
          )// Add space between text and other content



    );
  }
}