<?php
$q = search_term();
$editId = (int)($_GET['edit'] ?? 0);
$edit = $editId ? q_one("SELECT * FROM loan_payments WHERE loan_payment_id=?", 'i', [$editId]) : null;

$loans = q_all("SELECT l.loan_id, l.loan_number, CONCAT(c.first_name, ' ', c.last_name) AS customer_name
                FROM loans l
                JOIN customers c ON l.customer_id = c.customer_id
                WHERE l.status IN ('approved','active')
                ORDER BY l.loan_id ASC");
$employees = q_all("SELECT employee_id, employee_code, first_name, last_name FROM employees WHERE status='active' ORDER BY employee_id ASC");

$rows = $q === ''
    ? q_all("SELECT lp.loan_payment_id, lp.installment_no, lp.amount_paid, lp.paid_on, lp.reference_no,
                    l.loan_number,
                    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
                    CONCAT(e.first_name, ' ', e.last_name) AS received_by_name
             FROM loan_payments lp
             JOIN loans l ON lp.loan_id = l.loan_id
             JOIN customers c ON l.customer_id = c.customer_id
             JOIN employees e ON lp.received_by = e.employee_id
             ORDER BY lp.paid_on DESC, lp.loan_payment_id DESC")
    : q_all("SELECT lp.loan_payment_id, lp.installment_no, lp.amount_paid, lp.paid_on, lp.reference_no,
                    l.loan_number,
                    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
                    CONCAT(e.first_name, ' ', e.last_name) AS received_by_name
             FROM loan_payments lp
             JOIN loans l ON lp.loan_id = l.loan_id
             JOIN customers c ON l.customer_id = c.customer_id
             JOIN employees e ON lp.received_by = e.employee_id
             WHERE l.loan_number LIKE ? OR lp.reference_no LIKE ? OR c.first_name LIKE ?
             ORDER BY lp.paid_on DESC, lp.loan_payment_id DESC", 'sss', [like_term(), like_term(), like_term()]);
?>

<div class="page-header">
    <div>
        <h2 class="page-title">Loan Payments</h2>
        <div class="page-subtle">Manage EMI payments</div>
    </div>
</div>

<div class="split-layout">
<section class="panel">
    <h3><?= $edit ? 'Update Payment' : 'Record Payment' ?></h3>
    <form method="post" action="actions/record.php" class="form-grid">
        <input type="hidden" name="entity" value="loan_payments">
        <input type="hidden" name="id" value="<?= esc($edit['loan_payment_id'] ?? '') ?>">
        <input type="hidden" name="reference_no" value="<?= esc($edit['reference_no'] ?? '') ?>">

        <select class="full" name="loan_id" required>
            <option value="">— Select Loan —</option>
            <?php foreach ($loans as $ln): ?>
            <option value="<?= $ln['loan_id'] ?>" <?= (($edit['loan_id'] ?? '') == $ln['loan_id']) ? 'selected' : '' ?>>
                <?= esc($ln['loan_number'] . ' — ' . $ln['customer_name']) ?>
            </option>
            <?php endforeach; ?>
        </select>

        <input type="number" name="installment_no" placeholder="Installment No." value="<?= esc($edit['installment_no'] ?? '') ?>" min="1" required>
        <input type="number" step="0.01" name="amount_paid" placeholder="Amount Paid" value="<?= esc($edit['amount_paid'] ?? '') ?>" required>
        <input type="date" name="paid_on" value="<?= esc($edit['paid_on'] ?? date('Y-m-d')) ?>" required>

        <select class="full" name="received_by" required>
            <option value="">— Received By —</option>
            <?php foreach ($employees as $e): ?>
            <option value="<?= $e['employee_id'] ?>" <?= (($edit['received_by'] ?? '') == $e['employee_id']) ? 'selected' : '' ?>>
                <?= esc($e['employee_code'] . ' — ' . $e['first_name'] . ' ' . $e['last_name']) ?>
            </option>
            <?php endforeach; ?>
        </select>

        <button type="submit"><?= $edit ? 'Update' : 'Record Payment' ?></button>
    </form>
</section>

<section class="panel">
    <form class="search-form" method="get">
        <input type="hidden" name="page" value="loan_payments">
        <input name="q" placeholder="Search by loan #, reference, customer" value="<?= esc($q) ?>">
        <button type="submit">Search</button>
    </form>

    <div class="table-wrap">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Loan #</th>
                    <th>Customer</th>
                    <th>Inst. #</th>
                    <th>Amount</th>
                    <th>Paid On</th>
                    <th>Received By</th>
                    <th>Ref.</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($rows as $r): ?>
                <tr>
                    <td><?= esc($r['loan_payment_id']) ?></td>
                    <td><?= esc($r['loan_number']) ?></td>
                    <td><?= esc($r['customer_name']) ?></td>
                    <td><?= esc($r['installment_no']) ?></td>
                    <td><?= esc(number_format((float)$r['amount_paid'], 2)) ?></td>
                    <td><?= esc($r['paid_on']) ?></td>
                    <td><?= esc($r['received_by_name']) ?></td>
                    <td><span class="badge approved"><?= esc($r['reference_no']) ?></span></td>
                    <td>
                        <div class="action-row">
                            <a href="index.php?page=loan_payments&edit=<?= esc($r['loan_payment_id']) ?>"><button type="button" class="btn-alt btn-small">Edit</button></a>
                            <form method="post" action="actions/record.php">
                                <input type="hidden" name="entity" value="loan_payments">
                                <input type="hidden" name="mode" value="delete">
                                <input type="hidden" name="id" value="<?= esc($r['loan_payment_id']) ?>">
                                <button class="btn-danger btn-small">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <!-- Mobile card view -->
    <div class="mobile-list">
        <?php foreach ($rows as $r): ?>
        <article class="record-card">
            <div class="record-grid">
                <div class="record-item"><div class="record-label">Loan</div><div class="record-value"><?= esc($r['loan_number']) ?></div></div>
                <div class="record-item"><div class="record-label">Customer</div><div class="record-value"><?= esc($r['customer_name']) ?></div></div>
                <div class="record-item"><div class="record-label">Instl.</div><div class="record-value">#<?= esc($r['installment_no']) ?></div></div>
                <div class="record-item"><div class="record-label">Amount</div><div class="record-value"><?= esc(number_format((float)$r['amount_paid'], 2)) ?></div></div>
                <div class="record-item"><div class="record-label">Date</div><div class="record-value"><?= esc($r['paid_on']) ?></div></div>
            </div>
            <div class="action-row">
                <a href="index.php?page=loan_payments&edit=<?= esc($r['loan_payment_id']) ?>"><button type="button" class="btn-alt btn-small">Edit</button></a>
                <form method="post" action="actions/record.php"><input type="hidden" name="entity" value="loan_payments"><input type="hidden" name="mode" value="delete"><input type="hidden" name="id" value="<?= esc($r['loan_payment_id']) ?>"><button class="btn-danger btn-small">Delete</button></form>
            </div>
        </article>
        <?php endforeach; ?>
    </div>
</section>
</div>
