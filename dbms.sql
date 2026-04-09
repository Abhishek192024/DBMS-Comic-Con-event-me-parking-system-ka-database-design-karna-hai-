
//  VEHICLE 

// ye vehicle table hai (jo parking me aate hain)
vehicles [icon: car, color: blue] {
  vehicle_id int pk
  vehicle_number string   // number plate
  vehicle_category_id int   // FK (bike, car, SUV etc.)
}

// ye vehicle category hai (vehicle types)
vehicle_categories [icon: truck, color: purple] {
  vehicle_category_id int pk
  category_name string   // bike, car, SUV, EV
}

//PARKING STRUCTURE 

// ye parking zones hai (alag-alag area ya level)
parking_zones [icon: map, color: orange] {
  zone_id int pk
  zone_name string
  level string   // basement, ground, etc.
}

// ye parking spots hai (actual jagah jaha vehicle park hota hai)
parking_spots [icon: square, color: blue] {
  spot_id int pk
  zone_id int
  spot_category_id int
  is_available boolean   // free hai ya occupied
}

// ye reserved category hai (VIP, staff, EV, cosplayer etc.)
spot_categories [icon: star, color: red] {
  spot_category_id int pk
  category_name string
}

// SESSION & TICKET 

// ye parking session hai (entry + exit track karta hai)
parking_sessions [icon: clock, color: green] {
  session_id int pk
  vehicle_id int
  spot_id int
  entry_time timestamp
  exit_time timestamp   // null ho sakta hai (jab tak vehicle andar hai)
  status string   // active / completed
}

// ye ticket hai (entry ke time generate hota hai)
tickets [icon: file-text, color: purple] {
  ticket_id int pk
  session_id int
  issue_time timestamp
}

//  PAYMENT

// ye payment record hai (exit ke baad)
payments [icon: credit-card, color: green] {
  payment_id int pk
  session_id int
  amount number
  payment_status string   // paid / pending
  payment_time timestamp
}

//  RELATIONS 

// ek category me multiple vehicles ho sakte hain
vehicle_categories.vehicle_category_id < vehicles.vehicle_category_id

// ek zone me multiple parking spots hote hain
parking_zones.zone_id < parking_spots.zone_id

// ek category me multiple spots ho sakte hain (VIP, EV etc.)
spot_categories.spot_category_id < parking_spots.spot_category_id

// ek vehicle multiple baar entry kar sakta hai (multiple sessions)
vehicles.vehicle_id < parking_sessions.vehicle_id

// ek spot multiple sessions me reuse ho sakta hai
parking_spots.spot_id < parking_sessions.spot_id

// ek session ka ek ticket hota hai
parking_sessions.session_id - tickets.session_id

// ek session ka payment hota hai
parking_sessions.session_id < payments.session_id
