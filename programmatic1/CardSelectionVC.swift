//
//  CardSelectionVC.swift
//  programmatic1
//
//  Created by Mustafa Fatih on 5/12/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    //Simdi ekrandaki elementlerimizi olusturacagiz. Storyboarddaki outlet gibi aslinda. ama tam olarak degil benzerlikler var.
// image i olusturduk
    let cardImageView   = UIImageView()
    // button olusturken defaul UIButton sinifini degilde tabi ki modifiye ettigimiz kendi sinifimiz olan CWButton sinifini kullanacagiz.
    // CWButtondan stopButtonu initialize ederken CWButton() seklinde yazabiliriz. Bunu bos bir sekilde yazmak en basta yazdigimiz init fonksiyonunu cagirir sadece. Configure fonksiyonu calisir. Ancak tabiki backgroundcolor ve title veremeyiz. Tabi ki custom initilizerimzii kullanacagiz.
    
    let stopButton          = CWButton(backgroundColor: .systemRed, title: "STOP!")
    let resetButton         = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton         = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards: [UIImage]     = CardDeck.allValues
    var timer: Timer!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground //systemback ground yapinca dark modda ve light modda siyah beyaz verir sana duzgun bir sekilde.
        configureUI()
        startTimer()
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)

    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func resetCard(){
        stopTimer()
        startTimer()
    }
    
    @objc func showRandomCard(){
        cardImageView.image = cards.randomElement()
    }
    
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
   
    func configureCardImageView(){
        //Her seyden once unutmadan viewine subView eklemen gerekiyor. Buradaki kod aslinda + ya basip image'i alip storyboard'a surukleyip birakmak ile ayni sey. Yani boylece storyboard'a yani view'a subview eklemis oluyorduk.Bu kod satiri genelde cok unutuluyor.
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false //bu kod satirinin manasini biliyoruz autoLayout kullan demek... translatesAutoresizingMaskIntoConstraints özelliği true olarak ayarlanırsa (ki bu varsayılan değerdir), UIKit, o öğenin çerçevesine dayalı olarak otomatik olarak bir dizi kısıtlama oluşturur. Ancak, Auto Layout kullanıyorsanız ve bu kısıtlamaları programatik olarak belirlemek istiyorsanız, translatesAutoresizingMaskIntoConstraints özelliğini false olarak ayarlamanız gerekir. Auto Layout olayi constraitntleri kendimiz belirleme olayi yani... Auto layout bize sunulan esnek yapiya veyilen isim bir duzenleme sistemi. Arayuzu farkli ekran boyutlarina ve cihazlara uygun sekilde tasarlamak icin kullanilan bir arac.
        cardImageView.image = UIImage(named: "AS")
        //simdi cardImageimiz mevcut. Consntrait verecegiz. Constraint olayini 4 tane veriyoruz zaten biliyorsun. Bunu bir array icinde yapacagiz. ornegin witdthAnchor yazdiktan sonra . consraint yapiyoruz ve bir suru secenek cikiyor sebebi istedigimiz yere gore constraint ayarlayabilirirz.
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250), // burada widhti 250 olarak verdik
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), //burada constant bir sayi vermeyecegiz. Burada X ekseninin merkezine koyacagiz.
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75) //burada constant verdik cunku y ekseni boyunca -75 olarak asagiya kaydirmak istiyoruz.
            
    
        ])
        
    }
    
    
    func configureStopButton(){
        
        view.addSubview(stopButton)
        //simdi burada Tamic kodunu false yapmamiza gerek yok cunku bunu zaten sinifini olusturuken yaptik. Bu sayede kod tekrarindan da kacindik.
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
        
            stopButton.widthAnchor.constraint(equalToConstant: 280),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30) // stopbuttonun en ustunu cardImageviewin en altina 30pixellik bosluk olacak seklide yerlestir demek saniyorum.
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetCard), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            resetButton.widthAnchor.constraint(equalToConstant: 130),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10)
        //Not burada leadingAnchor diyede bir sey kullaniyor SeanAllen abim. resetbutton.leadinganchor diye o sekilde yapiyor.
            //resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor) seklinde yapti mesela falan filan...
        ])
        
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside) //buradaki touchUp inside olayi tamamen default olarak secilen bir sey.
        
        
        
        NSLayoutConstraint.activate([
        
            rulesButton.widthAnchor.constraint(equalToConstant: 130),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10)
        
        //Not copy paste option tusunu basili tutarak coklu cursor yapabilirisn.
        
            
            // simdi rules button icin action eklememiz gerekiyorki RulesVC ye gidebilelim.
            

        ])
        
    }
    
    @objc func presentRulesVC(){
        present(RulesViewController(), animated: true)
        
    }
    
    
    
    
    
    
    

}
