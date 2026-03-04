<?php
require_once 'config.php';

try {
    echo "<h3>Teste de Conexão com Banco de Dados</h3>";
    echo "Tentando conectar em: " . DB_HOST . "<br>";
    echo "Banco: " . DB_NAME . "<br>";
    echo "Usuário: " . DB_USER . "<br>";
    
    // Connection is already established in config.php, but let's check it
    if ($pdo) {
        echo "<strong style='color:green'>Sucesso! Conexão estabelecida.</strong><br><br>";
        
        $stmt = $pdo->query("SELECT count(*) FROM users");
        $count = $stmt->fetchColumn();
        echo "Número de usuários encontrados: " . $count . "<br>";
        
        if ($count == 0) {
            echo "<strong style='color:orange'>Aviso: Tabela de usuários está vazia. Importe o database.sql</strong>";
        } else {
            echo "Listando usuários (apenas usernames):<br>";
            $stmt = $pdo->query("SELECT username, role FROM users");
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "- " . $row['username'] . " (" . $row['role'] . ")<br>";
            }
        }
    }
} catch (Exception $e) {
    echo "<strong style='color:red'>Erro Fatal:</strong> " . $e->getMessage();
}
?>
