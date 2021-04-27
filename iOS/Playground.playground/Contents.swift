
import SwiftUI


func durationString(from interval: Double) -> String {
    if interval == 0 {
        return "0:00"
    }
    
    var string = interval < 0 ? "-" : ""
    let absInterval = abs(interval)
    let seconds = absInterval.truncatingRemainder(dividingBy: 60)
    let minutes = Int(absInterval / 60)

    string += String(minutes)
    string += ":"
    if seconds < 10 {
        string += "0"
    }
    string += String(Int(seconds))
    return string
}


durationString(from: 0)
durationString(from: 2.0)
durationString(from: 15.0)
durationString(from: 23.0)
durationString(from: 115.0)
durationString(from: 120.0)
durationString(from: -125.0)
durationString(from: -120.0)
durationString(from: -72.0)
durationString(from: -45.0)
durationString(from: -5.0)

