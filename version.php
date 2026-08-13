<?php

header('Content-Type: application/json');
header('Cache-Control: no-store, no-cache, must-revalidate');

$versionFile = __DIR__ . '/VERSION';

$version = file_exists($versionFile)
    ? trim(file_get_contents($versionFile))
    : 'unknown';

echo json_encode([
    'application' => 'AWS Cafe',
    'version' => $version
]);
