import 'package:eticaret/Categories.dart';
import 'package:eticaret/ProductDetailPage.dart';
import 'package:eticaret/components/Header.dart';
import 'package:eticaret/components/bottomNavigation.dart';
import 'package:eticaret/components/products.dart';
import 'package:flutter/material.dart';
    
class AllPage extends StatefulWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Ekranın aşağıya kaydırılabilmesini sağlar
          child: SafeArea( // SafeArea sayesinde işlem yapacağımız alanı yukarıda ki bildirim batarya gibi işlevlerin gözüktüğü çubuktan uzak tutar
            child: Padding(  // tasarımın tamamında yatayda köşelerde boşluk bırakmak  için 
              padding: const EdgeInsets.symmetric(horizontal: 16), // yatayda 16 px boşluk bıraktık
              child: Column( // tasarım body kısmından sorulur tasarımımızda altalta içerikler var ilk başta column oluşturduk
                crossAxisAlignment: CrossAxisAlignment.start, // home kısmı containerdan dolayı ortaya hizalanıyordu bu şekilde  sola doğru hizaladık
                 children: [
                  HeaderandIcon("All",Categories(),context),
                  /// Izgara görünümülü liste için gridview kullanacağım
                  SizedBox(height: 24),
                  Row
                  (children: [ // \$ ile dolar işaretini ekranda gösterebilirsin
                  createProducts("images/air.png", "Macbook Air", " \$800",ProductDetailPage(urun_adi:  "Macbook Air" , resim_adi: "images/air.png",), context), /// ürünleri içeren methodum
                  Spacer(),
                  createProducts("images/mini.png", "Iphone 13 Mini", " \$500",ProductDetailPage(urun_adi:  "Iphone 13 Mini" ,resim_adi: "images/mini.png",), context),

                 
                  ],),

                
                  Row( 
                    children: [
                      createProducts("images/laptop.png", "Macbook Pro 14", " \$1100",ProductDetailPage(urun_adi:   "Macbook Pro 14" ,resim_adi: "images/laptop.png",), context),
                       Spacer(),
                      createProducts("images/mobil.png", "Iphone 13 Pro", "\$1000",ProductDetailPage(urun_adi: "Iphone 13 Pro",resim_adi: "images/mobil.png",), context),
                    ],
                  ),

                  Row(
                    children: [
                      createProducts("images/kılıf.png", "Iphone Deri Kılıf", " \$50",ProductDetailPage(urun_adi:"Iphone Deri Kılıf"  ,resim_adi: "images/kılıf.png",), context),
                      Spacer(),
                      createProducts("images/airpods.png", "Airpods Pro ", " \$150",ProductDetailPage(urun_adi: "Airpods Pro ",resim_adi: "images/airpods.png",), context),
                    ], // geçiş yapacağımız sayfa için parantez açıp gideceğimiz sayfaya veri transferinde bulunduk yapı çok basit
                    /*
                    Geçtiğimiz sayfada class hemen altında boş değişken oluşturduk ardından örüneceği kısma widget yardımıyla aktarım yapıldı 
                    daha sonra veriyi alacağı sayfada geçiş sayfası  parantezleri içine değişkenler eşitlendi..
                     */
                  ),
                  
                 
                 
                  
                  
                 ],
                ),
             ),
            ),
         ),

         /// Body kısmının dışına daha önce oluşturulan bottomNavigationBar içeren  widgetini çağıracağım
         bottomNavigationBar: createBottomBar(),
    );
  }
}









