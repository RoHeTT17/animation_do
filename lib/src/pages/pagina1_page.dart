import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';


class Pagina1Page extends StatelessWidget {
 
  const Pagina1Page({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElasticInLeft(child: const Text('Animate_do')),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.twitter),
            onPressed: (){
           
            },
          ),

          SlideInLeft(
            from: 100,
            child: IconButton(
              icon: const FaIcon(Icons.navigate_next),
              onPressed: (){
                   //Navigator.push(context, CupertinoPageRoute(builder: (context) => Pagina1Page(),));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TwitterPage(),));
              },
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,   
         children: [

           ElasticIn(
            duration: const Duration(milliseconds: 1100),
            child: const Icon(Icons.new_releases, color: Colors.blue, size: 40)
           ),

           FadeInDown(
            delay: const Duration(milliseconds: 2000),
            child: const Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),)
           ),

           FadeInDown(
            delay: const Duration(milliseconds: 3000),
            child: const Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),)
           ),

           FadeInLeft(
            delay: const Duration(milliseconds: 3500),
             child: Container(
              width: 200,
              height: 2,
              color: Colors.blue,
             ),
           )
         ],

        ),
      ),

     floatingActionButton: ElasticInRight(
       child: FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.play),
        onPressed: () {
               Navigator.push(context, CupertinoPageRoute(builder: (context) => NavegacionPage(),));
        },
       ),
     ),
   );
  }
}