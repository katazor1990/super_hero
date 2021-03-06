<?php

/**
 * Created by PhpStorm.
 * User: r-1
 * Date: 20/12/2016
 * Time: 12:18
 */
class connexion
{
    private function connectDB(){
        $host = "127.0.0.1";
        $port = 3306;
        $db = "super_heros";
        $user = "root";
        $pwd = "";
        try {
            $pdo = new PDO("mysql:host=$host;port=$port;dbname=$db",$user,$pwd);
           /* $pdo->setAttributes (PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
            return $pdo;
        }
        catch (PDOException $exception){
            echo "Erreur PDO : ".$exception->getMessage();
            return null;
        }
    }

    public function requestDB($sql, $params = null){
        $pdo = $this->connectDB();
        try {
            if($params===null){
                $stmt = $pdo->query($sql);
                $pdo = null;
                return $stmt;
            }else {
                $stmt = $pdo->prepare($sql);
                $stmt->execute($params);
                $pdo = null;
                return $stmt;
            }
        }catch (PDOException $PDOException){
            echo "erreur PDO : ".$PDOException->getMessage();
            return null;
        }catch (Exception $exception){
            echo "erreur non PDO : ".$exception->getMessage();
            return null;
        }
    }
}