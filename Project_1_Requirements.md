# Project 1 – Book Management Application (Python, SOLID Architecture)

## Overview
Project 1 is a **Python Book Management Application** designed using **SOLID design principles** and a layered architecture. The goal of this project is to demonstrate clean separation of concerns, maintainable code structure, and integration of both traditional application logic and data science tooling.

---

## Architectural Requirements

The project must follow **SOLID design principles**:

- **S – Single Responsibility Principle**  
  Each class or module should have one clear responsibility.
- **O – Open/Closed Principle**  
  Code should be open for extension but closed for modification.
- **L – Liskov Substitution Principle**  
  Subtypes must be usable in place of their base types.
- **I – Interface Segregation Principle**  
  Avoid forcing classes to depend on methods they do not use.
- **D – Dependency Inversion Principle**  
  Depend on abstractions, not concrete implementations.

---

## Layered Structure

The application will be organized into the following layers:

### 1. Application Layer
- Contains a **single file**: `repl.py`
- Responsible for:
  - User interaction
  - Command parsing
  - Displaying output
  - Delegating business logic to services
- Should **not** contain business logic or data access code.

---

### 2. Domain Layer
- Contains core business entities and rules and the Book object.
- Responsibilities:
  - Data validation
  - Pure business logic
- No direct database or UI dependencies.

---

### 3. Repository Layer
- Handles **data persistence and retrieval**.
- JSON for P1, SQL for P2
- Responsibilities:
  - CRUD operations at the storage level
  - Abstract interfaces for swapping implementations
- Should not contain business rules.

---

### 4. Service Layer
- Contains **application/business logic**.
- Responsibilities:
  - Coordinating workflows
  - Enforcing policies
  - Calling repository methods
  - Returning processed results

---

## Core Functional Features

### CRUD Operations on Books
- **Create** a book
- **Read** / list books
- **Update** book information
- **Delete** a book

#### Book Fields
- title: str
- author: str
- genre: Optional[int]
- publication_year: Optional[int]
- page_count: Optional[int]
- average_rating: Optional[float]
- ratings_count: Optional[int]
- price_usd: Optional[float]
- publisher: Optional[str]
- language: Optional[str]
- format: Optional[str]
- in_print: Optional[bool]
- sales_millions: Optional[float]
- last_checkout: Optional[str]
- available: Optional[bool]
- book_id: str
---

### Library Workflow Features
- **Check-Out Book**
  - Mark a book as unavailable.
- **Check-In Book**
  - Mark a book as available.
- **Checkout History**
  - Track when books are checked in/out
- **Due Dates (Stretch Goal)**
  - Track who last checked out a book by their email
  - Notify them 7 days before their due date

---

## Analytics Features

The application will also include a **data science component** focused on analyzing the book dataset.

### Required Libraries
- **NumPy** – numerical operations and array manipulation
- **Pandas** – data cleaning, transformation, and tabular analysis
- **Matplotlib** – visualizations and charts
- **Jupyter Notebooks** – interactive analysis and reporting

---

## Analytics Requirements
- Use pandas DataFrames as the data source
- Clean data
- Create a bar chart that shows which genres are most common
- Create a bar chart that shows which genres tend to be rated highest
  - Use a Bayesion Average and sort columns in descending order: 
  ```
   weighted_rating = (median_ratings_count / (median_ratings_count + m)) * mean_average_rating
   + (m / (median_ratings_count + m)) * mean_average_rating_all_books
   
   m = minimum ratings threshold (50-100 recommended)
   ```
- Create a scatter plot that shows if higher priced books have better ratings
- Create a line chart that shows books released by year
- Create a pie chart that shows our checked in vs available books

---