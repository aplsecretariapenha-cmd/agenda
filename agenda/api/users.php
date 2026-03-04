<?php
require 'config.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT id, username, role, name, departmentId FROM users");
    echo json_encode($stmt->fetchAll());
} elseif ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $stmt = $pdo->prepare("INSERT INTO users (username, password, role, name, departmentId) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([
        $data['username'], 
        $data['password'], 
        $data['role'], 
        $data['name'], 
        $data['departmentId']
    ]);
    
    $id = $pdo->lastInsertId();
    $stmt = $pdo->prepare("SELECT id, username, role, name, departmentId FROM users WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode($stmt->fetch());
}
?>
