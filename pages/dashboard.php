<?php
/* ── Counts ─────────────────────────────────────────────── */
$branchCount      = q_one("SELECT COUNT(*) AS total FROM branches");
$employeeCount    = q_one("SELECT COUNT(*) AS total FROM employees");
$customerCount    = q_one("SELECT COUNT(*) AS total FROM customers WHERE status='active'");
$accountCount     = q_one("SELECT COUNT(*) AS total FROM accounts WHERE status='active'");
$transactionCount = q_one("SELECT COUNT(*) AS total FROM transactions");
$loanCount        = q_one("SELECT COUNT(*) AS total FROM loans WHERE status IN ('approved','active')");

/* ── Financial summaries ────────────────────────────────── */
$totalDeposits = q_one("SELECT COALESCE(SUM(te.amount),0) AS total FROM transaction_entries te WHERE te.entry_role='credit'");
$totalWithdrawals = q_one("SELECT COALESCE(SUM(te.amount),0) AS total FROM transaction_entries te WHERE te.entry_role='debit'");
$totalLoanDisbursed = q_one("SELECT COALESCE(SUM(principal_amount),0) AS total FROM loans WHERE status IN ('approved','active')");
$totalLoanPaid = q_one("SELECT COALESCE(SUM(amount_paid),0) AS total FROM loan_payments");

/* ── Recent transactions ────────────────────────────────── */
$recentTxn = q_all("SELECT t.transaction_id, tt.type_name, t.reference_no, t.amount, t.transaction_date,
                           CONCAT(e.first_name, ' ', e.last_name) AS employee_name
                    FROM transactions t
                    JOIN transaction_types tt ON tt.transaction_type_id = t.transaction_type_id
                    JOIN employees e ON e.employee_id = t.initiated_by
                    ORDER BY t.transaction_date DESC, t.transaction_id DESC
                    LIMIT 6");

/* ── Top 5 branches by employees ────────────────────────── */
$topBranches = q_all("SELECT b.branch_name, COUNT(e.employee_id) AS emp_count
                      FROM branches b
                      LEFT JOIN employees e ON e.branch_id = b.branch_id
                      GROUP BY b.branch_id, b.branch_name
                      ORDER BY emp_count DESC
                      LIMIT 5");
$maxEmp = 1;
foreach ($topBranches as $tb) { if ((int)$tb['emp_count'] > $maxEmp) $maxEmp = (int)$tb['emp_count']; }

/* ── Recent loans ───────────────────────────────────────── */
$recentLoans = q_all("SELECT l.loan_number, l.principal_amount, l.interest_rate, l.status,
                             lt.type_name,
                             CONCAT(c.first_name, ' ', c.last_name) AS customer_name
                      FROM loans l
                      JOIN loan_types lt ON lt.loan_type_id = l.loan_type_id
                      JOIN customers c ON c.customer_id = l.customer_id
                      ORDER BY l.loan_id DESC
                      LIMIT 5");
?>

<div class="page-header">
    <div>
        <h2 class="page-title">Dashboard</h2>
        <div class="page-subtle">Welcome back — here's your overview</div>
    </div>
</div>

<!-- Stats Cards -->
<div class="stats-grid" style="margin-bottom:28px;">
    <div class="stat-card">
        <div class="stat-icon">🏛️</div>
        <h3>Branches</h3>
        <div class="stat-value"><?= esc($branchCount['total'] ?? 0) ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-icon">👥</div>
        <h3>Employees</h3>
        <div class="stat-value"><?= esc($employeeCount['total'] ?? 0) ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-icon">🧑‍💼</div>
        <h3>Customers</h3>
        <div class="stat-value"><?= esc($customerCount['total'] ?? 0) ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-icon">💳</div>
        <h3>Active Accounts</h3>
        <div class="stat-value"><?= esc($accountCount['total'] ?? 0) ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-icon">📊</div>
        <h3>Transactions</h3>
        <div class="stat-value"><?= esc($transactionCount['total'] ?? 0) ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-icon">🏦</div>
        <h3>Active Loans</h3>
        <div class="stat-value"><?= esc($loanCount['total'] ?? 0) ?></div>
    </div>
</div>

<!-- Financial Summary -->
<div class="stats-grid stats-grid-2" style="margin-bottom:28px;">
    <div class="stat-card finance-card">
        <h3>Total Deposits</h3>
        <div class="stat-value stat-value-sm text-green"><?= inr((float)($totalDeposits['total'] ?? 0)) ?></div>
        <div class="stat-trend trend-up">↑ Credits received</div>
    </div>
    <div class="stat-card finance-card">
        <h3>Total Withdrawals</h3>
        <div class="stat-value stat-value-sm text-red"><?= inr((float)($totalWithdrawals['total'] ?? 0)) ?></div>
        <div class="stat-trend trend-down">↓ Debits processed</div>
    </div>
    <div class="stat-card finance-card">
        <h3>Loan Portfolio</h3>
        <div class="stat-value stat-value-sm text-blue"><?= inr((float)($totalLoanDisbursed['total'] ?? 0)) ?></div>
        <div class="stat-trend">Disbursed principal</div>
    </div>
    <div class="stat-card finance-card">
        <h3>EMI Collected</h3>
        <div class="stat-value stat-value-sm text-emerald"><?= inr((float)($totalLoanPaid['total'] ?? 0)) ?></div>
        <?php
            $outstanding = (float)($totalLoanDisbursed['total'] ?? 0) - (float)($totalLoanPaid['total'] ?? 0);
            $pct = ($totalLoanDisbursed['total'] > 0) ? round(((float)$totalLoanPaid['total'] / (float)$totalLoanDisbursed['total']) * 100, 1) : 0;
        ?>
        <div class="progress-bar-wrap">
            <div class="progress-bar" style="width:<?= $pct ?>%"></div>
        </div>
        <div class="stat-trend"><?= $pct ?>% recovered</div>
    </div>
</div>

<!-- Two-column panels -->
<div class="dashboard-grid">
    <!-- Recent Transactions -->
    <div class="panel">
        <div class="panel-header">
            <h3>Recent Transactions</h3>
            <a href="index.php?page=transactions" class="panel-link">View all →</a>
        </div>
        <div class="txn-list">
            <?php if (empty($recentTxn)): ?>
                <p class="empty-state">No transactions yet.</p>
            <?php else: ?>
                <?php foreach ($recentTxn as $tx): ?>
                <div class="txn-item">
                    <div class="txn-icon <?= str_contains(strtolower($tx['type_name']), 'deposit') ? 'txn-credit' : (str_contains(strtolower($tx['type_name']), 'withdrawal') ? 'txn-debit' : 'txn-transfer') ?>">
                        <?php if (str_contains(strtolower($tx['type_name']), 'deposit')): ?>↓
                        <?php elseif (str_contains(strtolower($tx['type_name']), 'withdrawal')): ?>↑
                        <?php else: ?>⇄
                        <?php endif; ?>
                    </div>
                    <div class="txn-details">
                        <div class="txn-type"><?= esc($tx['type_name']) ?></div>
                        <div class="txn-meta"><?= esc($tx['reference_no']) ?> · <?= esc($tx['employee_name']) ?></div>
                    </div>
                    <div class="txn-right">
                        <div class="txn-amount <?= str_contains(strtolower($tx['type_name']), 'deposit') ? 'text-green' : 'text-red' ?>"><?= inr((float)$tx['amount']) ?></div>
                        <div class="txn-date"><?= date('d M, H:i', strtotime($tx['transaction_date'])) ?></div>
                    </div>
                </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>

    <!-- Right column -->
    <div class="dashboard-right-col">
        <!-- Top Branches -->
        <div class="panel">
            <div class="panel-header">
                <h3>Top Branches</h3>
                <a href="index.php?page=branches" class="panel-link">View all →</a>
            </div>
            <div class="branch-bars">
                <?php foreach ($topBranches as $tb): ?>
                <div class="branch-bar-item">
                    <div class="branch-bar-label">
                        <span><?= esc($tb['branch_name']) ?></span>
                        <span class="branch-bar-count"><?= (int)$tb['emp_count'] ?> staff</span>
                    </div>
                    <div class="progress-bar-wrap">
                        <div class="progress-bar" style="width:<?= round(((int)$tb['emp_count'] / $maxEmp) * 100) ?>%"></div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>

        <!-- Recent Loans -->
        <div class="panel">
            <div class="panel-header">
                <h3>Recent Loans</h3>
                <a href="index.php?page=loans" class="panel-link">View all →</a>
            </div>
            <div class="txn-list">
                <?php if (empty($recentLoans)): ?>
                    <p class="empty-state">No loans yet.</p>
                <?php else: ?>
                    <?php foreach ($recentLoans as $ln): ?>
                    <div class="txn-item">
                        <div class="txn-icon txn-credit">$</div>
                        <div class="txn-details">
                            <div class="txn-type"><?= esc($ln['customer_name']) ?></div>
                            <div class="txn-meta"><?= esc($ln['loan_number']) ?> · <?= esc($ln['type_name']) ?></div>
                        </div>
                        <div class="txn-right">
                            <div class="txn-amount"><?= inr((float)$ln['principal_amount']) ?></div>
                            <div><span class="badge <?= esc($ln['status']) ?>"><?= esc($ln['status']) ?></span></div>
                        </div>
                    </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
