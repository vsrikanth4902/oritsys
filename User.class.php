<?php

class UserWordList {

    public function getTextfileContent($filename) {
        try {

            $Content = array();
            $allWords = array();

            $filepath = dirname(__FILE__) . "/";
            $handle = fopen($filepath . $filename, "r") or die("Couldn't open file");
            if ($handle) {
                while (!feof($handle)) {
                    $buffer = fgets($handle, 4096);
                    $words = explode(' ', $buffer);
                    $allWords = array_merge($allWords, $words);
                }
                fclose($handle);
            }
            return array_values(array_unique($allWords));
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }

    function get_file_dir() {
        global $argv;
        $dir = dirname(getcwd() . '/' . $argv[0]);
        $curDir = getcwd();
        chdir($dir);
        $dir = getcwd();
        chdir($curDir);
        return $dir;
    }

    public function AddWordContent($content, $filename) {      
        $objDB = new db();
        foreach ($content as $res) {
            $word_name = $res;

            $sql = "INSERT IGNORE INTO wordlist(word_name,file_name,created_on) VALUES('" . trim(addslashes($res)) . "','" . $filename . "',NOW())";
            $objDB->insert($sql);
        }

        return $count_unique_words = $this->Countuniquelist($filename);
    }

    public function Countuniquelist($filename) {
        $objDB = new db();
        $sql = "Select list_id from wordlist where file_name='$filename'";
        $res = $objDB->selectAll($sql);
        return count($res);
    }

    public function getwatchListwords($filename) {
        $objDB = new db();
        $sql = "SELECT wl.word_name FROM wordlist wl 
JOIN watchlist wc ON wc.keywords=wl.word_name
WHERE 1=1 AND file_name='$filename'";
        return $res = $objDB->selectAll($sql);
    }

}
