
import 'package:eticaret/Categories.dart';
import 'package:flutter/material.dart';
    
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { /// Değişken tanımlamalarını buraya yazıyorum

  

  @override
  Widget build(BuildContext context) {

    /// Buraya tanımlama yapma bu sayfada çalışacaksan bir üstte state class olan yere yap diğer sayfadan veri de alacaksan en üstte ki classa yap
      /// Boyutlandırma tablet modunda farklı oluyor bundan dolayı oranlama yapmamız lazım
    /// Ekran boyutu bilgisini almak için MediaQuery.of(context) kullanmamız lazım context yukarıda ki parametredir ekran bilgisini verece.
    var ekranbilgisi = MediaQuery.of(context) ; // medya sorgusu demektir ekran bilgisini verir.
    //print("****5555555555555************ekran bilginisini guncelledin");
    /// Tanımlanan ekranbilgisiyle genişlik ve yüksekliğe ulaşabiliriz
    /// genişlik ve yüksekliğin değişmemesi için final türünde tanımlıyoruz
    final double ekranGenisligi = ekranbilgisi.size.height ; // ekren genişliği bilgisine ulaşılıp tanımlandı
    //print("ekran genisligi bilginisini guncelledin");
    
    final double ekranUzunlugu =ekranbilgisi.size.width ; // ekran uzunluğu bilgisi ulaşılıp tanımlandı
    //print("ekran uzunlugu bilginisini guncelledin");
    
    /*
    MediaQuery.of(context).size.height ve MediaQuery.of(context).size.width yapsını kullanacaksan  yeni bir sayfa oluştur MaterialApp kısmının 
    home kısmının karşısına  oluşturulan sayfayı yaz ve ekran bilgisi almak için gereken kodlamaları oluşturulan HomePage sayfasına yaz  
    */



    ///bottomNavigationBarItem ile tasarımın en altında ki bar kısmını oluşturacağız
    int secilenIndex = 0 ; // State özelliği olan seçilen BottomNavigationBar indeksinin takibi için oluşturduk,varsayılan indeksimizde 0.indekstir
    var sayfaListesi = [Center()]; // Ekranda gösterilecek sayfa listesi 


    Widget createBottomBar()
  {

    
    //var sayfaListesi = [Sayfa(),Sayfa(),Sayfa(),Sayfa()]; // Ekranda gösterilecek sayfa listesi 
    //int secilenIndex = 0 ;  // current tanımlanırken hata alıyordum muhtemelen method kurdum diye okumadı ondan dolayı buraya aldım 
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Shop',
          ),
        ],
      currentIndex:secilenIndex ,
      selectedItemColor: Colors.deepOrange, // seçili olan items
      unselectedItemColor: Colors.grey, // seçili olmayan items
      showSelectedLabels: true, // seçili olanların etiketinin durumu
      showUnselectedLabels: true, // seçili olmayanların etiketinin durumu true o zaman ekranda gözükür kapatmak için false yapabilirsiniz
      onTap:(int index){ 
        secilenIndex=index ;// parametre aktarımı 
        setState(() { // arayüzü günceller 
          
        });
      
        
      } ,
    );
  }



 
    
    return Scaffold( // scaffold iskeletimiz
        body: // tasarım body kısmından sorulur :) 
        SingleChildScrollView( // Ekranın aşağıya kaydırılabilmesini sağlar
          child: SafeArea( // SafeArea sayesinde işlem yapacağımız alanı yukarıda ki bildirim batarya gibi işlevlerin gözüktüğü çubuktan uzak tutar
            child: Padding(  // tasarımın tamamında yatayda köşelerde boşluk bırakmak  için 
              padding: const EdgeInsets.symmetric(horizontal: 16), // yatayda 16 px boşluk bıraktık
              child: Column( // tasarım body kısmından sorulur tasarımımızda altalta içerikler var ilk başta column oluşturduk
                crossAxisAlignment: CrossAxisAlignment.start, // home kısmı containerdan dolayı ortaya hizalanıyordu bu şekilde  sola doğru hizaladık
                 children: [
                  createHeader(), // başlık tasarımımız 
                   createBanner(), ////Banner yani afiş kısmı olarak geçen yer için
                   // Buton kısmında butonlar row ile yanyana ama icon ile isimlendirme olacak altaqlta column onlar için kullanılacak
                   Padding(padding: const EdgeInsets.only(top: 48),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // bu şekilde aralarında boşluk bırakmış olacağız
                    children: [
                      createNavigator("Categories", Icons.menu_open,Categories(),context ),
                      createNavigator("Favorities", Icons.star,Center(),context ),
                      createNavigator("Gift", Icons.card_giftcard_rounded,Center(),context ),
                      createNavigator("Best selling", Icons.signal_cellular_alt_sharp,Center(),context ),
                    ],
                   ),
                   ),
                    SizedBox(height: 40,), // boşluk verdik 
                      ///Sales title 
                     Center(child: Text("Sales",style: TextStyle(color: Colors.black,fontSize: ekranGenisligi/23,fontWeight: FontWeight.bold),)), // Sales başlığını ortaya hizaladım Center sayesinde
                     SizedBox(height: 16,), // boşluk verdik 
                     // sales ıtems 
                     Row( // karakterlerin  yanyana olması için
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // merkezde hizalayıp aralarına boşluk vermek için
                      children: [ 
                       createSalesItems(text: "Smartphones", photoUrl:"images/mobil.png", discount: "-15%"),
                       //Spacer(),
                       createSalesItems(text: "Laptops", photoUrl:"images/laptop.png", discount: "-20%"),
                     ],), // Row
                    ], // children 
                ), // Columns
            ), //Padding 
          ), //SafeArea
        ), // SingleChildScrollView
        bottomNavigationBar: createBottomBar() // bottomNavigationBar body dışına  kodlanır 
    ); // Scaffold 
  }
}





// başlık için
Widget createHeader(){ // kodların kısa durması için widget oluşturup return ile döndürdük
  return Padding(
                  padding: const EdgeInsets.only(top:24),
                   // başlık için text oluşturuyorum
                  child: Text("Home",style: TextStyle(color: Colors.black,fontSize: 32 ,fontWeight: FontWeight.bold),),// size boyut için , weight.bold yazının kalınlığı için
                  );
} // createHeader



// afiş için 
Widget createBanner(){
  return Padding(
                    padding: const EdgeInsets.only(top: 24), // sadece baş kısmından yani yukarıdan boşluk bıraktım
                    child: 
                    Container(
                      width: double.infinity, // yukarıda yatayda boşluk oluşturmuştuk gidebileceği yere kadar container boyutlandırdık.
                      padding: EdgeInsets.only(left: 24,right: 36,top: 14,bottom: 18), // bu şekilde contaıner  içinde ki içeriğe göre boyutlandırılacak  
                     decoration: BoxDecoration(
                       color: Color(0XFF0001FC), // renk koduyla renk oluşturduk),
                       borderRadius: BorderRadius.circular(6),),
                       // alan içinde yani afiş içinde isim ve altında fiyat kısmı olacak bunun için column ve yanda resim olacak bunuda row ile yapacağız 
                       child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // column otomatik ortalama yapıyordu ondan dolayı bunu kullandım.
                            children: [
                             Text("Airpods",style: TextStyle(color: Colors.white,fontSize: 18 ,fontWeight: FontWeight.bold),),
                             SizedBox(height: 4),
                             Text("\$150 ",style: TextStyle(color: Colors.white,fontSize: 14 ,fontWeight: FontWeight.w400),), // column altında textler verildi 
                            ],
                          ),
                          Spacer(), // araya boşluk koymak için 
                          SizedBox( // resmi boyutlandırdık 
                            height:73 ,
                            width: 85,
                            child: Image.asset("images/airpods.png")),
                        ],
                       ), 
                    ),
                    );
} //createBanner 





Widget createNavigator(@required String text , @required IconData icon , Widget widget,BuildContext context){
  /*
  Daha kısa kod yazmak için method oluşturuyoruz içeriye girilen parametreleri gerekli yerlere atandı girilen değerler yaz<ılıp daha az kod ile ekranda göreceğiz
  IconData ile icon verisi alabileceğiz, widget ilede  geçiş için kullanacağız, 
  required kullanma sebebim ise gereklilik ifade eder ve mutlaka yazılması gereken yerler için kull
  Aşağıda context var geçiş için burada da gerekiyordu bu nedenle  BuildContext context oluşturdum 
  */

  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context) => widget ));  // => işareti return anlamı vardır 
    },
    child: Column(
    children: [
       Container(
          padding: EdgeInsets.symmetric(horizontal: 19,vertical: 22), // bu sayede alan içi içine girilenler kadar genişler ve köşelerde oran olur 
          child: Icon(icon,color:Color(0XFF0001FC),size: 17,), // container içine child altında ıcon yerleştirildi
          decoration: BoxDecoration(shape: BoxShape.circle,color:Color.fromARGB(255, 200, 227, 255)),), // yuvarlak bir alan istiyoruz bunuun için decoration shape BoxShape.circuler kullanacağız bu sayede dairesel alan oluşacak
          Text(text,style: TextStyle(color: Color.fromARGB(255, 46, 87, 154),fontSize: 14,fontWeight: FontWeight.w500),),
     ],
   ),
 ); 
} // CreateNavigator


//
Widget createSalesItems({required String text,required String photoUrl,required String discount}){
  
  /*
  -text parametresiyle  resmin altına isim veriyoruz,photoUrl ile de resmin adresini belirteceğiz ve discount ile indirim oranını
  - Fonksiyon kurarken temel mantık aynı koda farklı isimlendirmeleri tektek yapmak yerine daha basit şekilde yapmaktır
  - fonskiyon oluşturmak gayet basittir dikkat etmen gereken void ile oluşturduklarından return yani geri dönüş olmuyor
  - parametre oluştururken ise süslü parantezler içinde required ifadesini kullanırsan parametre ismi yanına iki nokta koyup gereken bilgiler yazılır ve required bulunduran ifadeler boş bırakamayacağımızı ifade eder 
  */
  return Container(
                   padding: EdgeInsets.only(left: 17,right: 12,top: 12,bottom: 20),
                   child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(3),
                        color: Color.fromARGB(115, 110, 170, 220), // alan rengi
                        ),
                        child:Text(discount,style: TextStyle(color: Color(0xFF1F53E4),fontSize: 12),), //discount: indirim
                   ),
                   SizedBox(height: 5,), // boşluk verdim
                   SizedBox(height: 130,width: 100,child: Image.asset(photoUrl)), // resim boyutlandırıldı,photoUrl
                   SizedBox(height: 3,),
                   Text(text,style: TextStyle(color: Color(0xFF1F53E4),fontSize: 17),), // Text
                    ],
                   ),
                   ); /// Süslü parantez içinde kod bitiminde noktalı virgül koymayı unutma
} //CreateSalesItems 






/*
Widget createBottomBar()
  {

    
    var sayfaListesi = [Sayfa(),Sayfa(),Sayfa(),Sayfa()]; // Ekranda gösterilecek sayfa listesi 
    int secilenIndex = 0 ;  // current tanımlanırken hata alıyordum muhtemelen method kurdum diye okumadı ondan dolayı buraya aldım 
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Shop',
          ),
        ],
      currentIndex:secilenIndex ,
      selectedItemColor: Colors.deepOrange, // seçili olan items
      unselectedItemColor: Colors.grey, // seçili olmayan items
      showSelectedLabels: true, // seçili olanların etiketinin durumu
      showUnselectedLabels: true, // seçili olmayanların etiketinin durumu true o zaman ekranda gözükür kapatmak için false yapabilirsiniz
      onTap:(int index){
        secilenIndex=index ;
        if(secilenIndex==0){
          print("Anasayfa");
        }else{"print(düzelt bu saçmalığı)";}
        
      } ,
    );
  }

*/

/*
// _onTap function
void _onTap(int index)
  {
    int secilenIndex = index;
    
    setState(() {
    });
  }
*/





