
import 'package:flutter/material.dart';
import 'package:tik_fest/presentation/ui/widgets/home_banner_slider.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TikFest',style: TextStyle(color: Colors.blueGrey),),
      ),
      body: Column(

        children: [
          SizedBox(height: 8,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(child:HomeBannerSlider()),
              )


        ],
      )


    );
  }
}
