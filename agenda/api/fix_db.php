<?php
require_once 'config.php';

function addColumnIfNotExists($pdo, $table, $column, $definition) {
    try {
        $pdo->query("SELECT $column FROM $table LIMIT 1");
        echo "Coluna '$column' já existe na tabela '$table'.<br>";
    } catch (Exception $e) {
        echo "Adicionando coluna '$column' na tabela '$table'...<br>";
        try {
            $pdo->exec("ALTER TABLE $table ADD COLUMN $column $definition");
            echo "<strong style='color:green'>Sucesso!</strong><br>";
        } catch (Exception $e2) {
             echo "<strong style='color:red'>Erro ao adicionar:</strong> " . $e2->getMessage() . "<br>";
        }
    }
}

try {
    echo "<h3>Atualizando Estrutura do Banco de Dados</h3>";

    // Users table - Fix for "Unknown column 'departmentId'"
    addColumnIfNotExists($pdo, 'users', 'departmentId', 'INT NULL');
    
    // Locations table - Just in case
    addColumnIfNotExists($pdo, 'locations', 'photo', 'VARCHAR(500) NULL');

    echo "<br>---------------------------------------------------<br>";
    echo "<strong>Atualização Concluída!</strong><br>";
    echo "Agora você pode voltar ao painel e tentar criar o usuário novamente.";

} catch (PDOException $e) {
    echo "<strong style='color:red'>Erro Fatal:</strong> " . $e->getMessage();
}
?>
