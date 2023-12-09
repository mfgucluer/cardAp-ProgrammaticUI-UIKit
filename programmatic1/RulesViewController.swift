//
//  RulesViewController.swift
//  programmatic1
//
//  Created by Mustafa Fatih on 6/12/23.
//

import UIKit

class RulesViewController: UIViewController {

    
    let titleLabel    = UILabel() //Bu labellar icin buttonda oldugu gibi custom olarak yapmayacagiz. Gerekte yok zaten.
    let rulesLabel    = UILabel()
    let exerciseLabel = UILabel()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
        
        
        
    }
    //Simdi segue olayi programmaticte yok. Sadece storyboard kullanirken var. Ekranlar arasi gecis yapmamiz transition gerekiyor. Simdi rules Buttonun oraya action eklememiz gerekiyor tabi ki...
    //Simdi UI Methodlari burada overall yapip configure yapmayacagiz. Bu bir tercih istedigini yap. Direkt individually olarak configure edecegiz.

    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: UIFont.Weight.bold)
        titleLabel.textColor = UIColor.red
        titleLabel.textAlignment = NSTextAlignment.center //titleLabel icinde yaziyi align ediyoruz yani hizaliyoruz. Ortaya hizaladik baslik oldugu icin.
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60), //view.safeAreaLayoutGuide.topAnchor Bu, genellikle ekranın üstündeki güvenli alanın üst kenarını temsil eder. Güvenli alan, özellikle iPhone X ve sonraki modellerde, ekranın üstünde çentik ve ana ekran düğmesi gibi öğelerin bulunduğu alanı ifade eder. Bu kısıtlama, titleLabel'ın üst kenarını view'in güvenli alanının üst kenarına yerleştirir. 60 birim mesafede yerlestirdik. ust sinira...
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30), // "öncü kenar" ya da "soldaki kenar" titleLabel.leadingAnchor: Bu, titleLabel'ın sol kenarını temsil eder. Yani, bu kısıtlama titleLabel'ın sol kenarı nereye yerleştirilecekse, onu ifade eder..constraint(equalTo: ...): Bu ifade, bir kısıtlamanın başka bir şeye eşit olacağını belirtir.                view.leadingAnchor: Bu, genellikle bir view'in sol kenarını temsil eder. Bu kısıtlama, titleLabel'ın sol kenarını view'in sol kenarına eşitleyecek.                , constant: 30: Bu, kısıtlamanın ek bir sabit değer içerdiğini belirtir. Yani, titleLabel'ın sol kenarı, view'in sol kenarına olan kısıtlamanın soluna ek olarak 30 birim (veya piksel, bağlamına göre) daha eklenmiş olacaktır.                Sonuç olarak, bu kısıtlama titleLabel'ı, view'in sol kenarına belirli bir uzaklık (30 birim) mesafede yerleştirir. Bu, view'ler arasında belirli bir hizalamayı ve boşluk mesafesini belirlemek için kullanılır ve özellikle ekran düzenini sabitlemek ve tutarlılık sağlamak amacıyla Auto Layout kullanılır.
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30), //buda sag kenari temsil edioyor.titleLabel'ın sağ kenarını, view'in sağ kenarı ile aynı hizaya getirir. -30 sabit değeri ise sağ kenar kısıtlamasına bir ek mesafe sağlar. Bu ek mesafe, genellikle view'in sağ kenarına olan mesafeden çıkartılır, bu nedenle titleLabel'ın sağ kenarı view'in sağ kenarından 30 birim daha sola yerleştirilmiş olur. Sonuç olarak, bu kısıtlama titleLabel'ı, view'in sağ kenarına belirli bir uzaklık (30 birim sola) mesafede yerleştirir ve bu şekilde view'ler arasında sağdan sola hizalama ve boşluk mesafesi belirler.
            
            
            //heighta ihtiyacimiz yok abi. Label'in heiht'i olmaz.
        ])
    
    }
    
    func configureRulesLabel(){
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The Value of each card represent the number of exercise you do.\n\n J = 11, Q = 12, K = 13, A = 14" //burada 2. rowa inmek icin \n kullaniyoruz.
        
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        /*
        rulesLabel.lineBreakMode = .byWordWrapping: Bu satır, etiketin metni uzun olduğunda satır sonlarına geldiğinde nasıl davranması gerektiğini belirtir. .byWordWrapping değeri, bir kelimenin sığmadığı bir satırda, kelimenin bir sonraki satıra geçmesini sağlar. Yani, kelimeler bir bütün olarak bölünmez, satır sonu geldiğinde kelime bir sonraki satıra kayar.

        rulesLabel.numberOfLines = 0: Bu satır, etiketin aynı anda kaç satır metni gösterebileceğini belirler. 0 değeri, etiketin sınırsız sayıda satıra sahip olmasını sağlar. Yani, etiketin yüksekliği metni göstermek için ihtiyaç duyulan kadar çok satıra genişleyebilir.

        Bu özellikler genellikle uzun metinleri etiketlerde düzgün bir şekilde görüntülemek için kullanılır. Örneğin, lineBreakMode özelliği, uzun bir cümle veya paragrafı etiket içinde düzgün bir şekilde göstermeye yardımcı olur. numberOfLines özelliği ise metnin etiket içinde kaç satırda gösterileceğini kontrol eder. numberOfLines'ın değeri 0 olduğunda, etiketin yüksekliği otomatik olarak ayarlanır ve metin ne kadar uzun olursa olsun tamamı görüntülenebilir.
   */
        
        NSLayoutConstraint.activate([
        
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30) //-30 yapmayi unutma.
        ])
        
    }
    
    func configureExerciseLabel(){
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = "♠️ = Push-ups\n\n❤️ = Sit-up\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks" //burada 2. rowa inmek icin \n kullaniyoruz.
        
        exerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exerciseLabel.textAlignment = .left
        exerciseLabel.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
        
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }

  

}
