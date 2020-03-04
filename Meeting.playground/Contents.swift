import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
dateFormatter.timeZone = TimeZone(abbreviation: "GMT")

let k = 3600.0

struct Meeting {
    var dateString: String
    var durationInHour: Double
    var participants: [String]
    var startDate: Date
    var endDate: Date
    
    
    init(dateString: String, participants: [String], duration: Double) {
        self.dateString = dateString
        self.participants = participants
        self.durationInHour = duration
        self.startDate = dateFormatter.date(from: dateString)!
        self.endDate = startDate.advanced(by: TimeInterval(durationInHour * k))
    }
}


let meet1 = Meeting(dateString: "06/03/2020 10:30", participants: ["Hayk", "Kleg", "Bob"], duration: 1)
let meet2 = Meeting(dateString: "07/03/2020 09:00", participants: ["Kleg", "Teylor"], duration: 2)
let meet3 = Meeting(dateString: "06/03/2020 13:30", participants: ["Hak", "Bak", "Nak","Fleg"], duration: 1)
var listOfMeetings: [Meeting] = [meet1, meet2, meet3]

// Condition test for new meeting.
let meet = Meeting(dateString: "06/03/2020 10:00", participants: ["Hayko","Kleg", "Fleg"], duration: 2)


// Task1: Participants can be at one meeting. Schedule: 09:00 - 20:00.
func meetIsOK(meet: Meeting) -> String {
    var listOfParticipants = [String]()
    var count1: Int = 0
    var count2: Int = 0
    
    for m in listOfMeetings {
        if m.startDate.distance(to: meet.startDate) < 39600 {
            if meet.startDate >= m.endDate {
                count1 += 1
            } else {
                if meet.endDate > m.startDate {
                    for m in listOfMeetings {
                        for p in m.participants {
                            for pp in meet.participants {
                                if pp == p {
                                    listOfParticipants.append(pp)
                                }
                            }
                        }
                    }
                    if listOfParticipants.isEmpty == false {
                        return ("\(listOfParticipants) should be at meeting at this time")
                    }
                }
            }
        } else {
            count1 += 1
            count2 += 1
        }
    }
    if count1 == listOfMeetings.count || count2 == listOfMeetings.count {
        return "All participants can attend the meeting."
    }
    return "All participants can attend the meeting."
}

meetIsOK(meet: meet)


// Task2: The participant will have a meeting.

func meetingsOfParticipant(name: String){
    var output = [String]()
    
    for m in listOfMeetings {
        for p in m.participants {
            if name == p {
                output.append("\(name) will have a meeting at \(m.startDate) which will last \(m.durationInHour) hour")
                print("will have a meeting")
            }
        }
    }
    for i in output {
        print("\(i)")
    }
}

meetingsOfParticipant(name: "Kleg")

// Task3: Daily meeting list.

func meetingForDay(date: Date) {
    var meetingArray = [Meeting]()
    for m in listOfMeetings {
        if date.distance(to: m.startDate) < 39600 {
            meetingArray.append(m)
        }
    }
    for i in meetingArray {
        print("Meeting for today is \(i)")
    }
}

let dateString = "06/03/2020 09:00"
let dateOfMeeting = dateFormatter.date(from: dateString)

meetingForDay(date: dateOfMeeting!)


// Task4: Office has one meeting room. Booking time should not coincide.

func meetTimeIsOk(meet: Meeting) -> String {
    var count1: Int = 0
    var count2: Int = 0
    for m in listOfMeetings {
        if m.startDate.distance(to: meet.startDate) < 86400 {
            if meet.startDate >= m.endDate {
                count1 += 1
            } else {
                if meet.endDate > m.startDate {
                    return "FAIL"
                }
            }
        } else {
            count1 += 1
            count2 += 1
        }
    }
    if count1 == listOfMeetings.count || count2 == listOfMeetings.count {
        return "OK"
    }
    return "OK"
}

meetTimeIsOk(meet: meet)






