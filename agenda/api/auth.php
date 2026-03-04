<?php
require_once 'db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));
    
    if (!isset($data->username) || !isset($data->password)) {
        http_response_code(400);
        echo json_encode(["error" => "Missing credentials"]);
        exit;
    }

    $conn = getDB();
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = :username");
    $stmt->bindParam(':username', $data->username);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Simple password check (In production use password_verify)
    if ($user && $user['password'] === $data->password) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_role'] = $user['role'];
        
        unset($user['password']); // Don't send password back
        echo json_encode($user);
    } else {
        http_response_code(401);
        echo json_encode(["error" => "Invalid credentials"]);
    }
}
?>
