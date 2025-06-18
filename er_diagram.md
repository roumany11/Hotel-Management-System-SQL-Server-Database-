%%{init: { "theme": "forest" }}%%
erDiagram
    ROLE {
        INT id PK
        VARCHAR name
    }
    PERMISSION {
        INT id PK
        VARCHAR name
    }
    ROLE_PERMISSION {
        INT role_id FK
        INT permission_id FK
    }

    HOTEL {
        INT id PK
        VARCHAR name
        VARCHAR address
        VARCHAR phone
        INT manager_id FK
    }
    DEPARTMENT {
        INT id PK
        VARCHAR name
        INT hotel_id FK
        INT head_id FK
    }
    BRANCH {
        INT id PK
        VARCHAR name
        VARCHAR location
        INT hotel_id FK
    }

    STAFF {
        INT id PK
        VARCHAR name
        VARCHAR email
        VARCHAR password_hash
        INT role_id FK
        INT department_id FK
        DATETIME hired_at
        DATETIME last_login
    }
    DEPARTMENT_STAFF {
        INT department_id FK
        INT staff_id FK
    }

    GUEST {
        INT id PK
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR email
        VARCHAR phone
        DATE   joined_at
    }
    ROOM_TYPE {
        INT id PK
        VARCHAR name
        DECIMAL rate
        TEXT    description
    }
    ROOM {
        INT id PK
        VARCHAR number
        INT room_type_id FK
        VARCHAR status
    }
    BOOKING {
        INT id PK
        INT guest_id FK
        INT room_id FK
        INT booked_by FK
        DATE check_in
        DATE check_out
        VARCHAR status
        DATETIME created_at
        DATETIME updated_at
    }
    PAYMENT {
        INT id PK
        INT booking_id FK
        DECIMAL amount
        VARCHAR method
        DATE   paid_on
    }
    INVOICE {
        INT id PK
        INT booking_id FK
        DECIMAL total_amount
        DATE   issued_on
        DATE   due_date
        VARCHAR status
    }

    SERVICE {
        INT id PK
        VARCHAR name
        DECIMAL price
    }
    BOOKING_SERVICE {
        INT booking_id FK
        INT service_id FK
        INT quantity
        DECIMAL total_price
    }

    MAINTENANCE_REQUEST {
        INT id PK
        INT room_id FK
        INT requested_by FK
        TEXT  description
        VARCHAR priority
        VARCHAR status
        DATETIME created_at
        DATETIME resolved_at
    }
    MAINTENANCE_ASSIGN {
        INT request_id FK
        INT staff_id FK
        DATETIME assigned_at
        DATETIME completed_at
    }

    FEEDBACK {
        INT id PK
        INT booking_id FK
        INT guest_id FK
        TEXT content
        INT rating
        DATETIME created_at
    }

    ROLE                 ||--o{ ROLE_PERMISSION          : grants
    PERMISSION           ||--o{ ROLE_PERMISSION          : belongs_to

    HOTEL                ||--o{ DEPARTMENT               : contains
    HOTEL                ||--o{ BRANCH                   : has
    DEPARTMENT           }o--|| HOTEL                    : belongs_to
    BRANCH               }o--|| HOTEL                    : belongs_to

    DEPARTMENT           ||--o{ STAFF                    : employs
    STAFF                }o--|| DEPARTMENT               : works_in

    STAFF                ||--o{ DEPARTMENT_STAFF        : assigned
    DEPARTMENT           ||--o{ DEPARTMENT_STAFF        : has_staff
    DEPARTMENT_STAFF     }o--|| STAFF                    : staff
    DEPARTMENT_STAFF     }o--|| DEPARTMENT               : department

    STAFF                ||--o{ BOOKING                  : creates
    GUEST                ||--o{ BOOKING                  : makes
    ROOM                 ||--o{ BOOKING                  : reserved_in
    BOOKING              }o--|| STAFF                     : booked_by
    BOOKING              }o--|| GUEST                     : guest
    BOOKING              }o--|| ROOM                      : room

    BOOKING              ||--o{ PAYMENT                  : has
    BOOKING              ||--o{ INVOICE                  : billed
    PAYMENT              }o--|| BOOKING                   : for_booking
    INVOICE              }o--|| BOOKING                   : for_booking

    BOOKING              ||--o{ BOOKING_SERVICE          : includes
    SERVICE              ||--o{ BOOKING_SERVICE          : provided_in
    BOOKING_SERVICE      }o--|| BOOKING                   : booking
    BOOKING_SERVICE      }o--|| SERVICE                   : service

    ROOM                 ||--o{ MAINTENANCE_REQUEST      : has_requests
    STAFF                ||--o{ MAINTENANCE_REQUEST      : requests_made
    MAINTENANCE_REQUEST  ||--o{ MAINTENANCE_ASSIGN       : assigned
    STAFF                ||--o{ MAINTENANCE_ASSIGN       : assignments
    MAINTENANCE_ASSIGN   }o--|| MAINTENANCE_REQUEST       : request
    MAINTENANCE_ASSIGN   }o--|| STAFF                     : staff

    BOOKING              ||--o{ FEEDBACK                 : generates
    GUEST                ||--o{ FEEDBACK                 : writes
    FEEDBACK             }o--|| BOOKING                   : booking
    FEEDBACK             }o--|| GUEST                     : guest
