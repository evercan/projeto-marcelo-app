import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/screens/carrocel.dart';
import 'package:namer_app/screens/dropdown_cities.dart';
import 'package:namer_app/screens/slide_pagecities.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:namer_app/views/home_screen.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Tela1 extends StatelessWidget {
  const Tela1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: const Center(
                  child: DropdownButtonCities()
                  ),                
                )
                    , 
      body:
          SlidePagecities(),
          HomeScreenView()     
      bottomNavigationBar: BottomNavigationBar(    
        currentIndex: 0,                    
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Principal',
            
            backgroundColor: Colors.black87
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Onde Ir',
            backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.unarchive_outlined),
            label: 'Utilitários',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Comprar',
            backgroundColor: Colors.blue
          )
        ]
      ),     
           
      backgroundColor: Colors.grey[300],   
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("botao foi clicado");
        }, 
        child: Icon(Icons.add),),
    );
  }
}


