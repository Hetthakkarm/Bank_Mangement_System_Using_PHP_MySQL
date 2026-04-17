<?php
$q = search_term();
$editId = (int)($_GET['edit'] ?? 0);
$edit = $editId ? q_one("SELECT * FROM branches WHERE branch_id=?", 'i', [$editId]) : null;
$rows = $q === '' ? q_all("SELECT * FROM branches ORDER BY branch_id ASC") : q_all("SELECT * FROM branches WHERE branch_code LIKE ? OR branch_name LIKE ? OR city LIKE ? OR state LIKE ? ORDER BY branch_id ASC", 'ssss', [like_term(), like_term(), like_term(), like_term()]);
?>
<div class="page-header"><div><h2 class="page-title">Branches</h2><div class="page-subtle">Manage branch records</div></div></div>
<div class="split-layout">
<section class="panel">
  <h3><?= $edit ? 'Update Branch' : 'Add Branch' ?></h3>
  <form method="post" action="actions/record.php" class="form-grid">
    <input type="hidden" name="entity" value="branches">
    <input type="hidden" name="id" value="<?= esc($edit['branch_id'] ?? '') ?>">
    <input class="full" name="branch_code" placeholder="Branch Code" value="<?= esc($edit['branch_code'] ?? '') ?>" required>
    <input class="full" name="branch_name" placeholder="Branch Name" value="<?= esc($edit['branch_name'] ?? '') ?>" required>
    <input name="city" placeholder="City" value="<?= esc($edit['city'] ?? '') ?>" required>
    <input name="state" placeholder="State" value="<?= esc($edit['state'] ?? '') ?>" required>
    <input name="ifsc_prefix" placeholder="IFSC Prefix" value="<?= esc($edit['ifsc_prefix'] ?? '') ?>" required>
    <input name="phone" placeholder="Phone" value="<?= esc($edit['phone'] ?? '') ?>" required>
    <button type="submit"><?= $edit ? 'Update' : 'Create' ?></button>
  </form>
</section>
<section class="panel">
  <form class="search-form" method="get">
    <input type="hidden" name="page" value="branches">
    <input name="q" placeholder="Search branches" value="<?= esc($q) ?>">
    <button type="submit">Search</button>
  </form>
  <div class="table-wrap">
    <table>
      <thead><tr><th>ID</th><th>Code</th><th>Name</th><th>City</th><th>State</th><th>Actions</th></tr></thead>
      <tbody>
        <?php foreach ($rows as $r): ?>
          <tr>
            <td><?= esc($r['branch_id']) ?></td>
            <td><?= esc($r['branch_code']) ?></td>
            <td><?= esc($r['branch_name']) ?></td>
            <td><?= esc($r['city']) ?></td>
            <td><?= esc($r['state']) ?></td>
            <td><div class="action-row"><a href="index.php?page=branches&edit=<?= esc($r['branch_id']) ?>"><button type="button" class="btn-alt btn-small">Edit</button></a><form method="post" action="actions/record.php"><input type="hidden" name="entity" value="branches"><input type="hidden" name="mode" value="delete"><input type="hidden" name="id" value="<?= esc($r['branch_id']) ?>"><button class="btn-danger btn-small">Delete</button></form></div></td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
  <div class="mobile-list">
    <?php foreach ($rows as $r): ?>
      <article class="record-card">
        <div class="record-grid">
          <div class="record-item"><div class="record-label">ID</div><div class="record-value"><?= esc($r['branch_id']) ?></div></div>
          <div class="record-item"><div class="record-label">Code</div><div class="record-value"><?= esc($r['branch_code']) ?></div></div>
          <div class="record-item"><div class="record-label">Name</div><div class="record-value"><?= esc($r['branch_name']) ?></div></div>
          <div class="record-item"><div class="record-label">City</div><div class="record-value"><?= esc($r['city']) ?></div></div>
          <div class="record-item"><div class="record-label">State</div><div class="record-value"><?= esc($r['state']) ?></div></div>
        </div>
        <div class="action-row">
          <a href="index.php?page=branches&edit=<?= esc($r['branch_id']) ?>"><button type="button" class="btn-alt btn-small">Edit</button></a>
          <form method="post" action="actions/record.php"><input type="hidden" name="entity" value="branches"><input type="hidden" name="mode" value="delete"><input type="hidden" name="id" value="<?= esc($r['branch_id']) ?>"><button class="btn-danger btn-small">Delete</button></form>
        </div>
      </article>
    <?php endforeach; ?>
  </div>
</section>
</div>
