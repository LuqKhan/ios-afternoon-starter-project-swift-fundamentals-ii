import UIKit


//: ## 1. Create custom types to represent an Airport Departures display
//: ![Airport Departures](matthew-smith-5934-unsplash.jpg)
//: Look at data from [Departures at JFK Airport in NYC](https://www.airport-jfk.com/departures.php) for reference.
//:
//: a. Use an `enum` type for the FlightStatus (En Route, Scheduled, Canceled, Delayed, etc.)
//:
//: b. Use a struct to represent an `Airport` (Destination or Arrival)
//:
//: c. Use a struct to represent a `Flight`.
//:
//: d. Use a `Date?` for the departure time since it may be canceled.
//:
//: e. Use a `String?` for the Terminal, since it may not be set yet (i.e.: waiting to arrive on time)
//:
//: f. Use a class to represent a `DepartureBoard` with a list of departure flights, and the current airport
enum FlightStatus: String {
    case EnRoute
    case Scheduled
    case Canceled
    case Delayed
    case Boarding
    
}

struct Airport {
    var airportDestination: String
    
}

struct Flight {
    var airline: String
    var departureTime: Date?
    var terminal: String?
    var flightStatus: FlightStatus
    

}

class DepartureBoard {
    var departureFlights: [Flight]
    var currentAirport: Airport
    
    init(currentAirport: Airport) {
        self.currentAirport = currentAirport
         departureFlights = []
        
    }

    func alertPassengers() {
        
        for flight in departureFlights {
            
            if flight.flightStatus == FlightStatus.Canceled {
                
                print ("We're sorry your flight to (city) was canceled, here is a $500 voucher")
                
            }else if flight.flightStatus == FlightStatus.Scheduled {
                
                print("Your flight to (city) is scheduled to depart at (time) from terminal: (terminal)")
            }else if flight.flightStatus == FlightStatus.Boarding {
                print("Your flight is boarding, please head to terminal: (terminal) immediately. The doors are closing soon.")
                
            }
            
        }
    }

}

//: ## 2. Create 3 flights and add them to a departure board
//: a. For the departure time, use `Date()` for the current time
//:
//: b. Use the Array `append()` method to add `Flight`'s
//:
//: c. Make one of the flights `.canceled` with a `nil` departure time
//:
//: d. Make one of the flights have a `nil` terminal because it has not been decided yet.
//:
//: e. Stretch: Look at the API for [`DateComponents`](https://developer.apple.com/documentation/foundation/datecomponents?language=objc) for creating a specific time





let flight1 = Flight(airline: "Delta Air Lines", departureTime: Date(), terminal: "4", flightStatus: .EnRoute)
let flight2 = Flight(airline: "Air France", departureTime: Date(), terminal: "4", flightStatus: .Scheduled)
let flight3 = Flight(airline: "Aeromexico", departureTime: nil, terminal: "4", flightStatus: .Canceled)
let airport = Airport(airportDestination: "LAX")

var departureBoardInstance = DepartureBoard(currentAirport: airport)

 departureBoardInstance.departureFlights.append(flight1)

 departureBoardInstance.departureFlights.append(flight2)

departureBoardInstance.departureFlights.append(flight3)





//: ## 3. Create a free-standing function that can print the flight information from the `DepartureBoard`
//: a. Use the function signature: `printDepartures(departureBoard:)`
//:
//: b. Use a `for in` loop to iterate over each departure
//:
//: c. Make your `FlightStatus` enum conform to `String` so you can print the `rawValue` String values from the `enum`. See the [enum documentation](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html).
//:
//: d. Print out the current DepartureBoard you created using the function
/*func printDepartures()  {
    
    for flight in departureBoardInstance.departureFlights {
        
        
      print(flight)
 
   
    }
    
}



printDepartures()

*/

/*4. Make a second function to print print an empty string if the departureTime is nil

a. Createa new printDepartures2(departureBoard:) or modify the previous function

b. Use optional binding to unwrap any optional values, use string interpolation to turn a non-optional date into a String

c. Call the new or udpated function. It should not print Optional(2019-05-30 17:09:20 +0000) for departureTime or for the Terminal.

d. Stretch: Format the time string so it displays only the time using a DateFormatter look at the dateStyle (none), timeStyle (short) and the string(from:) method

e. Your output should look like:

Destination: Los Angeles Airline: Delta Air Lines Flight: KL 6966 Departure Time:  Terminal: 4 Status: Canceled
Destination: Rochester Airline: Jet Blue Airways Flight: B6 586 Departure Time: 1:26 PM Terminal:  Status: Scheduled
Destination: Boston Airline: KLM Flight: KL 6966 Departure Time: 1:26 PM Terminal: 4 Status: Scheduled
*/




func printDepartures2() {
    for flight in departureBoardInstance.departureFlights{
    
    var terminalString: String = ""
    
    if let terminal = flight.terminal {
        
        
        terminalString = terminal
    } else {
        
        terminalString = "TBD"
        }
    
        
    
    var departureTimeString: String = ""
    
    if let departureTime = flight.departureTime {
        
      ///  let stringDescription = "\(departureTime)"
        departureTimeString = "\(departureTime)"
        
    }else {
        
        departureTimeString = "TBD"
        }
    
  
        print("Airline: \(flight.airline), DepartureTime: \(departureTimeString), Terimanl: \(terminalString), FlightStatus: \(flight.flightStatus)")
   
    
    }

   
    
}

printDepartures2()



//: ## 5. Add an instance method to your `DepatureBoard` class (above) that can send an alert message to all passengers about their upcoming flight. Loop through the flights and use a `switch` on the flight status variable.
//: a. If the flight is canceled print out: "We're sorry your flight to \(city) was canceled, here is a $500 voucher"
//:
//: b. If the flight is scheduled print out: "Your flight to \(city) is scheduled to depart at \(time) from terminal: \(terminal)"
//:
//: c. If their flight is boarding print out: "Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon."
//:
//: d. If the `departureTime` or `terminal` are optional, use "TBD" instead of a blank String
//:
//: e. If you have any other cases to handle please print out appropriate messages
//:
//: d. Call the `alertPassengers()` function on your `DepartureBoard` object below
//:
//: f. Stretch: Display a custom message if the `terminal` is `nil`, tell the traveler to see the nearest information desk for more details.


departureBoardInstance.alertPassengers()

//: ## 6. Create a free-standing function to calculate your total airfair for checked bags and destination
//: Use the method signature, and return the airfare as a `Double`
//:
//:     func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
//:     }
//:
//: a. Each bag costs $25
//:
//: b. Each mile costs $0.10
//:
//: c. Multiply the ticket cost by the number of travelers
//:
//: d. Call the function with a variety of inputs (2 bags, 2000 miles, 3 travelers = $750)
//:
//: e. Make sure to cast the numbers to the appropriate types so you calculate the correct airfare
//:
//: f. Stretch: Use a [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) with the `currencyStyle` to format the amount in US dollars.
func calculateAirFare (checkedBags: Int, distance: Int, travelers: Int) -> Double {
    
    let ticketCost = (Double(checkedBags * 25) + (Double(distance) * 0.10)) * Double(travelers)
    
    return ticketCost
    
}


print(calculateAirFare(checkedBags: 2, distance: 2000, travelers: 3))
