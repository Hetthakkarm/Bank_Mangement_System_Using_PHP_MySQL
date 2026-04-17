<?php require_once __DIR__ . '/functions.php'; $flash = flash_get(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Bank Management System — manage branches, employees, customers, accounts, transactions and loans.">
    <title>BankMS — <?= esc(ucfirst(page_name())) ?></title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <input type="checkbox" id="nav-toggle" class="nav-toggle">
    <label for="nav-toggle" class="nav-overlay"></label>
    <div class="app-shell">
        <aside class="sidebar">
            <div class="sidebar-head">
                <div>
                    <div class="brand">BankMS</div>
                    <div class="brand-sub">Management Suite</div>
                </div>
                <label for="nav-toggle" class="close-nav">×</label>
            </div>
            <nav class="nav-links">
                <a class="<?= page_name()==='dashboard'?'active':'' ?>" href="index.php">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                    <span>Dashboard</span>
                </a>
                <a class="<?= page_name()==='branches'?'active':'' ?>" href="index.php?page=branches">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
                    <span>Branches</span>
                </a>
                <a class="<?= page_name()==='employees'?'active':'' ?>" href="index.php?page=employees">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4-4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg>
                    <span>Employees</span>
                </a>
                <a class="<?= page_name()==='customers'?'active':'' ?>" href="index.php?page=customers">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4-4v2"/><circle cx="12" cy="7" r="4"/></svg>
                    <span>Customers</span>
                </a>
                <a class="<?= page_name()==='accounts'?'active':'' ?>" href="index.php?page=accounts">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="5" width="20" height="14" rx="2"/><line x1="2" y1="10" x2="22" y2="10"/></svg>
                    <span>Accounts</span>
                </a>
                <a class="<?= page_name()==='transactions'?'active':'' ?>" href="index.php?page=transactions">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/><polyline points="17 6 23 6 23 12"/></svg>
                    <span>Transactions</span>
                </a>
                <a class="<?= page_name()==='loans'?'active':'' ?>" href="index.php?page=loans">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 000 7h5a3.5 3.5 0 010 7H6"/></svg>
                    <span>Loans</span>
                </a>
                <a class="<?= page_name()==='loan_payments'?'active':'' ?>" href="index.php?page=loan_payments">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                    <span>Loan Payments</span>
                </a>
            </nav>
            <div class="sidebar-footer">
                <div class="sidebar-footer-text">© <?= date('Y') ?> BankMS</div>
            </div>
        </aside>
        <main class="main-shell">
            <header class="topbar">
                <div class="topbar-left">
                    <label for="nav-toggle" class="hamburger" aria-label="Open navigation">
                        <span></span><span></span><span></span>
                    </label>
                    <div class="app-title">Bank Management System</div>
                </div>
                <div class="topbar-right">
                    <div class="topbar-date"><?= date('D, d M Y') ?></div>
                </div>
            </header>
            <?php if ($flash): ?>
            <div class="flash-banner flash-<?= esc($flash['type']) ?>">
                <span class="flash-icon"><?= $flash['type'] === 'success' ? '✓' : '✕' ?></span>
                <?= esc($flash['message']) ?>
                <button class="flash-close" onclick="this.parentElement.remove()">×</button>
            </div>
            <?php endif; ?>
            <section class="content">
