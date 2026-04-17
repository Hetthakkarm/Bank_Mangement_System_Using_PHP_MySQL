<?php
require_once __DIR__ . '/../config/db.php';

/* ─────────────────────────────────────────────
   SAFE OUTPUT
───────────────────────────────────────────── */
function esc($value){
    return htmlspecialchars((string)($value ?? ''), ENT_QUOTES, 'UTF-8');
}

/* ─────────────────────────────────────────────
   BASIC HELPERS
───────────────────────────────────────────── */
function page_name(){
    return $_GET['page'] ?? 'dashboard';
}

function search_term(){
    return trim($_GET['q'] ?? '');
}

function like_term(){
    return '%' . search_term() . '%';
}

function go($url){
    header("Location: " . $url);
    exit;
}

/* ─────────────────────────────────────────────
   DATABASE FUNCTIONS (FIXED & FINAL)
───────────────────────────────────────────── */
function q_all($sql, $types = '', $params = []){
    global $conn;

    if ($types === '') {
        $result = $conn->query($sql);

        if (!$result) {
            die("SQL Error: " . $conn->error . "<br><b>Query:</b> " . $sql);
        }

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Prepare Error: " . $conn->error);
    }

    if (!empty($params)) {
        $stmt->bind_param($types, ...$params);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    return $result->fetch_all(MYSQLI_ASSOC);
}

function q_one($sql, $types = '', $params = []){
    $rows = q_all($sql, $types, $params);
    return $rows[0] ?? null;
}

/* ─────────────────────────────────────────────
   AUTO CODE GENERATORS
───────────────────────────────────────────── */
function next_code($table, $column, $prefix){
    $row = q_one("SELECT $column AS code FROM $table ORDER BY $column DESC LIMIT 1");

    if (!$row) {
        return $prefix . '001';
    }

    $num = (int)preg_replace('/\D+/', '', $row['code']);
    return sprintf('%s%03d', $prefix, $num + 1);
}

function next_account_number(){
    $row = q_one("SELECT account_number FROM accounts ORDER BY account_number DESC LIMIT 1");

    if (!$row) {
        return '100000000001';
    }

    return (string)((int)$row['account_number'] + 1);
}

/* ─────────────────────────────────────────────
   TRANSACTION TYPE HELPER
───────────────────────────────────────────── */
function tx_type_id($name){
    $row = q_one(
        "SELECT transaction_type_id FROM transaction_types WHERE type_name=?",
        's',
        [$name]
    );

    return (int)($row['transaction_type_id'] ?? 0);
}

/* ─────────────────────────────────────────────
   FLASH MESSAGES
───────────────────────────────────────────── */
function flash(string $type, string $message): void {
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }

    $_SESSION['_flash'] = [
        'type' => $type,
        'message' => $message
    ];
}

function flash_get(): ?array {
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }

    if (!isset($_SESSION['_flash'])) {
        return null;
    }

    $flash = $_SESSION['_flash'];
    unset($_SESSION['_flash']);

    return $flash;
}

/* ─────────────────────────────────────────────
   INDIAN CURRENCY FORMAT
───────────────────────────────────────────── */
function inr(float $amount): string {
    $negative = $amount < 0;
    $amount = abs($amount);

    $decimal = number_format($amount - floor($amount), 2);
    $decimal = substr($decimal, 1); // ".XX"

    $whole = (string)(int)floor($amount);

    if (strlen($whole) > 3) {
        $last3 = substr($whole, -3);
        $rest  = substr($whole, 0, -3);
        $rest  = preg_replace('/(\d)(?=(\d{2})+$)/', '$1,', $rest);
        $formatted = $rest . ',' . $last3;
    } else {
        $formatted = $whole;
    }

    return ($negative ? '-' : '') . '₹' . $formatted . $decimal;
}
?>