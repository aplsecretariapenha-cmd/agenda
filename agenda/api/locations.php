<?php
require 'config.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT * FROM locations");
    echo json_encode($stmt->fetchAll());
} elseif ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $stmt = $pdo->prepare("INSERT INTO locations (name, photo) VALUES (?, ?)");
    $stmt->execute([$data['name'], $data['photo']]);
    
    $id = $pdo->lastInsertId();
    $stmt = $pdo->prepare("SELECT * FROM locations WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode($stmt->fetch());
} elseif ($method === 'DELETE') {
    $id = $_GET['id'];
    $stmt = $pdo->prepare("DELETE FROM locations WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode(['success' => true]);
}
?>
