//
//  EditorViewController.swift
// Computer Science IA
//

import UIKit

class EditorViewController: UIViewController {

    //setting needed variables
    var completion: ((String) -> Void)?
    var attraction: String?
    var attractionName:String = ""
    var attractionDetail: Detail = Detail(name: "",  distance:0, rating:0, info: "", image: "")
    
    //connecting the textview, the imageview and label to the code as outlets
    @IBOutlet weak var attractionInformation: UITextView!
    @IBOutlet weak var attractionImage: UIImageView!
    @IBOutlet weak var attractionTitle: UILabel!
    
    // creating the images
    var images = ["diegoImage": UIImage(named: "Diego"),
                  "chapultepecImage" : UIImage(named: "Chapultepec") ,
                  "casaImage" : UIImage(named: "Casa") ,
                  "angelImage" : UIImage(named: "ElAngel") ,
                  "artsImage" : UIImage(named: "FineArts") ,
                  "fridaImage" : UIImage(named: "Frida") ,
                  "pyramidImage" : UIImage(named: "Pyramid") ,
                  "soumayaImage" : UIImage(named: "Soumaya") ,
                  "tenochtitlanImage" : UIImage(named: "Tenochtitlan") ,
                  "trotskyImage" : UIImage(named: "Trotsky") ,
                  "zocaloImage" : UIImage(named: "Zocalo") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
        print (attractionName) //prints the value inside the'attractionName' variable set above
        let detail:Detail = getDetailFromJSON(attractionName: attractionName)
        print(detail)//prints the detail section set above
        
        //setting the information for the text, the image and the label
        attractionTitle!.text = detail.name
        attractionImage!.image = images[detail.image]!
        attractionInformation!.text = detail.info
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDetailFromJSON(attractionName:String) -> Detail {
        
        //fetch information from JSON File
        let path = Bundle.main.path(forResource: "attractions", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        
        do{
            let data  = try Data(contentsOf: url)
            let vagary = try JSONDecoder().decode(Attraction.self, from: data)

            //loop through all the values until the name of the selected attraction is the same of the attraction in the file
            for detail in vagary.details{
                
                //compares the values until t finds the correct one and displays the values for the attraction
                if detail.name == attractionName{
                    print(detail.name)
                    print(detail.info)
                    print(detail.image)
                    return detail
                }
            }
        }
            //in case of an error this will catch it and deal with it
        catch{
            print("Unexpected error: \(error).")
        }
        //if the file cant find a value then it will display the following
        return Detail(name:"",distance:0, rating:0, info:"", image: "")
        
    }
}
