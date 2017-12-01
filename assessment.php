<?php

set_time_limit(0);
require_once 'DB.class.php';
require_once 'User.class.php';
$filename = $argv[1];
try {
    if ($filename == '') {
        throw new Exception('File name empty');
    }
    $wordobj = new UserWordList();
    $content = $wordobj->getTextfileContent($filename);

    $countWords = $wordobj->AddWordContent($content, $filename);
    echo 'Distinct unique words: ' . $countWords . "\n";

    $watchlist = $wordobj->getwatchListwords($filename);

    echo 'Watchlist words:' . "\n";

    foreach ($watchlist as $result) {

        echo $result['word_name'] . "\n";
    }
} catch (Exception $e) {
    echo $e->getMessage();
}



