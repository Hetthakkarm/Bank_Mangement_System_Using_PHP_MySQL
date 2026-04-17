<?php
require_once __DIR__ . '/../includes/functions.php';
global $conn;

// Enable strict error reporting for mysqli to catch Trigger errors as exceptions
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

$entity = $_POST['entity'] ?? '';
$mode   = $_POST['mode'] ?? 'save';
$id     = (int)($_POST['id'] ?? 0);

try {

/* ── helper: trim posted value ───────────────────────────── */
function p(string $key, string $default = ''): string {
    return isset($_POST[$key]) ? trim((string)$_POST[$key]) : $default;
}

/* ══════════════════════════════════════════════════════════
   DELETE
   ══════════════════════════════════════════════════════════ */
if ($mode === 'delete') {
    switch ($entity) {
        case 'branches':
            $s = $conn->prepare("DELETE FROM branches WHERE branch_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            break;

        case 'employees':
            $s = $conn->prepare("DELETE FROM employees WHERE employee_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            break;

        case 'customers':
            $s = $conn->prepare("DELETE FROM customers WHERE customer_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            break;

        case 'accounts':
            // cascade: holders → entries → account
            $conn->query("DELETE FROM account_holders WHERE account_id=" . (int)$id);
            $conn->query("DELETE FROM transaction_entries WHERE account_id=" . (int)$id);
            $s = $conn->prepare("DELETE FROM accounts WHERE account_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            break;

        case 'transactions':
            $s = $conn->prepare("DELETE FROM transaction_entries WHERE transaction_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            $s = $conn->prepare("DELETE FROM transactions WHERE transaction_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            break;

        case 'loans':
            $conn->query("DELETE FROM loan_payments WHERE loan_id=" . (int)$id);
            $s = $conn->prepare("DELETE FROM loans WHERE loan_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            break;

        case 'loan_payments':
            $s = $conn->prepare("DELETE FROM loan_payments WHERE loan_payment_id=?");
            $s->bind_param('i', $id);
            $s->execute();
            break;
    }
    flash('success', ucfirst($entity) . ' record deleted.');
    go("../index.php?page=" . $entity);
}

/* ══════════════════════════════════════════════════════════
   SAVE / UPDATE — BRANCHES
   ══════════════════════════════════════════════════════════ */
if ($entity === 'branches') {
    $branch_code = p('branch_code');
    $branch_name = p('branch_name');
    $city        = p('city');
    $state       = p('state');
    $ifsc_prefix = p('ifsc_prefix');
    $phone       = p('phone');

    if ($id) {
        $s = $conn->prepare("UPDATE branches SET branch_code=?, branch_name=?, city=?, state=?, ifsc_prefix=?, phone=? WHERE branch_id=?");
        $s->bind_param('ssssssi', $branch_code, $branch_name, $city, $state, $ifsc_prefix, $phone, $id);
    } else {
        $s = $conn->prepare("INSERT INTO branches (branch_code, branch_name, city, state, ifsc_prefix, phone) VALUES (?,?,?,?,?,?)");
        $s->bind_param('ssssss', $branch_code, $branch_name, $city, $state, $ifsc_prefix, $phone);
    }
    $s->execute();
    flash('success', $id ? 'Branch updated.' : 'Branch created.');
}

/* ══════════════════════════════════════════════════════════
   SAVE / UPDATE — EMPLOYEES
   ══════════════════════════════════════════════════════════ */
if ($entity === 'employees') {
    $code       = $id ? p('employee_code') : next_code('employees', 'employee_code', 'EMP');
    $branch_id  = (int)p('branch_id');
    $role_id    = (int)p('role_id');
    $first_name = p('first_name');
    $last_name  = p('last_name');
    $email      = p('email');
    $phone      = p('phone');
    $hire_date  = p('hire_date');
    $status     = p('status', 'active');

    if ($id) {
        $s = $conn->prepare("UPDATE employees SET employee_code=?, branch_id=?, role_id=?, first_name=?, last_name=?, email=?, phone=?, hire_date=?, status=? WHERE employee_id=?");
        $s->bind_param('siissssssi', $code, $branch_id, $role_id, $first_name, $last_name, $email, $phone, $hire_date, $status, $id);
    } else {
        $s = $conn->prepare("INSERT INTO employees (employee_code, branch_id, role_id, first_name, last_name, email, phone, hire_date, status) VALUES (?,?,?,?,?,?,?,?,?)");
        $s->bind_param('siissssss', $code, $branch_id, $role_id, $first_name, $last_name, $email, $phone, $hire_date, $status);
    }
    $s->execute();
    flash('success', $id ? 'Employee updated.' : 'Employee created.');
}

/* ══════════════════════════════════════════════════════════
   SAVE / UPDATE — CUSTOMERS
   ══════════════════════════════════════════════════════════ */
if ($entity === 'customers') {
    $code         = $id ? p('customer_code') : next_code('customers', 'customer_code', 'CUS');
    $first_name   = p('first_name');
    $last_name    = p('last_name');
    $date_of_birth = p('date_of_birth');
    $gender       = p('gender');
    $phone        = p('phone');
    $email        = p('email');
    $id_type      = p('id_type');
    $id_number    = p('id_number');
    $address_line = p('address_line');
    $city         = p('city');
    $state        = p('state');
    $postal_code  = p('postal_code');
    $status       = p('status', 'active');

    if ($id) {
        $s = $conn->prepare("UPDATE customers SET customer_code=?, first_name=?, last_name=?, date_of_birth=?, gender=?, phone=?, email=?, id_type=?, id_number=?, address_line=?, city=?, state=?, postal_code=?, status=? WHERE customer_id=?");
        $s->bind_param('ssssssssssssssi', $code, $first_name, $last_name, $date_of_birth, $gender, $phone, $email, $id_type, $id_number, $address_line, $city, $state, $postal_code, $status, $id);
    } else {
        $s = $conn->prepare("INSERT INTO customers (customer_code, first_name, last_name, date_of_birth, gender, phone, email, id_type, id_number, address_line, city, state, postal_code, status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $s->bind_param('ssssssssssssss', $code, $first_name, $last_name, $date_of_birth, $gender, $phone, $email, $id_type, $id_number, $address_line, $city, $state, $postal_code, $status);
    }
    $s->execute();
    flash('success', $id ? 'Customer updated.' : 'Customer created.');
}

/* ══════════════════════════════════════════════════════════
   SAVE / UPDATE — ACCOUNTS
   ══════════════════════════════════════════════════════════ */
if ($entity === 'accounts') {
    $account_number  = $id ? p('account_number') : next_account_number();
    $branch_id       = (int)p('branch_id');
    $account_type_id = (int)p('account_type_id');
    $open_date       = p('open_date', date('Y-m-d'));
    $status          = p('status', 'active');
    $customer_id     = (int)p('customer_id');

    if ($id) {
        $s = $conn->prepare("UPDATE accounts SET account_number=?, branch_id=?, account_type_id=?, open_date=?, status=? WHERE account_id=?");
        $s->bind_param('siissi', $account_number, $branch_id, $account_type_id, $open_date, $status, $id);
        $s->execute();
        // update primary holder
        $conn->query("DELETE FROM account_holders WHERE account_id={$id} AND holder_role='primary'");
        $sh = $conn->prepare("INSERT INTO account_holders (account_id, customer_id, holder_role) VALUES (?, ?, 'primary')");
        $sh->bind_param('ii', $id, $customer_id);
        $sh->execute();
    } else {
        $s = $conn->prepare("INSERT INTO accounts (account_number, branch_id, account_type_id, open_date, status) VALUES (?,?,?,?,?)");
        $s->bind_param('siiss', $account_number, $branch_id, $account_type_id, $open_date, $status);
        $s->execute();
        $new_id = $conn->insert_id;
        // link primary holder
        $sh = $conn->prepare("INSERT INTO account_holders (account_id, customer_id, holder_role) VALUES (?, ?, 'primary')");
        $sh->bind_param('ii', $new_id, $customer_id);
        $sh->execute();
    }
    flash('success', $id ? 'Account updated.' : 'Account created (' . esc($account_number) . ').');
}

/* ══════════════════════════════════════════════════════════
   SAVE / UPDATE — TRANSACTIONS
   ══════════════════════════════════════════════════════════ */
if ($entity === 'transactions') {
    $type_name     = p('type_name', 'Cash Deposit');
    $type_id       = tx_type_id($type_name);
    $initiated_by  = (int)p('initiated_by');
    $source_id     = (int)p('source_account_id') ?: null;
    $target_id     = (int)p('target_account_id') ?: null;
    $amount        = (float)p('amount');
    $narration     = p('narration');
    $txn_date      = p('transaction_date');
    // convert datetime-local format
    $txn_date      = str_replace('T', ' ', $txn_date);
    if (strlen($txn_date) === 16) $txn_date .= ':00'; // add seconds

    if ($id) {
        $reference_no = p('reference_no');
        $s = $conn->prepare("UPDATE transactions SET transaction_type_id=?, initiated_by=?, source_account_id=?, target_account_id=?, amount=?, reference_no=?, narration=?, transaction_date=? WHERE transaction_id=?");
        $s->bind_param('iiiiisssi', $type_id, $initiated_by, $source_id, $target_id, $amount, $reference_no, $narration, $txn_date, $id);
        $s->execute();

        // rebuild entries
        $conn->query("DELETE FROM transaction_entries WHERE transaction_id={$id}");
        insert_transaction_entries($id, $type_name, $source_id, $target_id, $amount);
    } 
    // Use Stored Procedure for new Account Transfers
    elseif ($type_name === 'Account Transfer') {
        $s = $conn->prepare("CALL sp_transfer_funds(?, ?, ?, ?, ?)");
        $s->bind_param('iidis', $source_id, $target_id, $amount, $initiated_by, $narration);
        $s->execute();
    }
    else {
        $reference_no = 'TXN' . date('YmdHis') . random_int(100, 999);
        $s = $conn->prepare("INSERT INTO transactions (transaction_type_id, initiated_by, source_account_id, target_account_id, amount, reference_no, narration, transaction_date) VALUES (?,?,?,?,?,?,?,?)");
        $s->bind_param('iiiddsss', $type_id, $initiated_by, $source_id, $target_id, $amount, $reference_no, $narration, $txn_date);
        $s->execute();
        $new_txn_id = $conn->insert_id;
        insert_transaction_entries($new_txn_id, $type_name, $source_id, $target_id, $amount);
    }
    flash('success', $id ? 'Transaction updated.' : 'Transaction created (' . esc($reference_no) . ').');
}

/* ══════════════════════════════════════════════════════════
   SAVE / UPDATE — LOANS
   ══════════════════════════════════════════════════════════ */
if ($entity === 'loans') {
    $loan_number     = $id ? p('loan_number') : next_code('loans', 'loan_number', 'LOAN');
    $customer_id     = (int)p('customer_id');
    $branch_id       = (int)p('branch_id');
    $loan_type_id    = (int)p('loan_type_id');
    $principal       = (float)p('principal_amount');
    $interest_rate   = (float)p('interest_rate');
    $tenure_months   = (int)p('tenure_months');
    $start_date      = p('start_date', date('Y-m-d'));
    $status          = p('status', 'approved');

    if ($id) {
        $s = $conn->prepare("UPDATE loans SET loan_number=?, customer_id=?, branch_id=?, loan_type_id=?, principal_amount=?, interest_rate=?, tenure_months=?, start_date=?, status=? WHERE loan_id=?");
        $s->bind_param('siiiddissi', $loan_number, $customer_id, $branch_id, $loan_type_id, $principal, $interest_rate, $tenure_months, $start_date, $status, $id);
    } else {
        $s = $conn->prepare("INSERT INTO loans (loan_number, customer_id, branch_id, loan_type_id, principal_amount, interest_rate, tenure_months, start_date, status) VALUES (?,?,?,?,?,?,?,?,?)");
        $s->bind_param('siiiddiss', $loan_number, $customer_id, $branch_id, $loan_type_id, $principal, $interest_rate, $tenure_months, $start_date, $status);
    }
    $s->execute();
    flash('success', $id ? 'Loan updated.' : 'Loan created (' . esc($loan_number) . ').');
}

/* ══════════════════════════════════════════════════════════
   SAVE / UPDATE — LOAN PAYMENTS
   ══════════════════════════════════════════════════════════ */
if ($entity === 'loan_payments') {
    $loan_id        = (int)p('loan_id');
    $installment_no = (int)p('installment_no');
    $amount_paid    = (float)p('amount_paid');
    $paid_on        = p('paid_on', date('Y-m-d'));
    $received_by    = (int)p('received_by');
    $reference_no   = $id ? p('reference_no') : 'LPMT' . date('YmdHis') . random_int(10, 99);

    if ($id) {
        $s = $conn->prepare("UPDATE loan_payments SET loan_id=?, installment_no=?, amount_paid=?, paid_on=?, received_by=?, reference_no=? WHERE loan_payment_id=?");
        $s->bind_param('iidsisi', $loan_id, $installment_no, $amount_paid, $paid_on, $received_by, $reference_no, $id);
    } else {
        $s = $conn->prepare("INSERT INTO loan_payments (loan_id, installment_no, amount_paid, paid_on, received_by, reference_no) VALUES (?,?,?,?,?,?)");
        $s->bind_param('iidsis', $loan_id, $installment_no, $amount_paid, $paid_on, $received_by, $reference_no);
    }
    $s->execute();
    flash('success', $id ? 'Loan payment updated.' : 'Loan payment recorded.');
}

    go("../index.php?page=" . $entity);

} catch (Exception $e) {
    // Catch Trigger/Procedure errors and show them as flash messages
    $msg = $e->getMessage();
    // Clean up SQL error message formatting if needed
    if (str_contains($msg, 'SIGNAL SQLSTATE')) {
        $msg = explode(': ', $msg)[1] ?? $msg;
    }
    flash('error', $msg);
    go("../index.php?page=" . $entity . ($id ? "&edit=".$id : ""));
}

/* ── Transaction entry builder ───────────────────────────── */
function insert_transaction_entries(int $txn_id, string $type_name, ?int $source, ?int $target, float $amount): void
{
    global $conn;
    // Deposit → credit target
    if (str_contains(strtolower($type_name), 'deposit') && $target) {
        $s = $conn->prepare("INSERT INTO transaction_entries (transaction_id, account_id, entry_role, amount) VALUES (?, ?, 'credit', ?)");
        $s->bind_param('iid', $txn_id, $target, $amount);
        $s->execute();
    }
    // Withdrawal → debit source
    elseif (str_contains(strtolower($type_name), 'withdrawal') && $source) {
        $s = $conn->prepare("INSERT INTO transaction_entries (transaction_id, account_id, entry_role, amount) VALUES (?, ?, 'debit', ?)");
        $s->bind_param('iid', $txn_id, $source, $amount);
        $s->execute();
    }
    // Transfer → debit source, credit target
    elseif (str_contains(strtolower($type_name), 'transfer') && $source && $target) {
        $s = $conn->prepare("INSERT INTO transaction_entries (transaction_id, account_id, entry_role, amount) VALUES (?, ?, 'debit', ?)");
        $s->bind_param('iid', $txn_id, $source, $amount);
        $s->execute();
        $s2 = $conn->prepare("INSERT INTO transaction_entries (transaction_id, account_id, entry_role, amount) VALUES (?, ?, 'credit', ?)");
        $s2->bind_param('iid', $txn_id, $target, $amount);
        $s2->execute();
    }
}
