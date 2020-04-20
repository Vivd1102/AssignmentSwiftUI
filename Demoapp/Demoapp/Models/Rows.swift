

import Foundation
 

public class Rows: ObservableObject {
	public var title : String?
	public var description : String?
	public var imageHref : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let rows_list = Rows.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Rows Instances.
*/
      public class func modelsFromDictionaryArray(array:NSArray) -> [Rows]
    {
        var models:[Rows] = []
        for item in array
        {
            models.append(Rows(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let rows = Rows(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Rows Instance.
*/
     public init?(dictionary: NSDictionary) {

        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        imageHref = dictionary["imageHref"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.imageHref, forKey: "imageHref")

        return dictionary
    }

}
