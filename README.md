# The Mensan Elites Society - Full Stack Web Application

This repository contains the full front-end and back-end source code for **The Mensan Elites Society** website.

## Directory Structure
- `index.html`: The HTML5/CSS3 single-page UI integrated with asynchronous fetch calls.
- `db.php`: Database connection configuration using PHP PDO.
- `api.php`: The RESTful API handling endpoints for rooms, books, activities, and membership applications.
- `schema.sql`: MySQL database schema script with table structures and initial sample data.

## Setup Instructions

1. **Database Setup:**
   - Import `schema.sql` into your MySQL server (using PHPMyAdmin or command-line MySQL):
     ```bash
     mysql -u root -p < schema.sql
     ```

2. **PHP Backend Configuration:**
   - Open `db.php` and update `$host`, `$db`, `$user`, and `$pass` to match your local server credentials.

3. **Running the Application:**
   - Place all files in your web server directory (e.g., XAMPP `htdocs`, WAMP `www`, or Nginx/Apache root).
   - Alternatively, start a PHP development server inside this directory:
     ```bash
     php -S localhost:8000
     ```
   - Open your browser and navigate to `http://localhost:8000/index.html`.
