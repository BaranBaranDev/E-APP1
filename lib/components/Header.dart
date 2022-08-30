import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

Widget HeaderandIcon(String title,Widget nav ,BuildContext context,){ // build dışında olduğunda context ile ilgili hata alırsan çekinme oluştur 
 //nav parametresiyle gitmek istediğimiz sayfayı belirliyoruz (Wisdget nav) oluşturdum fakat sildim  Navigator.pop(context); // geldiği sayfaya geri döner zaten ama bunun ramde ki tüketim oranını araştır

  return Column( // tasarım body kısmından sorulur tasarımımızda altalta içerikler var ilk başta column oluşturduk
                crossAxisAlignment: CrossAxisAlignment.start, // home kısmı containerdan dolayı ortaya hizalanıyordu bu şekilde  sola doğru hizaladık
                 children: [
                  SizedBox(height: 22), // 22 pixel boşluk bıraktık
                  GestureDetector( // Geri iconuna tıklanabilirlik verdik
                    child: Icon(Icons.keyboard_backspace_outlined,size:MediaQuery.of(context).size.width/10 ),// geri ikconu oluşturuldu ve ekran genişliğine göre oranlandırıldı
                    onTap:(){ // onTap kapsamında geçiş yapacağımız sayfayı belirtiyoruz
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => nav));
                      //Navigator.pop(context); // geldiği sayfaya geri döner 
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => nav));
                      //pushReplacement ile arkaplandan siler geçiş yapmadan önceki yeri böylece daha az ram tüketir.
                    },
                    ), 
                  SizedBox(height: 23), // boşluk bıraktık
                  Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height/20),),
                 ]
  ); 
}