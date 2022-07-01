import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NavegacionPage extends StatelessWidget {
 
  const NavegacionPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Notificaciones Page"),
        ),
    
       floatingActionButton: _BotonFlotante(),
       bottomNavigationBar: _BottonNavigation(),
       ),
    );
  }
}

class _BottonNavigation extends StatelessWidget {
  const _BottonNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cantNotificaciones = Provider.of<_NotificationModel>(context).getNumero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor:  Colors.amber,
      items: [
         const BottomNavigationBarItem(
          label: 'Bones', 
          icon: FaIcon(FontAwesomeIcons.bone)
         ),

         BottomNavigationBarItem(
          label: 'Notifications', 
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              
              Positioned(
                top: 0,
                right: 0,
                //se quita el icono, porque no se podrian agregar el número de notificaciones
                //child: Icon(Icons.brightness_1,size: 8, color: Colors.amber,)
                child: BounceInDown(
                  from: 10,
                  animate:  (cantNotificaciones>0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).setBounceController = controller,
                    child: Container(
                      child: Text("$cantNotificaciones", style: TextStyle(color: Colors.white,fontSize: 8),),
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),

              )
            
            ],
          )
         ),

         const BottomNavigationBarItem(
          label: 'My Dog', 
          icon: FaIcon(FontAwesomeIcons.dog)
         ),
      ],

    );
  }
}

class _BotonFlotante extends StatelessWidget {
  const _BotonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.amber,
      onPressed: (){

          final notificacion = Provider.of<_NotificationModel>(context,listen:false);

          notificacion.setNumero = notificacion.getNumero+1;

          if(notificacion.getNumero >=2){
            notificacion.getBounceController.forward(from: 0);
          }

      }
    );
  }
}

class _NotificationModel extends ChangeNotifier{

  int _numero = 0;
  late AnimationController _bounceController;

  int get getNumero => this._numero;

  set setNumero(int value){

    _numero = value;
    
    notifyListeners();

  }

  AnimationController get getBounceController => this._bounceController;

  set setBounceController(AnimationController value){
    this._bounceController = value;
    //notifyListeners();
  }

}