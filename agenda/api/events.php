<?php
require 'config.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT * FROM events");
    echo json_encode($stmt->fetchAll());
} elseif ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Conflict check
    $stmt = $pdo->prepare("SELECT * FROM events WHERE locationId = ? AND ((start < ? AND end > ?))");
    $stmt->execute([$data['locationId'], $data['end'], $data['start']]);
    
    if ($stmt->rowCount() > 0) {
        http_response_code(409);
        echo json_encode(['error' => 'Conflito de horário neste local!']);
        exit;
    }

    $stmt = $pdo->prepare("INSERT INTO events (title, start, end, locationId, departmentId, description, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([
        $data['title'], 
        $data['start'], 
        $data['end'], 
        $data['locationId'], 
        $data['departmentId'], 
        $data['description'], 
        $data['status'] ?? 'pending'
    ]);
    
    $id = $pdo->lastInsertId();
    $stmt = $pdo->prepare("SELECT * FROM events WHERE id = ?");
    $stmt->execute([$id]);
    $newEvent = $stmt->fetch();
    
    // Email Notification for Pending Events
    if (($data['status'] ?? 'pending') === 'pending') {
        $serverName = $_SERVER['SERVER_NAME'] ?? 'adventistaspenha.org';
        $to = 'regibati@gmail.com';
        $subject = 'Novo Evento Pendente - Agenda';
        
        $message = "Um novo evento foi cadastrado e aguarda aprovação.\n\n";
        $message .= "Título: " . $data['title'] . "\n";
        $message .= "Início: " . date('d/m/Y H:i', strtotime($data['start'])) . "\n";
        $message .= "Término: " . date('d/m/Y H:i', strtotime($data['end'])) . "\n";
        $message .= "Descrição: " . ($data['description'] ?? 'Sem descrição') . "\n\n";
        $message .= "Acesse o painel: https://" . $serverName . "/agenda/admin";
        
        $headers = 'From: no-reply@' . $serverName . "\r\n" .
                   'Reply-To: no-reply@' . $serverName . "\r\n" .
                   'X-Mailer: PHP/' . phpversion();

        // Log attempt
        $logMessage = date('Y-m-d H:i:s') . " - Tentando enviar email para $to via $serverName... ";
        
        if (@mail($to, $subject, $message, $headers)) {
            $logMessage .= "SUCESSO.\n";
        } else {
            $logMessage .= "FALHA.\n";
        }
        
        @file_put_contents('email_log.txt', $logMessage, FILE_APPEND);
    }

    echo json_encode($newEvent);

} elseif ($method === 'DELETE') {
    $id = $_GET['id'];
    $stmt = $pdo->prepare("DELETE FROM events WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode(['success' => true]);

} elseif ($method === 'PUT') {
    $id = $_GET['id'];
    $action = $_GET['action'] ?? '';
    
    if ($action === 'approve') {
        $stmt = $pdo->prepare("UPDATE events SET status = 'approved' WHERE id = ?");
        $stmt->execute([$id]);
        echo json_encode(['success' => true]);
    } else {
        // Full Update
        $data = json_decode(file_get_contents('php://input'), true);
        
        // Conflict check for update (exclude current event)
        $stmt = $pdo->prepare("SELECT * FROM events WHERE locationId = ? AND ((start < ? AND end > ?)) AND id != ?");
        $stmt->execute([$data['locationId'], $data['end'], $data['start'], $id]);
        
        if ($stmt->rowCount() > 0) {
            http_response_code(409);
            echo json_encode(['error' => 'Conflito de horário neste local!']);
            exit;
        }

        $stmt = $pdo->prepare("UPDATE events SET title = ?, start = ?, end = ?, locationId = ?, departmentId = ?, description = ? WHERE id = ?");
        $stmt->execute([
            $data['title'], 
            $data['start'], 
            $data['end'], 
            $data['locationId'], 
            $data['departmentId'],
            $data['description'],
            $id
        ]);
        
        // Return updated event
        $stmt = $pdo->prepare("SELECT * FROM events WHERE id = ?");
        $stmt->execute([$id]);
        echo json_encode($stmt->fetch());
    }
}
?>
