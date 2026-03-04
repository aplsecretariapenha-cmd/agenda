<?php
require_once 'config.php';

try {
    // 1. Check connection
    if (!$pdo) {
        die("Erro: Não foi possível conectar ao banco de dados.");
    }

    echo "<h3>Resetando Usuário Admin...</h3>";

    // 2. Delete existing admin to avoid duplicates/conflicts
    $stmt = $pdo->prepare("DELETE FROM users WHERE username = 'admin'");
    $stmt->execute();
    echo "Usuário 'admin' antigo removido (se existia).<br>";

    // 3. Insert new admin
    // Password is 'admin'
    $username = 'admin';
    $password = 'admin'; 
    $role = 'admin';
    $name = 'Administrador';

    $sql = "INSERT INTO users (username, password, role, name) VALUES (?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$username, $password, $role, $name]);

    echo "<strong style='color:green'>Sucesso!</strong><br>";
    echo "Usuário: <strong>admin</strong><br>";
    echo "Senha: <strong>admin</strong><br>";
    echo "<br>Tente logar novamente agora.";

} catch (PDOException $e) {
    echo "<strong style='color:red'>Erro:</strong> " . $e->getMessage();
}
?>
