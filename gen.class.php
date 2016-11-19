<?php
  ob_start();
  session_start();
  //$db = new mysqli("localhost", "root", "", "apl");

  class Gen
  {
    public $db;
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
          //throw new Exception("не удалось выбрать данные результатов матчей: (".$this->db->errno.") ". $this->db->error);
          return false;
        }
        else {$items = $res->fetch_all(MYSQLI_ASSOC); $res->free;} 
        return $items;
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
      
      if($upd == $t) // отображаем форму для внесения данных о результатах матчей
      {
        $bg = 0;
        echo "<table>";
          echo "<caption>Тур ".$t."</caption>";
          echo "<form action='' method='post'>";
          foreach($res as $r)
          {
            if($bg < 1) $bg = 1;
            //echo "<input type='hidden' name='id_m' value='".$r['id']."'>";
            //echo "<tr>";
            echo ($bg == 2) ? "<tr class='tr_bg'>" : "<tr>";
            echo "<td class='td_t td_t1'>".$r['t1']."</td>";

            //echo "<td><select name='g1[".$r['id']."]'>";
            echo "<td class='td_upd_sh'><select name='g1[".$r['id']."]'>";
            if($r['g1'] === NULL) $sel = "selected";
            echo "<option ".$sel." value='-'>&ndash;</option>";
              for($i=0; $i<10; $i++)
              {
                //$sel = ($i == $r['g1']) ? "selected" : NULL;
                if($r['g1'] !== NULL and $i == $r['g1']) $sel = "selected";
                else $sel = "NULL";
                echo "<option ".$sel." value=".$i.">".$i."</option>";
              }
            echo "</select></td>";

            echo "<td> : </td>";

            //echo "<td><select name='g2'>";
            echo "<td><select name='g2[".$r['id']."]'>";
            echo "<option value='-'>&ndash;</option>";
              for($i=0; $i<10; $i++)
              {
                //$sel = ($i == $r['g2']) ? "selected" : NULL;
                if($r['g1'] !== NULL and $i == $r['g1']) $sel = "selected";
                else $sel = "NULL";
                echo "<option ".$sel." value=".$i.">".$i."</option>";
              }
            echo "</select></td>";


            echo "<td class='td_t'>".$r['t2']."</td>";
            echo "<td class='td_d'>".$r['date']."</td>";
            echo "</tr>";
            if($bg == 1) { $bg = 2; continue; }
            if($bg == 2) $bg = 1;
          }
        echo "<tr><td colspan='5'><input type='submit' value='Внести результаты'></td></tr>";
        echo "</form>"; 
        echo "</table>"; 
      }
      //if(!$upd)
      else
      {
        $bg = 0;
        echo "<table>";
          echo "<caption>Тур ".$t."</caption>";
          foreach($res as $r)
          {
            if($bg < 1) $bg = 1;
            $sch = $r['g1'].":".$r['g2'];
            //echo ($bg == 2) ? "<tr class='tr_bg'>" : "<tr>";
            echo ($bg == 2) ? "<tr class='tr_bg'>" : "<tr>";
            echo "<td class='td_t td_t1'>".$r['t1']."</td>";
            echo "<td class='td_s'>".$sch."</td>";
            echo "<td class='td_t'>".$r['t2']."</td>";
            echo "<td class='td_d'>".$r['date']."</td>";
            /*
            echo "<tr>";
            echo "<td>".$r['t1']."</td>";
            echo "<td>".$sch."</td>";
            echo "<td>".$r['t2']."</td>";
            echo "<td>".$r['date']."</td>";
            */
            echo "</tr>";
            if($bg == 1) { $bg = 2; continue; }
            if($bg == 2) $bg = 1;
          }
        echo "<tr><td colspan='4'><a href='index.php?cal=".$_GET['cal']."&upd=".$t."'>Внести результаты</a></td></tr>";
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
      if(!is_int($upd)) $upd = (int) abs($upd);

      if($d < $t)
        {
          $d=$d+$t;
          $t=$d-$t;
          $d=$d-$t;
        }
      
      if($upd >= $t or $upd <= $d)
      {
        for($i=$t; $i<=$d; $i++)
        {
          if($upd == $i)
          {
            if($res = $this->getTour($i))
              if(count($res) > 1)
                $this->getTable($i, $res, $upd);
                echo "<br>";
            break;
          }
        }
      }
      
      for($i=$t; $i<=$d; $i++)
      {
        if($upd == $i) continue;
        if($res = $this->getTour($i))
          if(count($res) > 1)
            $this->getTable($i, $res, $upd);
            echo "<br>";
      }
    }
    
      /**
     * вносим данные в БД
     * @param array, $g1  - значение голов забитыми хозяевами
     * @param array, $g2  - значение голов забитыми гостями
     * return bool;
     */   
    function setRes(array $g1, array $g2)
    {
      if(!is_array($g1) or !is_array($g2)) return false;
      
      $match = []; // результатирующий массив, для передачи данных
      foreach($g1 as $key => $val)
      {
        if($val == '-') continue;
        $match[$key]['g1'] = (int) abs($val);
      }
      
      foreach($g2 as $key => $val)
      {
        if($val == '-') continue;
        $match[$key]['g2'] = (int) abs($val);
      }
      
      $upd = [];
      foreach($match as $key => $val)
      {
        $upd[$key] = "UPDATE results
                        SET g1 = ";
        foreach($val as $k => $v)
        {
          if($k == 'g1') $upd[$key] .= $v.", ";
          if($k == 'g2') $upd[$key] .= "g2 = ".$v;
        }
        $upd[$key] .= " WHERE ID = ".$key;
      }
      
      foreach ($upd as $sql)
        if(!$this->db->query($sql)) return false;
      return true;
      //return $sql;
    }
    
    function headAplTable()
    {
      $res = "<tr class='tr_head_bg'>";
      $res .= "<th>#</th>";
      $res .= "<th>Команда</th>";
      $res .= "<th class='th_haed'>И</th>";
      $res .= "<th class='th_haed'>В</th>";
      $res .= "<th class='th_haed'>Н</th>";
      $res .= "<th class='th_haed'>П</th>";
      $res .= "<th class='th_haed'>ЗАБ</th>";
      $res .= "<th class='th_haed'>ПРО</th>";
      $res .= "<th class='th_haed'>РАЗН</th>";
      $res .= "<th class='th_haed'>О</th>";
      $res .= "</tr>";
      return $res;
    }
    
    function showTurTable($tur)
    {
      if(!is_int($tur)) $tur = (int) abs($tur);
      $sql = "CALL ins_temp(".$tur.")";
      if(!$res = $this->db->query($sql))
        echo "Произошла ошибка: ".$this->db->errno." при вызове процедуры ins_temp() - ".$this->db->error;
      $result = $res->fetch_all(MYSQLI_ASSOC);
      //$res->free;
      while($this->db->next_result()) $this->db->store_result();
      
      echo "<table class='apl'><caption>Турнирная таблица Английской Премьер-Лиги (Тур: ".$tur.")</caption>";
      
      echo $this->headAplTable(); // выводим шапку для таблицы
      
      $i = 1;
      $bg = 0;
      foreach($result as $items)
      {
        if($bg < 1) $bg = 1;
        echo ($bg == 2) ? "<tr class='tr_bg'>" : "<tr>";
        echo "<td>".$i."</td>";
        foreach ($items as $k => $it) // выводим данные из турнирной таблицы
        {
          if($k == 'id') continue; 
          echo ($k == 'name') ? "<td class='td_name'>".$it."</td>" : "<td>".$it."</td>"; 
        }
        echo "</tr>";
        $i++;
        if($bg == 1) { $bg = 2; continue; }
        if($bg == 2) $bg = 1;
      }
      echo "</table>"; 
    }
    
    
     /**
     * Показываем турнирную таблицу
     * @param array, $g1  - значение голов забитыми хозяевами
     * @param array, $g2  - значение голов забитыми гостями
     * return bool;
     */   
    function showAplTable()
    {
      $sql = "SELECT * FROM apl ORDER BY points DESC, goals_res DESC, goals_out DESC";
      
      if(!$res = $this->db->query($sql))
        return "Произошла ошибка получения данных".$this->db->error;
      //return $res->fetch_all(MYSQLI_ASSOC);
      
      echo "<table class='apl'><caption>Турнирная таблица Английской Премьер-Лиги &nbsp;&nbsp;&nbsp;(".$this->rusDate().")</caption>";
      
      echo $this->headAplTable(); // выводим шапку для таблицы
      
      $i = 1;
      $bg = 0;
      foreach($res->fetch_all(MYSQLI_ASSOC) as $items)
      {
        if($bg < 1) $bg = 1;
        if($i > 5) echo ($bg == 2) ? "<tr class='tr_bg'>" : "<tr>";
        else
        {
          if($i == 1 or $i == 3) echo "<tr class='tr_lc1'>";
          if($i == 2 or $i == 4) echo "<tr class='tr_lc2'>";
          if($i == 5) echo "<tr class='tr_le'>";
        }
        echo "<td>".$i."</td>";
        foreach ($items as $k => $it) // выводим данные из турнирной таблицы
        { 
          if($k == 'id') continue; 
          echo ($k == 'name') ? "<td class='td_name'>".$it."</td>" : "<td>".$it."</td>";   
        }
        echo "</tr>";
        $i++;
        if($bg == 1) { $bg = 2; continue; }
        if($bg == 2) $bg = 1;
      }
      echo "</table>";
    }
    
      /**
     * Переводчик месяцев для date()
     * @param string, $m  - значение месяца, который нужно перевести
     * return string; // возвращает русское название месяца
     */ 
    function transMonth($m)
    {
      switch($m)
      {
        case 'January':   return 'Январь';
        case 'February':  return 'Февраль';
        case 'March':     return 'Март';
        case 'April':     return 'Апрель';
        case 'May':       return 'Май';
        case 'June':      return 'Июнь';
        case 'July':      return 'Июль';
        case 'August':    return 'Август';
        case 'September': return 'Сентябрь';
        case 'October':   return 'Октябрь';
        case 'November':  return 'Ноябрь';
        case 'December':  return 'Декабрь';
        default:  return $m;
      }
    }
    
     /**
     * Форматировщик даты для date()
     * return string; // преобразовывает значение в русский формат
     */
    function rusDate()
    {
      $m;
      switch(date('F'))
      {
        case 'January':   $m = 'января'; break;
        case 'February':  $m = 'февраля'; break;
        case 'March':     $m = 'марта'; break;
        case 'April':     $m = 'апреля'; break;
        case 'May':       $m = 'мая'; break;
        case 'June':      $m = 'июня'; break;
        case 'July':      $m = 'июля'; break;
        case 'August':    $m = 'августа'; break;
        case 'September': $m = 'сентября'; break;
        case 'October':   $m = 'октября'; break;
        case 'November':  $m = 'ноября'; break;
        case 'December':  $m = 'декабря'; break;
        default:  $m = date('F');
      }
      return date('d')." ".$m." ".date('Y');
    }
    
  }

  $gen = new Gen(new mysqli("localhost", "root", "", "pl"));

?>