import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// hatam oldu gereksiz kod yazdım  : ) 
Widget createProducts(String resim_adi,String urun_adi,String fiyat,Widget nav, BuildContext context){
  //ekran bilgisi ve geçişler için BuildContext  yardımıyla context oluşturdum
 // gesturedetector ile tıklanabilirlik sağladık nav parametresiylede geçiş için kodladık
  return GestureDetector(
    onTap: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => nav));
      //pushReplacement ile arkaplandan siler geçiş yapmadan önceki yeri böylece daha az ram tüketir.


    },
    child: Row(
      children: [
    
        SizedBox(
          width: MediaQuery.of(context).size.width /2.5, // genişlik
          height: MediaQuery.of(context).size.width /2,  // uzunluk        
          child: Card(
            
           color: Colors.white, // rengi 
                    elevation: 18.0, // elevation ile gölgelik 
                    shadowColor: Color.fromARGB(255, 120, 168, 207), // gölgelik rengi 
                    shape: RoundedRectangleBorder( // ovallik bırakmak için
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0), // card içinde ki ürünlerin köşeler ile aralarına boşluk bıraktık
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(resim_adi),
                            Text(urun_adi, style: TextStyle(color: Color(0xFF1F53E4),fontSize: 18),),
                            Text(fiyat, style: TextStyle(color: Color.fromARGB(255, 7, 31, 96),fontSize:MediaQuery.of(context).size.width/37,fontWeight: FontWeight.bold),),
  
                          ]),
                      ),
                      
          ),
          
        ),
       
       /// İşte benim hatam bunu eklemek oldu aynı parametreler ile kontrol sağladım dalgınlık işte ondan dolayı sağa sola aynı içerik geldi iki fonksiyon kurup en tepesisnde bir method ile birleştirebilirdim ama yorulduğum için daha düz bir kafayla gidip düzelttim.
        /*SizedBox(
          width: MediaQuery.of(context).size.width /2.5, // genişlik
          height: MediaQuery.of(context).size.width /2,  // uzunluk        
          child: Card(
           color: Colors.white, // rengi 
                    elevation: 18.0, // elevation ile gölgelik 
                    shadowColor: Color.fromARGB(255, 120, 168, 207), // gölgelik rengi 
                    shape: RoundedRectangleBorder( // ovallik bırakmak için
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(resim_adi),
                            Text(urun_adi, style: TextStyle(color: Color(0xFF1F53E4),fontSize: 18),),
                            Text(fiyat, style: TextStyle(color: Color.fromARGB(255, 7, 31, 96),fontSize: 10,fontWeight: FontWeight.bold),),
  
                          ]),
                      ),
                      
          ),
          
        ),*/
  
        
  
      ],
  
  
  
  
  
  
  
  
  
  
    ),
  );

}