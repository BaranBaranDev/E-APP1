import 'dart:ffi';

import 'package:eticaret/AllPage.dart';
import 'package:eticaret/components/Header.dart';
import 'package:eticaret/components/bottomNavigation.dart';
import 'package:eticaret/home.dart';
import 'package:flutter/material.dart';
    
class Categories extends StatelessWidget {


  Categories({ Key? key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    

    return Scaffold( // scaffold iskeletimiz
        body: // tasarım body kısmından sorulur :) 
        SingleChildScrollView( // Ekranın aşağıya kaydırılabilmesini sağlar
          child: SafeArea( // SafeArea sayesinde işlem yapacağımız alanı yukarıda ki bildirim batarya gibi işlevlerin gözüktüğü çubuktan uzak tutar
            child: Padding(  // tasarımın tamamında yatayda köşelerde boşluk bırakmak  için 
              padding: const EdgeInsets.symmetric(horizontal: 15), // yatayda 15 px boşluk bıraktık
              child: Column( // tasarım body kısmından sorulur tasarımımızda altalta içerikler var ilk başta column oluşturduk
                crossAxisAlignment: CrossAxisAlignment.start, // home kısmı containerdan dolayı ortaya hizalanıyordu bu şekilde  sola doğru hizaladık
                 children: [
                  HeaderandIcon("Categories",HomePage(),context), // components yani bileşenler klasörünün altında oluşturduğumuz Header dart içinde ki HeaderandIcon methodu çağrıldı başlık ve iconu tekrar tekrar kodlamayacağız.
                  SizedBox(height: 16), // boşluk bıraktık

                  createCategories("All",AllPage(),context), // hamallık gerekince fonksiyon kur!
                  createCategories("Computers", Center(),context),
                  createCategories("Smartphones", Center(),context),
                  createCategories("Accessories", Center(),context),
                  createCategories("Smart Watches", Center(),context),
                  createCategories("Monitors", Center(),context),
                  createCategories(" Cables", Center(),context),
                 ],
              ),
             ), 
            ), 
          ),
           bottomNavigationBar: createBottomBar(), // components bileşenler klasörünün altında bottomNavigation.dart dosyasının içinde createBottomBar() fonksiyonu oluşturuldu çünkü birden fazla kullanacağım bu yapıyı bundan dolayı fonksiyonunu oluşturdum
        ); 
  }
}
Widget createCategories( String title ,Widget nav,BuildContext context,){
  /*
  Aynı şeyi defalarca yapman gerekirse fonksiyon kur sabit olanlar sabit değişkenik gisterenlere ise parametre aktar
  title parametresi kategori isimlerini alacak
  BuildContext yardımıyla oluşan context sayesinde ise aşağıda ki ekran bilgisini alan yani contexte ihtiyaç duyduğumuz özellikler için oluşturduk
  Ve dikkat ettiysen fonksiyonu proje dışına oluşturduk bu durumda context oluşturmayı hatta yukarıda değişken tanımlamaları yaparsan burada çalışmayabilir
  */

  return GestureDetector( // CATEGORİES  başlıklarına tıklanabilirliği sağlar
  onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context) => nav));  // => işareti return anlamı vardır 
    },
    child: Container(
      padding: EdgeInsets.all(18), // container içi kenarlara boşluk verdik
      margin:EdgeInsets.only(bottom: 17), // kenarboşluğu, bu sayede tektek boyutlandırmaktan kurtulduk
      width:MediaQuery.of(context).size.width, // padding ile kullanılacak alan oluşturmuştuk ve ekran genişliğini alarak o alanlar dahilinde container alanı oluşturduk bunun yerine double.infinity de kullanabiliriz
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(7),
        boxShadow:[ // birden fazla gölgelendirme yapılabilinir olduğından liste alır boxShadow
          BoxShadow(
           color: Colors.black.withOpacity(0.40), /// yüzde 40 oranında koyuluk var gölgelendirmeiçin 
            offset: Offset(0,5), // gölge olarak gözüken alan uzunluğu
              ),], // BoxShadow
             ),// BoxDecoration
         child: Text(title,style: TextStyle(color: Colors.black87,fontSize: MediaQuery.of(context).size.height/35),),
                    ),
  ); // Container
}