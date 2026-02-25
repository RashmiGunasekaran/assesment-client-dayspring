# Dayspring Shopline – Intern Assessment
Dayspring Shopline is a Rails 8 e-commerce–style application used as a boilerplate for intern assessment.  
Candidates are expected to implement features on top of the provided structure by following best practices.

This repository intentionally contains partial implementations.  
There is no single “correct” solution — design choices matter.

## Tech Stack

- **Ruby:** 3.3.x  
- **Rails:** 8.1.x  
- **Database:** PostgreSQL  
- **Authentication:** Devise  
- **Frontend:** Bootstrap 5 (via Importmap)  
- **JavaScript:** Importmap + Turbo  
- **File Uploads:** Active Storage  

---

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Ruby 3.3+
- Rails 8.1+
- PostgreSQL (running locally)
- Bundler

---

### Clone the Repository and Install Dependencies

goto your bash and provide the below commands

git clone <your-repo-url>
cd dayspring_shopline
bundle install
rails db:setup
rails db:seed
rails s

🔐 Authentication & Login

This application uses Devise for authentication.

###Sign Up
- Sign up is enabled for testing purposes.
- Newly registered users default to the customer role.
- Interns are encouraged to use seeded credentials instead of signing up.

👥 Seeded Login Credentials
  🔑 Admin Users
    admin0@dayspring.com
    admin1@dayspring.com
  🏪 Vendor Users
    vendor0@dayspring.com
    vendor1@dayspring.com
    vendor2@dayspring.com
  🛍 Customer Users
    customer0@dayspring.com
    customer1@dayspring.com
    customer2@dayspring.com
  
  (Many additional seeded users are available.)

  🧭 Application Structure
User Roles

The application uses a single users table with a role enum.

Customer → User with role customer

Vendor → User with role vendor + associated Vendor record

Admin → User with role admin

There is no separate customers table by design.

Controllers

All controllers already exist

Each controller includes:

before_action :authenticate_user!

Only minimal actions (index, show) are implemented

Candidates are expected to:

add new actions

add business logic

refactor controllers

enforce authorization rules

Routing

Only basic RESTful routes are provided.

Candidates must:

design task-specific routes

choose between member vs collection routes

follow REST conventions

avoid non-RESTful “junk” routes

🎨 UI & Theme

Bootstrap 5 is used for styling

JavaScript is handled via Importmap

A soft pink theme is applied

Sidebar visibility is role-based

Authorization is not enforced in views by default

UI scaffolding exists for usability only — it is not a solution.

📦 Active Storage

Active Storage is installed and ready to use.

Candidates may:

attach files to models

apply validations

design upload and preview UI

📋 Assessment Instructions

All assessment tasks are documented in:

ASSESSMENT.md
Global Rules (Apply to ALL Tasks)

Keep controllers thin

Move business logic to models

Use scopes where appropriate

Avoid N+1 queries

Use database transactions when data consistency matters

Follow Rails best practices

🧪 Development Notes (Important)
Bootstrap + Turbo

Bootstrap JavaScript components are initialized on Turbo page loads.

When adding new Bootstrap components (dropdowns, modals, tooltips), ensure they are compatible with Turbo navigation.

Known Non-Issues (Safe to Ignore)

You may see log entries such as:

No route matches [GET] "/_/xxxx.js"
No route matches [GET] "/.well-known/..."

These are browser or devtool requests and do not indicate application errors.

🔒 Branching Strategy

boilerplate / main branch

Contains only the starter application

No intern solutions are merged here

evaluator branch

Interns raise Pull Requests against this branch

Used for evaluation and review

✅ Expected Outcome for Candidates

By completing the assessment, candidates should demonstrate:

Strong understanding of Rails models & associations

RESTful routing design

Query optimization

Business rule enforcement

Clean controller structure

Reasonable UI/UX decisions

🌸 Final Note

This codebase is intentionally incomplete.

You are expected to:

think critically

design clean solutions

refactor where necessary

explain your decisions

There is no single correct implementation.

Happy coding 💐
— Dayspring Engineering Team

---
