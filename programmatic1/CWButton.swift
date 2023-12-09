//
//  CWButton.swift
//  programmatic1
//
//  Created by Mustafa Fatih on 5/12/23.
//

import UIKit

class CWButton: UIButton {
    
    
    
    
    override init(frame: CGRect) {
        //Burada Uibutton un initialize fonksiyonunu icin init fonksiyonunu overRide edecegiz.
        super.init(frame: frame)
        //Bu initi overRide etmemizin sebebi configure fonksiyonunu burada cagirmak.Simdi Uibuttondan obje olusturdugumuzda hem superInit(apple'in kendi yazdigi fonksiyonlari icerir) hem de bizim configure fonksiyonu uzerinden gerekli seyleri olusturacagiz.Bu, UIView sınıfının bir alt sınıfı olan UIButton'ın özel bir başlatıcı metodudur (init).frame parametresi, UIButton'ın boyutunu ve konumunu belirler. Bu başlatıcı, genellikle storyboard veya xib dosyalarından oluşturulan öğeler için kullanılır.
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    //Buradaki fonksiyonunun tam olarak ne ise yaradigini anlamadim. Ancak yukaridaki init'i yazdiktan sonra xCode otomatik olarak koydu bunu.
    }
    
    //Buradaki init fonksiyonunda aslinda her button icin farkli olacak seyleri yaziyoruz. Configure fonksiyonunda her button icin ayni olacak seyleri yazdik. Onun icin custom initializer olusturuyoruz. Ve bunlari parametre olarak almasi gerekiyor. Ne zaman CWbutton olusturursak color ve title vermemiz gerekecek.Bu sayede dinamik olarak buttonlarimizin ozelliklerini belirleyebilecegiz. Bu bizim custom initilaize methodumuz.

    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)//buradaki super initi tabi ki yaziyoruz ancak frame'i bos geciyoruz cunku frame'i zaten biz belirleyecegiz. hight,width falan...x ve y coordinate. Burada aslinda CGrect diye bir seyin icinde hepsine default degeri tek tek atayabiliriz. Ancak .zero tum frame elemanlarini(high,width,x,y) 0 yapiyor. Sonradan obje olusturarak biz yapacagiz.
        self.backgroundColor = backgroundColor // self koymamizin nedeni ustteki parametre ismi ile ayni olmasi. O yzuden self koyulur. parametreye ornegin colorMFG deseydin self koymana gerek kalmazdi. xCode'un bunu anlamasini sagliyoruz.
        setTitle(title, for: .normal)
            configure() //bu metodu tabi ki custom initilaizerimizda da cagirmak zorundayiz.
    }
    
    
    // Simdi CWButton initialize edecegimiz zaman ya bos bir button initialize edecegiz ustteki en ustteki init fonksiyonu ile ya da color ve title ile button initialize edecegiz.
    
    
    
    
    func configure(){
        
        layer.cornerRadius = 25  //button un koselerini yuvarlamak icin corner'a bir cap verir. Oralara aslinda bir daire yerlestiriyor.
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold) //title'in size'ini ve kalinligini ayarliyor.
        setTitleColor(.white, for: .normal) //button normal moddayken rengi beyazdir.
        setTitleColor(.black, for: .highlighted) // button'a tiklandiginda yesil olacak. highlight = vurgulandiginda dokunuldugunda button'a
        translatesAutoresizingMaskIntoConstraints = false
        //translate autoresizing mask into constraints = TAMIC diye gecer.kod satırı, bir UIView öğesinin (translatesAutoresizingMaskIntoConstraints) otomatik düzenleme özelliğini devre dışı bırakmak için kullanılır. Bu özellik, UIKit tarafından otomatik olarak oluşturulan düzenleme kısıtlamalarının (constraints) kullanılıp kullanılmayacağını belirler.
//        Varsayılan olarak, bir UIView öğesi oluşturulduğunda, translatesAutoresizingMaskIntoConstraints özelliği true olarak ayarlanır. Bu durumda, UIKit otomatik olarak, öğenin otomatik düzenlemesini yapar ve bu öğenin çerçevesini belirli bir şekilde ekranın geri kalanına göre yerleştirir. Ancak, programatik olarak düzenlemeler yapmak istiyorsanız veya Auto Layout kullanıyorsanız, bu otomatik düzenleme özelliğini devre dışı bırakmanız gerekebilir.
//        Bu özellik devre dışı bırakıldığında, kullanıcı, kendisi düzenleme kısıtlamalarını belirleyebilir. Örneğin, NSLayoutConstraint sınıfını kullanarak özel bir düzenleme ekleyebilir ve bu öğenin yerini ve boyutunu belirleyebilir.
        


        
    }
    
    
    
    
    
    
    
}
