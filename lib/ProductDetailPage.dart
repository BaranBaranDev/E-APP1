

import 'package:eticaret/AllPage.dart';
import 'package:eticaret/components/Header.dart';
import 'package:eticaret/components/bottomNavigation.dart';
import 'package:flutter/material.dart';
    
class ProductDetailPage extends StatefulWidget { // tıklanınca değişikler olabilir diye statefulwidget kullandım.

 // dİğer sayfadan veri çekmek için açıldığında parametreler oluşmalı
 

 String? urun_adi;
 String resim_adi;
 ProductDetailPage({required this.urun_adi,required this.resim_adi}) ; // karşı taraftan veri alınacağı zaman rwquried gerekiyor constructor da 
 
 
 
 

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  

 
  int selectedCapacity = 512;
  List<int>capacities = [128,256,512] ; // int değerleri içeren capacities adında liste oluşturuldu burada ürünlerin detay sayfasında bulunan gb seçeneğini dinamik şekilde kullanmak için oluşturduk.


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Ekranın aşağıya kaydırılabilmesini sağlar
          child: SafeArea( // SafeArea sayesinde işlem yapacağımız alanı yukarıda ki bildirim batarya gibi işlevlerin gözüktüğü çubuktan uzak tutar
            child: Padding(  // tasarımın tamamında yatayda köşelerde boşluk bırakmak  için 
              padding: const EdgeInsets.symmetric(horizontal: 15), // yatayda 15 px boşluk bıraktık
              child: Column( // tasarım body kısmından sorulur tasarımımızda altalta içerikler var ilk başta column oluşturduk
                crossAxisAlignment: CrossAxisAlignment.start, // home kısmı containerdan dolayı ortaya hizalanıyordu bu şekilde  sola doğru hizaladık
                 children: [
                  // Başlığı aldık
                  HeaderandIcon(widget.urun_adi!, AllPage(),context), // widget. ile diğer sayfadan veri çektim
                  Column( // ürünleri ortaya hizalamak için
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/7,),  // ekran uzunluğuna göre boşluk verildi
                    
                    
                    SizedBox( // resmi boyutlandırdık
                      width:MediaQuery.of(context).size.width*0.7 , // genişliğin yüzde 70 i 
                      height: MediaQuery.of(context).size.height*0.4,
                      child: Image.asset(widget.resim_adi)), // Resmi aldık
                    // renk seçeneği için row altında container 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height:MediaQuery.of(context).size.height*0.1 ,),
                        Row(
                          children: [
                            ColorDot(  // alt + . ile extract widget diyip widgeti çıkardım yani oluşturdum aşağıda 
                            color: Colors.black,
                            isActive: false,
                            press: (( ) {
                              setState(() {
                                
                              });
                              

                            } // press değişkeni kapsamı
                            ), // press değişkeni

                    ), // ColorDot widgeti
                    ColorDot(  // alt + . ile extract widget diyip widgeti çıkardım yani oluşturdum aşağıda 
                            color: Color.fromARGB(255, 50, 99, 138),
                            isActive: false,
                            press: (() {
                          

                            } // press değişkeni kapsamı
                            ), // press değişkeni

                    ), // ColorDot widgeti

                    ColorDot(  // alt + . ile extract widget diyip widgeti çıkardım yani oluşturdum aşağıda 
                            color: Color.fromARGB(255, 210, 198, 94),
                            isActive: true,
                            press: (() {
                              print("Renk seçildi");
                              

                            } // press değişkeni kapsamı
                            ), // press değişkeni

                    ), // ColorDot widgeti

                    ColorDot(  // alt + . ile extract widget diyip widgeti çıkardım yani oluşturdum aşağıda 
                            color: Color.fromARGB(183, 190, 183, 183),
                            isActive: false,
                            press: (() {
                            

                            } // press değişkeni kapsamı
                            ), // press değişkeni

                    ), // ColorDot widgeti
                          ],
                        ), // Row
                        
                         
                    ], // children row altı

                    ), //row
                    Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: 
                            capacities.map((int number) => createDynamicCapacity(capacity:number, selected:selectedCapacity==number,context: context ,onTap:(){
                              setState((){
                                selectedCapacity=number;
                              });}
                            
              
                             )).toList(),                          
                        ),

                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height/15,
                      child: ElevatedButton(
                        child:Text("BUY"),
                        onPressed:(){
                          print("  ${widget.urun_adi} satın alındı");
                          
                        } ,),
                    ),
                    SizedBox(height: 20,)
                  ], // column altında ki children

              

                  

                  

                  ), // column 

                 ], // children 
                 ), // column
                 ), // padding 
                 ), // safearea
                 ), // singlechildscroolview 
        bottomNavigationBar: createBottomBar(),
    ); // scaffold
  

    
  }
}







class ColorDot extends StatelessWidget { // // alt + . ile extract widget diyip widgeti çıkardım 
  const ColorDot({ // ColorDot tıkladım final parametresine add ekleme yaptım requried ekledi,class içinde değişken tanımlarsan bu işlemi yapmalısın
    Key? key,
     required this.color,
     required this.isActive,
     required this.press,
  }) : super(key: key);

  ///DEĞİŞKEN TANIMLAMALARI
  final Color color;
  final bool isActive;
  final VoidCallback press ; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press, // yukarıda sınıf içinde tanımlanan değişken geldi
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border:  Border.all(color: isActive ? Color.fromARGB(255, 157, 71, 65) : Colors.transparent), //çerçevede ki çizgi ilk koşul true diğeri false ifade eder
          shape: BoxShape.circle, // yuvarlak oluşturduk
          ),
          child: CircleAvatar(radius: 10, // boyutu
          backgroundColor: color,), // daire avatarı yani dairenin içinde ki içi renk dolu yuvarlak ve yukarıda ki tanımlaann değişken yardımıyla içini doldurduk
          
      ),
    );
  }
}


/*
Widget selectColor(Color renk){ // dışarıdan Coloralacağız 
  return  Row(children: [
               GestureDetector(
                onTap: (){

                },
                 child: Container(
                  margin: EdgeInsets.only(right: 17), // her container sağına 17 px boşluk verir
                   width: 22,
                    height: 22,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: renk,
                    //border: Border.all(color: Color.fromARGB(255, 25, 48, 67)) // yuvarlağın çerçevesini ekler 
                     ), // yuvarlak oluşturduk
                     
                    
                        ),
                        
               )
                    ],
                    );
}
*/






Widget createDynamicCapacity({required int capacity,required bool selected,required Function onTap,required BuildContext context}){
  
  return  GestureDetector(
    onTap:() => onTap, /// Tıklanabilirlik çalışmıyor.
    child: Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
      child: Text(
        "$capacity Gb",
        style: TextStyle(fontSize: 18,color: selected? Colors.blue : Colors.black,),
        ),
    ),
  );

}














