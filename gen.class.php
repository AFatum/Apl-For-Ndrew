<?php
  ob_start();
  //$db = new mysqli("localhost", "root", "", "apl");

  class Gen
  {
    protected $db;
    
    
    function __construct (mysqli $db)
    {  
      // если не удалось соедениться с бд, отлавливаем исключение
        if ($db->connect_errno)
         throw new Exception("Не удалось подключиться к MySQL: (".$db->connect_errno.") ". $db->connect_error);
        else $this->db = $db; // если всё нормально, присваиваем значение $db;
    }
    
    /*function getTour($t = "all")
    {
      if(is_string($t))
        $sql = "SELECT * FROM results";
      else
       {
        $t = (int) abs($t);
        $sql = "SELECT * FROM results
                  WHERE tour = ".$t;
       }
        if(!$res = $this->db->query($sql))
        {
          throw new Exception("не удалось выбрать данные результатов матчей: (".$this->db->errno.") ". $this->db->error);
          return false;
        }
        else return $res->fetch_all(MYSQLI_ASSOC);
      }  */ 
    function getTour($t = "all")
    {
      if(!is_int($t)) $t = (int) abs($t);
      
      $sql = "SELECT * FROM rt".$t;

      if(!$res = $this->db->query($sql))
      {
          throw new Exception("не удалось выбрать данные результатов матчей: (".$this->db->errno.") ". $this->db->error);
          return false;
      }
      else return $res->fetch_all(MYSQLI_ASSOC);
    }
  }

  $gen = new Gen(new mysqli("localhost", "root", "", "apl"));

?>