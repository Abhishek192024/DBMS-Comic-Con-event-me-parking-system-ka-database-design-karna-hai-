# 🚗 Parking System (Comic-Con Event) - ER Diagram

## 📌 Project Overview
This project represents the database design (ER Diagram) for a multi-zone event parking system.

The system is designed for a large event like Comic-Con where multiple vehicles enter and exit across different zones and levels.

It manages:
- Vehicles and their categories
- Parking zones and spots
- Reserved parking categories (VIP, staff, EV, etc.)
- Parking sessions (entry and exit tracking)
- Tickets generated during entry
- Payments for parking

---

## 🎯 Objective
To design a structured and scalable database model that supports:
Vehicle Entry → Spot Allocation → Parking Session → Ticket → Payment

---

## 🧱 Entities Included
- **Vehicles**
- **Vehicle_Categories**
- **Parking_Zones**
- **Parking_Spots**
- **Spot_Categories**
- **Parking_Sessions**
- **Tickets**
- **Payments**

---

## 🔗 Relationships
- One vehicle belongs to one vehicle category
- One vehicle can have multiple parking sessions
- One parking zone contains multiple parking spots
- One parking spot belongs to a zone and category
- One parking spot can be reused across multiple sessions
- One parking session generates one ticket
- One parking session has a payment record


## 👨‍💻 Author
Your Name
