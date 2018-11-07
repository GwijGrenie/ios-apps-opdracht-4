import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageClock: UIImageView!
    
    @IBOutlet var labelCollectionHet: [UILabel]!
    @IBOutlet var labelCollectionIs: [UILabel]!
    @IBOutlet var labelCollectionKwart: [UILabel]!
    @IBOutlet var labelCollectionOver: [UILabel]!
    @IBOutlet var labelCollectionVoor: [UILabel]!
    @IBOutlet var labelCollectionHalf: [UILabel]!
    @IBOutlet var labelCollectionVijfM: [UILabel]!
    @IBOutlet var labelCollectionTienM: [UILabel]!
    
    
    @IBOutlet var labelCollectionEen: [UILabel]!
    @IBOutlet var labelCollectionTwee: [UILabel]!
    @IBOutlet var labelCollectionDrie: [UILabel]!
    @IBOutlet var labelCollectionVier: [UILabel]!
    @IBOutlet var labelCollectionVijf: [UILabel]!
    @IBOutlet var labelCollectionZes: [UILabel]!
    @IBOutlet var labelCollectionZeven: [UILabel]!
    @IBOutlet var labelCollectionAcht: [UILabel]!
    @IBOutlet var labelCollectionNegen: [UILabel]!
    @IBOutlet var labelCollectionTien: [UILabel]!
    @IBOutlet var labelCollectionElf: [UILabel]!
    @IBOutlet var labelCollectionTwaalf: [UILabel]!
    
    var currentLabelCollections : [[UILabel]] = []
    var labelMapping : [String : [UILabel]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMapping()
        imageClock.isHidden = true
        ClockHelper(Delegate: self)
    }
    
    @IBAction func onLongPressGesture(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let alert = UIAlertController(title: "Configuratie", message: "Instellen van een wekker", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Annuleer", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Geef je tijd in als uu:mm bv. 08:30"
        })
        alert.addAction(UIAlertAction(title: "Bewaar", style: UIAlertAction.Style.default, handler: { action in
            let textField = alert.textFields![0]
            if textField.text == nil || textField.text!.isEmpty {
                self.imageClock.isHidden = true
            } else if dateFormatter.date(from: textField.text!) != nil {
                self.imageClock.isHidden = false
                self.imageClock.backgroundColor = UIColor.clear
            } else {
                self.imageClock.isHidden = false
                self.imageClock.backgroundColor = UIColor.red
            }
            
        }))
        self.present(alert, animated: true)
    }
    
    private func initMapping() {
        labelMapping = [
            "HET" : labelCollectionHet,
            "IS" : labelCollectionIs,
            "KWART" : labelCollectionKwart,
            "OVER" : labelCollectionOver,
            "VOOR" : labelCollectionVoor,
            "HALF" : labelCollectionHalf,
            "VIJF_M" : labelCollectionVijfM,
            "TIEN_M" : labelCollectionTienM,
            "EEN" : labelCollectionEen,
            "TWEE" : labelCollectionTwee,
            "DRIE" : labelCollectionDrie,
            "VIER" : labelCollectionVier,
            "VIJF" : labelCollectionVijf,
            "ZES" : labelCollectionZes,
            "ZEVEN" : labelCollectionZeven,
            "ACHT" : labelCollectionAcht,
            "NEGEN" : labelCollectionNegen,
            "TIEN" : labelCollectionTien,
            "ELF" : labelCollectionElf,
            "TWAALF" : labelCollectionTwaalf
        ]
    }
    
    private func initCallbacks() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: Selector(("longPressed")))
        self.view.addGestureRecognizer(longPressRecognizer)
    }
    
    private func lightLabels(LabelCollection labelCollection : [UILabel]) {
        labelCollection.forEach({label in label.textColor = UIColor.white})
    }
    
    private func dimLabels(LabelCollection labelCollection : [UILabel]) {
        labelCollection.forEach({label in label.textColor = UIColor.black})
    }
}

extension ViewController: ClockHelperDelegate {
    func updateClock(_ results: [String]) {
        for labelCollection in currentLabelCollections {
            dimLabels(LabelCollection: labelCollection)
        }
        
        currentLabelCollections = []
        
        for result in results {
            let labelCollection = labelMapping[result]!
            currentLabelCollections.append(labelCollection)
            lightLabels(LabelCollection: labelCollection)
        }
    }
}
