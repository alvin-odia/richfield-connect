<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

// ________________GET Requests__________________________
if ($method === 'GET') {
    if ($action === 'room' && isset($_GET['slug'])) {
        $stmt = $pdo->prepare('SELECT * FROM rooms WHERE slug = ?');
        $stmt->execute([$_GET['slug']]);
        $room = $stmt->fetch();
        
        if ($room) {
            echo json_encode($room);
        } else {
            http_response_code(404);
            echo json_encode(["error" => "Room not found"]);
        }
    } elseif ($action === 'books') {
        $stmt = $pdo->query('SELECT * FROM books ORDER BY created_at DESC');
        echo json_encode($stmt->fetchAll());
    } elseif ($action === 'activities') {
        $stmt = $pdo->query('SELECT * FROM activities ORDER BY created_at DESC');
        echo json_encode($stmt->fetchAll());
    } else {  }
}

// __________________POST Requests______________________________
if ($method === 'POST') {
    if ($action === 'apply') {
        $data = json_decode(file_get_contents("php://input"), true);
        
        if (!empty($data['name']) && !empty($data['email']) && !empty($data['introduction'])) {
            $stmt = $pdo->prepare('INSERT INTO applications (full_name, email, introduction) VALUES (?, ?, ?)');
            $stmt->execute([$data['name'], $data['email'], $data['introduction']]);
            
            http_response_code(201);
            echo json_encode(["message" => "Application submitted successfully"]);
        } else {
            http_response_code(400);
            echo json_encode(["error" => "Incomplete form data"]);
        }
    }
}
?>
