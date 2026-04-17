<?php
$page = $_GET['page'] ?? 'dashboard';
$pages = [
    'dashboard'     => __DIR__ . '/pages/dashboard.php',
    'branches'      => __DIR__ . '/pages/branches.php',
    'employees'     => __DIR__ . '/pages/employees.php',
    'customers'     => __DIR__ . '/pages/customers.php',
    'accounts'      => __DIR__ . '/pages/accounts.php',
    'transactions'  => __DIR__ . '/pages/transactions.php',
    'loans'         => __DIR__ . '/pages/loans.php',
    'loan_payments' => __DIR__ . '/pages/loan_payments.php',
];
require __DIR__ . '/includes/header.php';
require $pages[$page] ?? $pages['dashboard'];
require __DIR__ . '/includes/footer.php';
