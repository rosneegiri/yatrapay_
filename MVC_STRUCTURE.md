# YatraPay - MVC Architecture

## 📁 Folder Structure

```
lib/
├── models/                    # Data Models (M in MVC)
│   ├── user/
│   │   ├── user_model.dart
│   │   └── user_role.dart
│   ├── booking/
│   │   └── booking_model.dart
│   ├── bus/
│   │   └── bus_model.dart
│   ├── payment/
│   │   └── payment_model.dart
│   └── app_role.dart
│
├── views/                     # UI Screens (V in MVC)
│   ├── auth/
│   │   └── auth_screen.dart
│   ├── admin/
│   │   ├── dashboard_screen.dart
│   │   ├── admin_users_screen.dart
│   │   ├── booking_chart.dart
│   │   ├── stat_card.dart
│   │   └── recent_trips_table.dart
│   ├── vendor/
│   │   ├── vendor_page.dart
│   │   ├── vendor_dashboard_screen.dart
│   │   ├── vendor_trips_screen.dart
│   │   └── vendor_earnings_screen.dart
│   ├── user/
│   │   ├── user_page.dart
│   │   ├── user_home_screen.dart
│   │   ├── user_trips_screen.dart
│   │   ├── qr_scanner_screen.dart
│   │   ├── payment_screen.dart
│   │   └── payment_success_screen.dart
│   └── shared/
│       └── (shared view components)
│
├── controllers/               # Business Logic (C in MVC)
│   ├── auth/
│   │   └── auth_controller.dart
│   ├── admin/
│   │   └── (admin controllers)
│   ├── vendor/
│   │   └── (vendor controllers)
│   └── user/
│       └── (user controllers)
│
├── services/                  # External Services & APIs
│   ├── api/
│   │   └── api_service.dart
│   ├── auth/
│   │   └── auth_service.dart
│   └── storage/
│       └── (storage services)
│
├── widgets/                   # Reusable Widgets
│   ├── hover_card.dart
│   ├── section_title.dart
│   └── (other reusable widgets)
│
├── utils/                     # Utilities & Helpers
│   ├── constants/
│   │   └── app_constants.dart
│   ├── helpers/
│   │   └── date_helper.dart
│   └── validators/
│       └── form_validators.dart
│
├── config/                    # App Configuration
│   ├── routes/
│   │   └── app_routes.dart
│   └── theme/
│       ├── app_theme.dart
│       └── thems.dart
│
├── layout/                    # Layout Components
│   ├── app_layout.dart
│   ├── sidebar.dart
│   └── (other layouts)
│
├── buses/                     # Bus-specific features
├── dashboard/                 # Dashboard components
├── reports/                   # Reports features
│
└── main.dart                  # App Entry Point
```

## 🏗️ MVC Pattern Explanation

### **Models** (Data Layer)
- Represent data structures
- Handle data serialization (toJson/fromJson)
- Define business entities
- Examples: `UserModel`, `BookingModel`, `BusModel`

**Files:**
- `models/user/user_model.dart`
- `models/booking/booking_model.dart`
- `models/bus/bus_model.dart`
- `models/payment/payment_model.dart`

### **Views** (Presentation Layer)
- UI screens and widgets
- Display data to users
- Handle user interactions
- Should be as "dumb" as possible (minimal logic)

**Structure:**
- `views/auth/` - Authentication screens
- `views/admin/` - Admin dashboard and management
- `views/vendor/` - Vendor operations
- `views/user/` - User booking and payment screens

### **Controllers** (Business Logic Layer)
- Handle business logic
- Process user input
- Update models
- Communicate between Views and Services
- Manage state

**Structure:**
- `controllers/auth/` - Authentication logic
- `controllers/admin/` - Admin operations
- `controllers/vendor/` - Vendor business logic
- `controllers/user/` - User operations

### **Services** (Data & API Layer)
- API communication
- Database operations
- External service integration
- Authentication services

**Files:**
- `services/api/api_service.dart` - HTTP client
- `services/auth/auth_service.dart` - Auth API calls
- `services/storage/` - Local storage

### **Utils** (Helper Layer)
- Reusable utility functions
- Constants and configurations
- Validators
- Formatters

**Files:**
- `utils/constants/app_constants.dart`
- `utils/helpers/date_helper.dart`
- `utils/validators/form_validators.dart`

## 🔄 Data Flow

```
User Interaction
       ↓
     View
       ↓
  Controller (Business Logic)
       ↓
    Service (API Call)
       ↓
     Model (Data)
       ↓
  Controller (Process)
       ↓
     View (Update UI)
```

## 📝 Best Practices

1. **Models**
   - Keep models immutable
   - Use `copyWith()` for updates
   - Add JSON serialization
   - No business logic in models

2. **Views**
   - Minimal logic
   - Focus on UI only
   - Use controllers for data
   - Reusable widgets in `widgets/`

3. **Controllers**
   - Single responsibility
   - Handle state management
   - Call services for data
   - Process business rules

4. **Services**
   - One service per domain
   - Handle API errors
   - Use singleton pattern
   - Return typed responses

## 🚀 Usage Examples

### Creating a New Feature

1. **Create Model:**
   ```dart
   // models/trip/trip_model.dart
   class TripModel { ... }
   ```

2. **Create Service:**
   ```dart
   // services/trip/trip_service.dart
   class TripService { ... }
   ```

3. **Create Controller:**
   ```dart
   // controllers/user/trip_controller.dart
   class TripController { ... }
   ```

4. **Create View:**
   ```dart
   // views/user/trip_screen.dart
   class TripScreen extends StatelessWidget { ... }
   ```

## 📦 Dependencies

Add to `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0  # For API calls
  intl: ^0.18.0  # For date formatting
  shared_preferences: ^2.2.0  # For local storage
```

## 🔧 Next Steps

1. Update import paths in existing files
2. Move remaining files to appropriate folders
3. Create missing controllers
4. Implement proper state management (Provider/Riverpod/Bloc)
5. Add error handling
6. Write unit tests

---

**Note:** This structure follows Flutter best practices combined with MVC patterns for better code organization, maintainability, and scalability.
