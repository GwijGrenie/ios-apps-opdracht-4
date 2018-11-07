import UIKit

class ViewController: UIViewController, ClockHelperDelegate {
    
    var currentLabelCollections : [[UILabel]] = []
    var labelMapping : [String : [UILabel]] = [:]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMapping()
        ClockHelper(Delegate: self)
    }
    
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
    
    func longPressed(sender: UILongPressGestureRecognizer) {
        
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

