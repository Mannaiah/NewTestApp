//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation
print("India")
//Extension

// func square(x:Int) -> Int {
//    return (x * x)
//}
//print(square(x:5))
//
//extension Int{
//    var square : Int{ return self * self}
//}
//print(5.square)
//

//Generics

//
// var stringArray = ["Bob","Bobby","Sangjoon"]
// func printStringArray(a:[String]){
// for s in a {
// print(s)
// }
// }
// printStringArray(a:stringArray)
//
//var stringArray = ["Bob","Bobby","Sangjoon"]
//var intArray = [1,2,3,4]
//var doubleArray = [1.0,2.0,3.0,4.0]
//func printElementFromArray <T>(a:[T]){
//    for element in a {
//        print(element)
//    }
//}
//
//printElementFromArray(a:stringArray)
//printElementFromArray(a:intArray)
//printElementFromArray(a:doubleArray)


//For Loop

// for i in 0...5 {
//    print("count",i)
//}
//
//var myuserName:Double?
//var mypassword:Double?
//func userLogin(){
//    guard let userName = myuserName , let password = mypassword   else {return}
//    print("well come->\(userName)! -. password\(password)")
//}


//Enum to Type Safe
//enum People {
//    case adult,child,senior
//}
//var person = People.senior
//switch person {
//case .adult:print("7")
//case .child : print("8")
//case .senior:print("9")
//}
//Nil Coalescing
//var userChoosenColor : String?
//var defaultColor = "Red"
//var colorTouse = userChoosenColor ?? defaultColor
////Conditional Coalescing
//var currentHeight = 185
//var hasSpikayHair = false
//var finalHight = 0
//finalHight = currentHeight + (hasSpikayHair ? 5: 0)
//var evens = Array(1...10).filter { $0 % 2 == 0}
//print(evens)
//
//var odd = Array(1...10).filter{ $0 % 2 != 0 }
//print(odd)
//var sumUsingCloser:(Int,Int) ->(Int) = { $0 + $1 }
//sumUsingCloser(11,78)


//Tuples(saving both integer and string values)
//var error501 = (501,"Not implemented")
//print(error501.0)
//print(error501.1)
//
//var errorCode505 = (errorCode:505 ,description:"Values not found")
//print(errorCode505.errorCode)
//print(errorCode505.description)

let stringL = "Hello\tWoZrld\n\nHello\'Swift 4\'"
print(stringL)
// ternarey : Condition ? X : Y
//Exp1 ? exp2 : exp3
//
//let stringC = """
//Hey this is a
//example of multiple Line
//string by tutorialsPoint
//
//"""
//print(stringC)
//
//var varA = "Hello, Swift 4!"
//
//print( "\(varA), length is \((varA.count))" )
//
//for cha in "ThisString" {
//    print(cha, terminator: "-")
//}

//let char : Character = "s"
//print(char)

//var char:Character = ""
//print(char)
//for ch in "Hello" {
//    print(ch)
//}

//var varA:String = "hai"
//let chara:Character = "M"
//varA.append(chara)
//print("\(varA)")
//var someInt = [Int]
//someInt.append(15)
//var someVar = someInt[3]
//print(someVar)
//var intsA = [Int](repeating:5, count: 3)
//var intsB = [Int](repeating:2, count: 2)
//
//var intsC = intsA + intsB
//for item in intsC {
//    print(item)
//}
let names = ["Anna","Alex","Brain","Jack"]
//for name in names[0..<names.count]{
//    print(name)
//}

for name in names[0...2]{
    print(name)
}

//for (index,name) in names.enumerated()]{
//    if (index>=1) && (index <= 2){
//        print(name)
//}
//struct Matrix {
//    let rows :Int,columns:Int
//    var grid:[Double]
//    init(rows:Int , columns:Int) {
//        self.rows = rows
//        self.columns = columns
//        self.grid = Array(repeating:0.0, count:rows*columns)
//    }
//    func getValue(row:Int,column:Int) -> Double {
//        return grid[(row*column) + column]
//    }
//    mutating func setValue(row:Int,column:Int,value:Double){
//        grid[(row * column) + column] = value
//    }
//
//}
//var matrix = Matrix(rows: 2, columns: 2)
//matrix.setValue(row: 0, column: 0, value: 1.0)
//matrix.setValue(row: 0, column: 0, value: 1.0)
//matrix.setValue(row: 0, column: 1, value: 2.0)
//matrix.setValue(row: 1, column: 0, value: 3.0)
//matrix.setValue(row: 1, column: 1, value: 4.0)
//print(matrix.getValue(row: 1, column: 1)) //prints "4.0"
//var radius :Double = 100
//var diameter : Double{
//    get{
//        return radius*2
//    }
//    set{
//        radius = newValue/2
//    }
//}
//print(radius)
//print(diameter)

//SwapTwo Values
func swapTwoValues<T>( _ a: inout T ,_ b: inout T){
    let temp = a
    a = b
    b = temp
}
var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
print(someInt)
print(anotherInt)

enum CompassPoint {
    case north,south,east,west
}
let direction:CompassPoint = .west
switch direction {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


//------------------------------ Set-------------------------
//
//var someSet = Set<Character>()
//print(someSet.count)
//someSet.insert("M")
//print(someSet.isEmpty)
//someSet.insert("M")
//print(someSet)
////someSet.remove("M")
//someSet.contains("M")
var  evens: Set = [10,12,14,16,18]
let odds: Set = [5,7,9,11,13]
let primes = [2,3,5,7]
//print(odds.union(evens).sorted())
//print(evens.union(odds).sorted())
//print(odds.intersection(evens).sorted())
//print(odds.intersection(primes).sorted())
//print(odds.subtracting(primes))
//print(odds.subtracting(primes).sorted())
//print(odds.subtracting(evens).sorted())
evens.insert(20)
//print(evens.sorted())
//------------------------------ Dictionaries -------------------------
var cities = ["Delhi","Bangalore","Hyderabad","gdfdfk"]
var Distance = [2000,10,620,566]
let cityDistanceDict = Dictionary(uniqueKeysWithValues:zip(Distance,cities))
print(cityDistanceDict)
var closeDict = cityDistanceDict.filter {
    $0.key > 1000

}
print(closeDict)
//var cities = ["Delhi","Bangalore","Hyderabad","Dehradun","Bihar"]
//var GroupedCities = Dictionary(grouping: cities ) { $0.first! }
//print(GroupedCities)
class person{
    func getName() -> String
    {
        return "method"
    }
    
}
  //func getOutSideName(){
    let p = person()
    print(p.getName())
    
//}
typealias AudioSample = Int
var num = AudioSample()
let a = "10"
num = AudioSample(a) ?? 0
print(num)

//Try Catch
//
//enum ErrorsToThrow : Error{
//    case nameisEmity
//}
//class Human{
//    var name:String?
//    init(name:String?) throws {
//        guard let name = name else{
//            throw ErrorsToThrow.nameisEmity
//        }
//        self.name = name
//    }
//}
//do {
//    let humanObj = try Human(name:nil)
//}catch ErrorsToThrow.nameisEmity{
//    print("name is Emity---")
//}
//let humanObject1 = try Human(name:"ios")//
//let humanObject2 = try Human(name:nil)//nil value
func getData<T>(val:T)->T{
   return val
}
print(getData(val:1))
print(getData(val:"1"))
print(getData(val:["key":"val"]))

func findLargeAndSmall(array:[Int]) ->(large:Int , small:Int) {
    var small = array[0]
    var large = array[0]
    
    for i in array[1..<array.count]{
        
        if i < small{
            small = i
        }else if i > large {
            large = i
        }
    }
    return (large,small)
}
 //findLargeAndSmall(array:[40,12,-5,78,98,100])
print(findLargeAndSmall(array:[40,12,-5,78,98,100]).large)
print(findLargeAndSmall(array:[40,12,-5,78,98,100]).small)

func sample(number:Int){
    print(number)
}
sample(number:15)
func pow(firstArg F:Int , lasrArg L:Int) -> Int {
    var res = F
    for _ in 1..<L {
        res = res * F
    }
    return res
}
print(pow(firstArg:5, lasrArg:12))

//Variadic Parameters
func variadicParams<N>(numbers:N...){
    for i in numbers{
        print(i)
    }
}
variadicParams(numbers:1,2,8)
variadicParams(numbers:"sfnkj","djfjds")

func temp(a1: inout Int ,b1: inout Int){
    let temp = a1
    a1 = b1
    b1 = temp
}

var no = 2
var co = 10
temp(a1: &no, b1: &co)
print("no--\(no) ,co--\(co)")
//
//func ascend(s1:String ,s2:String) -> Bool{
//    return s1 > s2
//}
//
//let stringCmp = ascend(s1:"a", s2:"b")
//print(stringCmp)

let sum = { (no1:Int , no2:Int) -> Int in return no1 + no2}

let digits = sum(10,50)
print(digits)

//Sorted
var count:[Int] = [5,41,41,1,41,45]
let descending = count.sorted(by:{n1,n2 in n1 > n2})
let asending = count.sorted(by:{
    n1,n2 in n1 < n2
})
print(descending)
print(asending)

//
let sub = {(no1:Int , no2:Int) -> Int in
    return no1 - no2
}
let digi = sub(10,20)
print(digi)

//
//var shorthand: (String, String) -> String
//shorthand = { $1 }
//print(shorthand("100", "200"))

//
//let numb = [98, -20, -30, 42, 18, 35]
//var sortedNumbers = numb.sorted ( by:{
//    (left: Int, right: Int) -> Bool in
//    return left < right
//})
//
//let asc = numb.sorted(<)
//print(asc)



func calcDecrement(forDecrement total: Int) -> () -> Int {
    var overallDecrement = 100
    func decrementer() -> Int {
        overallDecrement -= total
        print(overallDecrement)
        return overallDecrement
    }
    return decrementer
}

let decrem = calcDecrement(forDecrement: 18)


enum Student {
    case Name(String)
    case Mark(Int,Int,Int)
}

var studDetails = Student.Name("Swift 4")
var studMarks = Student.Mark(98,97,95)

switch studMarks {
case .Name(let studName):
    print("Student name is: \(studName).")
case .Mark(let Mark1, let Mark2, let Mark3):
    print("Student Marks are: \(Mark1),\(Mark2),\(Mark3).")
}

enum Month: Int {
    case January = 1, February, March, April, May, June, July, August,
    September, October, November, December
}

let yearMonth = Month.May.rawValue
print("Value of the Month is: \(yearMonth).")


//Struct
struct StudentMarks{
    var mark1:Int
    var mark2:Int
    var mark3:Int
    init( mark1:Int, mark2:Int, mark3:Int) {
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
        
    }
}
var marks = StudentMarks(mark1:100, mark2: 105, mark3: 110)
print(marks.mark1)
print(marks.mark2)
print(marks.mark3)
var modifyMark = StudentMarks(mark1:100, mark2: 105, mark3: 110)

struct Number {
    var digits: Int
    let pi = 3.1415
}
var n = Number(digits:123456)
n.digits = 67
print(n.digits)


class Samplepgm {
    var counter: Int = 0 {
        willSet(newTotal){
            print("Total Counter is: \(newTotal)")
        }
        
        didSet {
            if counter > oldValue {
                print("Newly Added Counter \(counter - oldValue)")
            }
        }
    }
}

let NewCounter = Samplepgm()
NewCounter.counter = 100
//NewCounter.counter = 800

class Calculation{
    let a:Int
    let b:Int
    let res:Int
    init(a:Int,b:Int) {
        self.a = a
        self.b = b
        res = a + b
    }
    func total(c:Int) ->Int  {
        return res - c
    }
    func result() {
        
        print("Result is :\(total(c:20))")
         print("Result is :\(total(c:200))")
    }
}
let pri = Calculation(a: 600, b: 300)
pri.result()

struct area {
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length * breadth
    }
    mutating func scaleBy(res: Int) {
        length *= res
        breadth *= res
        print(length)
        print(breadth)
    }
}

var val = area(length: 3, breadth: 5)
val.scaleBy(res: 3)
val.scaleBy(res: 30)
val.scaleBy(res: 300)
class daysOfWeek{
    private var days = ["Sundat","Monday","Tuesday","Wednewsday","thursday","Fridar"]
    subscript (index:Int) -> String{
        
        get {
            return days[index]
            
        }
        set (mewvalue){
            self.days[index]
        }
    }
}

print(daysOfWeek()[0])

//Swift - Inheritance

class StudDetails {
    var mark1: Int;
    var mark2: Int;
    
    init(stm1:Int, results stm2:Int) {
        self.mark1 = stm1;
        self.mark2 = stm2;
    }
    func print1() {
        print("Mark1:\(mark1), Mark2:\(mark2)")
        
    }
}

class display : StudDetails {
    init() {
        super.init(stm1: 93, results: 89)
    }
}

let marksobtained = display()
marksobtained.print1()

class SuperClass {
    func superClassMethod() {
        print("<----SuperClass--->")
    }
}
class SubClass: SuperClass {
    override func superClassMethod() {
        print("SubClass")
    }
}
let suclass = SuperClass()
suclass.superClassMethod()
SubClass().superClassMethod()
//
 class Circle {
    var radius = 12.5
    var area: String {
        return "of rectangle for \(radius) "
    }
}

class Rectangle: Circle {
    var print = 7
    override var area: String {
        return super.area + " is now overridden as \(print)"
    }
}
let rect = Rectangle()
rect.radius = 25.0
rect.print = 3
print("Radius \(rect.area)")

class Square: Rectangle {
    override var radius: Double {
        didSet {
            print = Int(radius/5.0)+1
        }
    }
}
//Optional Values
class ElectionPole{
    var candidate:Polebooth?
}
class  Polebooth {
    var name="MP"
}
let cand = ElectionPole()
if let name = cand.candidate?.name {
    print(name)
}else{
    print("Candidate Name Con't be recived")
}

extension Int{
    var add:Int{return self + 100}
    var sub :Int{return self - 10}
}
let add = 3.add
let subgg = 3.sub
print("Add-->\(add)---Sub->\(subgg)")

struct sum1 {
    var num1 = 100,num2 = 200
}
struct diff {
    var no1 = 200,no2 = 100
}
struct mult {
    var a = sum1()
    var b = diff()
}
var calc = mult()
print ("Inside mult block \(calc.a.num1, calc.a.num2)")
print("Inside mult block \(calc.b.no1, calc.b.no2)")
 let memcalc = mult(a: sum1(num1: 300, num2: 500),b: diff(no1: 300, no2: 100))
print("Inside mult block \(memcalc.a.num1, memcalc.a.num2)")
print("Inside mult block \(memcalc.b.no1, memcalc.b.no2)")
extension mult{
    init(x:sum1,y:diff) {
        let X = x.num1 + x.num2
        let Y = y.no1 + y.no2
    }
}
let a1 = sum1(num1: 100, num2: 200)
print("Inside Sum Block:\( a1.num1, a1.num2)")

let b = diff(no1: 200, no2: 100)
print("Inside Diff Block: \(b.no1, b.no2)")
extension Int {
    func topics(summation: () -> ()) {
        for _ in 0..<self {
            summation()
        }
    }
}
4.topics(summation: {
    print("Inside Extensions Block")
})

3.topics(summation: {
    print("Inside Type Casting Block")
})

//
func tt(tt:() -> ()){
print("hai")
  tt()
}
let t = tt {
    print("hello")
}

//
protocol ClassA {
    var marks:Int{get set}
    var result:Bool{get}
    func attendence() -> String
    func marksSecured() -> String
}

protocol classB:ClassA {
    var present:Bool{get set}
    var subject:String{get set}
    var stName:String{set get}

}
class classC:classB {
    var present: Bool = false
    
    var subject: String = "Swift 4 Protocols"
    
    var stName: String = "Protocols"
    
    var marks: Int = 96
    
    var result: Bool = true
    
    func attendence() -> String {
        
       return "The \(stName) has secured 99% attendance"
    }
    
    func marksSecured() -> String {
        return "\(stName) has scored \(marks)"
    }
   
}
let student = classC()
student.stName = "Swift 4"
student.marks = 98
student.marksSecured()
print(student.marks)
print(student.result)
print(student.present)
print(student.subject)
print(student.stName)
//
//protocol tcpprotocol {
//    init(no1: Int)
//}
//class mainClass {
//    var no1: Int        // local storage
//    init(no1: Int) {
//        self.no1 = no1  // initialization
//    }
//}
//class subClass1:mainClass,tcpprotocol{
//    var no2 : Int
//    init(no1:Int,no2:Int){
//        self.no2 = no2
//        super.init(no1:no1)
//    }
//    required  override convenience init(no1: Int) {
//       self.init(no1:no1, no2:0)
//    }
//}
//let res = mainClass(no1: 20)
//let print = subClass1(no1: 30, no2: 50)
//
//print("res is: \(res.no1)")
//print("res is: \(print.no1)")
//print("res is: \(print.no2)")


//---Use filter to get common elements from two arrays--

let fruitsArray = ["a", "m", "b", "o"]
let vegArray = ["t", "p", "m", "b","s"]
let output = fruitsArray.filter{ vegArray.contains($0) }
print(output)
//---- Calculate all permutations of a string in Swift---//
func permutations(_ n:Int, _ a: inout Array<Character>) {
    if n == 1 {print(a); return}
    for i in 0..<n-1 {
        permutations(n-1,&a)
        a.swapAt(n-1, (n%2 == 1) ? 0 : i)
    }
    permutations(n-1,&a)
}
var arr = Array("ABC")
permutations(arr.count,&arr)
///////---- Duplicate numbers---//
let x = [1, 1, 2, 3, 4, 5, 5]
//let middle = x.count/2
//print(x[middle])

let duplicates = Array(Set(x.filter({ (i: Int) in x.filter({ $0 == i }).count > 1})))
print(duplicates)


/////---- String Reverse---//
let str = "Hello, world!"
let reversed = String(str.reversed())
print(reversed)


let nq = 6598745
let reve = String(describing:nq)
print(String(reve.reversed()))
//
for i in (1...5).reversed() { print(i) } // 5 4 3 2 1


//decimal number to binary in Swift?
let num1 = 22
let decimal = String(num1, radix: 2, uppercase: true)//String(num1, radix: 2)
print(decimal) // prints "10110"

//// binary to decimal number  in Swift?
let binary = Int(decimal, radix: 2)
print(binary!)

//var perfectNum = 20
//var temp = perfectNum
//var perfectSum = 0
//for i in 0...perfectNum-1
//{
//    if (NSInteger(perfectNum % i )==0) {
//    perfectSum = perfectSum + i
//    }
//    if perfectSum == temp {
//        print(temp,"Is a perfect number")
//    }else{
//         print(temp,"Is not a perfect number")
//    }
//}

//let strss = "bookkeeper"
//var set = Set<Character>()
//let squeezed = strss.filter({set.insert($0).inserted})
//
//print(squeezed)   //  "bokepr"
//let numbers = [1, 2, 3, 4, 5]
//print(numbers.max()!)
//print(numbers.min()!)
//
//let array = [1, 3, 5]
//
//if let (maxIndex, maxValue) = array.enumerated().max(by: { $0.element < $1.element }) {
//    print("The max element is \(maxValue) at index \(maxIndex)")
//}
//else {
//    print("The array is empty, and has no max element or index.")
//}
//--------Swift 5 -----



let testArray = ["25 Jun, 2016", "30 Jun, 2016", "28 Jun, 2016", "2 Jul, 2016"]
var convertedArray: [Date] = []

var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd MM, yyyy"// yyyy-MM-dd"

for dat in testArray {
    let date = dateFormatter.date(from: dat)
    if let date = date {
        if dateFormatter.date(from: "28 Jun, 2016")! > date
        {
        convertedArray.append(date)
        }
        
    }
}
print(convertedArray)

var ready = testArray.sorted(by: { $0.compare($1) == .orderedDescending })
//
//print(ready)


