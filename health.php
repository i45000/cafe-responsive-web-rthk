<?php

header('Content-Type: application/json');
header('Cache-Control: no-store, no-cache, must-revalidate');

$versionFile = __DIR__ . '/VERSION';

$version = file_exists($versionFile)
    ? trim(file_get_contents($versionFile))
    : 'unknown';

http_response_code(200);

echo json_encode([
    'status' => 'healthy',
    'application' => 'AWS Cafe',
    'version' => $version
]);
