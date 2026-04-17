# Bank Management System for XAMPP

This version is designed only for PHP + MySQL on XAMPP.

## Run Steps

1. Copy `bank-management-system` into `C:\xampp\htdocs\`
2. Start Apache and MySQL from XAMPP
3. Open phpMyAdmin
4. Import `database/setup.sql`
5. Open `http://localhost/bank-management-system/`

## Database Connection

The MySQL connection file is:

- `config/db.php`

It uses:

- host: `localhost`
- user: `root`
- password: empty
- database: `bank_management_system`

## Important

- This system does not use SQLite
- It is built for MySQL only
- It uses simple `mysqli` code for easy understanding
