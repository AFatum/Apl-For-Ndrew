<?php
  ob_start();
  //$db = new mysqli("localhost", "root", "", "apl");

  class Gen
  {
    protected $db;
    private static $_instance;
    
    /**
     * соединяемся с БД
     * @param object mysqli $db
     * return void
    */
    function __construct (mysqli $db)
    {  
      // если не удалось соедениться с бд, отлавливаем исключение
        if ($db->connect_errno)
         throw new Exception("Не удалось подключиться к MySQL: (".$db->connect_errno.") ". $db->connect_error);
        else $this->db = $db; // если всё нормально, присваиваем значение $db;
    }
    
    /**
     * получаем массив данных, календарь данных из БД
     * @param int, $t   // номер тура
     * return array[];
    */
    function getTour($t = "all")
    {
      if($t == 'all')
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
      }  
    
    /**
     * формируем таблицу из полученных данных
     * @param int, $t     - номер тура
     * return void;
     */
    function getTable($t, $res=[], $upd=false)
    {
      // проверяем входящие параметры
      if(!is_int($t)) $t = (int) abs($t);
      if(!is_array($res) or count($res) < 1) return false;
      
      if(!$upd)
      {
        echo "<table>";
          echo "<caption>Тур ".$t."</caption>";
          foreach($res as $r)
          {
            $sch = $r['g1'].":".$r['g2'];
            echo "<tr>";
            echo "<td>".$r['t1']."</td>";
            echo "<td>".$sch."</td>";
            echo "<td>".$r['t2']."</td>";
            echo "<td>".$r['date']."</td>";
            echo "</tr>";
          }
        echo "<tr><td colspan='4'><a href='index.php?cal=1&upd=".$t."'>Внести результаты</a></td></tr>";
        echo "</table>";         
      }
      else if($upd == $t)
      {
        echo "<table>";
          echo "<caption>Тур ".$t."</caption>";
          echo "<form action='' method='post'>";
          foreach($res as $r)
          {
            echo "<tr>";
            echo "<td>".$r['t1']."</td>";

            echo "<td><select name='g1'>";
              for($i=0; $i<10; $i++)
              {
                $sel = ($i == $r['g1']) ? "selected" : NULL;
                echo "<option ".$sel." value=".$i.">".$i."</option>";
              }
            echo "</select></td>";

            echo "<td> : </td>";

            echo "<td><select name='g2'>";
              for($i=0; $i<10; $i++)
              {
                $sel = ($i == $r['g2']) ? "selected" : NULL;
                echo "<option ".$sel." value=".$i.">".$i."</option>";
              }
            echo "</select></td>";


            echo "<td>".$r['t2']."</td>";
            echo "<td>".$r['date']."</td>";
            echo "</tr>";
          }
        echo "<tr><td colspan='5'><input type='submit' value='Внести результаты'></td></tr>";
        echo "</form>"; 
        echo "</table>"; 
      }
    }
   
      /**
     * формируем таблицу результатов из нескольких туров
     * @param int, $t     - номер начального тура
     * @param int, $d     - номер конечного тура
     * return void;
     */
    function getTableDiap($t=1, $d=38, $upd=false)
    {
      if(!is_int($t)) $t = (int) abs($t);
      if(!is_int($d)) $d = (int) abs($d);

      if($d < $t)
        {
          $d=$d+$t;
          $t=$d-$t;
          $d=$d-$t;
        }
      
      for($i=$t; $i<=$d; $i++)
      {
        if($res = $this->getTour($i))
          if(count($res) > 1)
            $this->getTable($i, $res, $upd);
            echo "<br>";
      }
    }
  }

  $gen = new Gen(new mysqli("localhost", "root", "", "apl"));

?>