

import UIKit
import Foundation

struct CartProductResult {
 var id: Int
 var title: String
 var quantity: Int
}
let cartProducts = [
 CartProductResult(id: 1, title: "nike shoe 1", quantity: 5),
 CartProductResult(id: 2, title: "nike shoe 2", quantity: 2),
 CartProductResult(id: 3, title: "soap", quantity: 6)
]

// Write the code that will produce the output as seen in Output:1-1 using the code from the
//snippet above in Code:1-1
/// Print `cartProducts` in this format as specified:
/// * id1-title1
/// * id2-title2
/// * id3-title3

// Solution for this problem

for cartProduct in cartProducts {
    print("id\(cartProduct.id)" + "-\(cartProduct.title)")
}

/// Task 2
//Consider the code snippet below,

struct SearchProductResult {
 var id: Int
 var title: String
 var position: Int
}
let productList: [SearchProductResult] = [
 SearchProductResult(id: 1, title: "nike shoe 3", position: 1),
 SearchProductResult(id: 5, title: "pen", position: 2)
]
///Code: 2-1
//Implement a function called printProducts that will print the contents of
//productList or cartProducts in the same format as seen in Output: 1-1.
//printProducts(cartProducts)
//printProducts(productList)


// Solution

print("// Content of product List")

for productList in productList {

    print("\(productList)")
}

print("// Content of Cart Products List")

for cartProduct1 in cartProducts {
    print("\(cartProduct1)")
}


//Task 3
//Consider the code snippet below,

func printWithDelay(product1: CartProductResult, product2:
CartProductResult, completion: (@escaping ()-> Void)) {

   completion()
}
///  Caaling the function with main thread
//printWithDelay(product1: cartProducts[0], product2: cartProducts[1]) {
//    let seconds = 1.0
//    for cartProduct in cartProducts {
//        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
//            print("  Wait 1 second")
//            print(cartProduct.id)
//        }
//    }
//    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
//        print("Done printing products")
//    }
//}


// Calling the function with Sleep ..

func printWithDelay(products: [CartProductResult], completion: (@escaping ()-> Void)) {
    for product in products {
        let seconds = 1.0
        sleep(1)
        print("  Wait 1 second")
        print("id of the product :\(product.id)")
    }
    completion()
}

printWithDelay(products: cartProducts) { 
    print("Done printing products")
}


// JSON file ...

struct People: Codable {
    let id: String
    let options: [People]
}
func loadJson(filename fileName: String) -> People? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(People.self, from: data)

            printPeople(people: [jsonData])

            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

func printPeople(people: [People]) {
    for person in people {
        print("ID: \(person.id)")
        if (!person.options.isEmpty) {
            printPeople(people: person.options)
        }
    }
}
loadJson(filename: "people1")
