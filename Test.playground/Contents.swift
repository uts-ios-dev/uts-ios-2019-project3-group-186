import UIKit

protocol FullyNamed {
    
    var fullName: String {get}
    func sayfullName()
    
    struct Person: FullyNamed{
        var firstName: String
        var lastName: String
    }
}
