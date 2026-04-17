<?php
$q = search_term(); $editId = (int)($_GET['edit'] ?? 0); $edit = $editId ? q_one("SELECT a.*, ah.customer_id FROM accounts a LEFT JOIN account_holders ah ON a.account_id=ah.account_id AND ah.holder_role='primary' WHERE a.account_id=?", 'i', [$editId]) : null;
$branches = q_all("SELECT branch_id, branch_name FROM branches ORDER BY branch_name ASC");
$types = q_all("SELECT account_type_id, type_name FROM account_types ORDER BY type_name ASC");
$customers = q_all("SELECT customer_id, customer_code, first_name, last_name FROM customers WHERE status='active' ORDER BY first_name ASC");
$baseQuery = "
SELECT 
    a.account_id,
    a.account_number,
    a.status,
    at.type_name,
    b.branch_name,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COALESCE(v.balance,0) AS balance
FROM accounts a
JOIN account_types at ON a.account_type_id = at.account_type_id
JOIN branches b ON a.branch_id = b.branch_id
JOIN account_holders ah ON a.account_id = ah.account_id AND ah.holder_role='primary'
JOIN customers c ON ah.customer_id = c.customer_id
LEFT JOIN v_account_balances v ON a.account_id = v.account_id
";

if ($q === '') {
    $rows = q_all($baseQuery . " ORDER BY a.account_id ASC");
} else {
    $rows = q_all(
        $baseQuery . " 
        WHERE a.account_number LIKE ? 
        OR c.first_name LIKE ? 
        OR c.last_name LIKE ? 
        ORDER BY a.account_id ASC",
        'sss',
        [like_term(), like_term(), like_term()]
    );
}
?>
<div class="page-header"><div><h2 class="page-title">Accounts</h2><div class="page-subtle">Manage accounts</div></div></div>
<div class="split-layout">
<section class="panel"><h3><?= $edit ? 'Update Account' : 'Add Account' ?></h3><form method="post" action="actions/record.php" class="form-grid"><input type="hidden" name="entity" value="accounts"><input type="hidden" name="id" value="<?= esc($edit['account_id'] ?? '') ?>"><input type="hidden" name="account_number" value="<?= esc($edit['account_number'] ?? '') ?>"><select class="full" name="customer_id" required><option value="">— Select Customer —</option><?php foreach ($customers as $c): ?><option value="<?= $c['customer_id'] ?>" <?= (($edit['customer_id'] ?? '') == $c['customer_id']) ? 'selected' : '' ?>><?= esc($c['first_name'] . ' ' . $c['last_name'] . ' (' . $c['customer_code'] . ')') ?></option><?php endforeach; ?></select><select name="branch_id" required><?php foreach ($branches as $b): ?><option value="<?= $b['branch_id'] ?>" <?= (($edit['branch_id'] ?? '') == $b['branch_id']) ? 'selected' : '' ?>><?= esc($b['branch_name']) ?></option><?php endforeach; ?></select><select name="account_type_id" required><?php foreach ($types as $t): ?><option value="<?= $t['account_type_id'] ?>" <?= (($edit['account_type_id'] ?? '') == $t['account_type_id']) ? 'selected' : '' ?>><?= esc($t['type_name']) ?></option><?php endforeach; ?></select><input type="date" name="open_date" value="<?= esc($edit['open_date'] ?? date('Y-m-d')) ?>" required><select name="status"><option value="active" <?= (($edit['status'] ?? 'active') === 'active') ? 'selected' : '' ?>>Active</option><option value="frozen" <?= (($edit['status'] ?? '') === 'frozen') ? 'selected' : '' ?>>Frozen</option><option value="closed" <?= (($edit['status'] ?? '') === 'closed') ? 'selected' : '' ?>>Closed</option></select><button type="submit"><?= $edit ? 'Update' : 'Create' ?></button></form></section>
<section class="panel"><form class="search-form" method="get"><input type="hidden" name="page" value="accounts"><input name="q" placeholder="Search accounts" value="<?= esc($q) ?>"><button type="submit">Search</button></form><div class="table-wrap"><table><thead><tr><th>Number</th><th>Customer</th><th>Type</th><th>Branch</th><th>Balance</th><th>Status</th><th>Actions</th></tr></thead><tbody><?php foreach ($rows as $r): ?><tr><td><?= esc($r['account_number']) ?></td><td><?= esc($r['customer_name']) ?></td><td><?= esc($r['type_name']) ?></td><td><?= esc($r['branch_name']) ?></td><td class="<?= (float)$r['balance'] >= 0 ? 'text-green' : 'text-red' ?>"><?= esc(number_format((float)$r['balance'],2)) ?></td><td><span class="badge <?= $r['status'] === 'active' ? 'approved' : ($r['status'] === 'frozen' ? 'pending' : 'closed') ?>"><?= esc($r['status']) ?></span></td><td><div class="action-row"><a href="index.php?page=accounts&edit=<?= esc($r['account_id']) ?>"><button type="button" class="btn-alt btn-small">Edit</button></a><form method="post" action="actions/record.php"><input type="hidden" name="entity" value="accounts"><input type="hidden" name="mode" value="delete"><input type="hidden" name="id" value="<?= esc($r['account_id']) ?>"><button class="btn-danger btn-small">Delete</button></form></div></td></tr><?php endforeach; ?></tbody></table></div>
<div class="mobile-list"><?php foreach ($rows as $r): ?><article class="record-card"><div class="record-grid"><div class="record-item"><div class="record-label">Number</div><div class="record-value"><?= esc($r['account_number']) ?></div></div><div class="record-item"><div class="record-label">Customer</div><div class="record-value"><?= esc($r['customer_name']) ?></div></div><div class="record-item"><div class="record-label">Type</div><div class="record-value"><?= esc($r['type_name']) ?></div></div><div class="record-item"><div class="record-label">Balance</div><div class="record-value <?= (float)$r['balance'] >= 0 ? 'text-green' : 'text-red' ?>"><?= esc(number_format((float)$r['balance'],2)) ?></div></div><div class="record-item"><div class="record-label">Status</div><div class="record-value"><span class="badge <?= $r['status'] === 'active' ? 'approved' : ($r['status'] === 'frozen' ? 'pending' : 'closed') ?>"><?= esc($r['status']) ?></span></div></div></div><div class="action-row"><a href="index.php?page=accounts&edit=<?= esc($r['account_id']) ?>"><button type="button" class="btn-alt btn-small">Edit</button></a><form method="post" action="actions/record.php"><input type="hidden" name="entity" value="accounts"><input type="hidden" name="mode" value="delete"><input type="hidden" name="id" value="<?= esc($r['account_id']) ?>"><button class="btn-danger btn-small">Delete</button></form></div></article><?php endforeach; ?></div>
</section>
</div>
