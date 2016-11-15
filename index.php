<?php require("gen.class.php"); // подулючаем обработчик ?>
<!DOCTYPE html>
<html lang="ru">
<head>
 <link href="stl.css" rel="stylesheet">
  <meta charset="UTF-8">
  <title>Английская Премьер-Лига</title>
</head>
<body>
  <h1>Английская Премьер-Лига, сезон 16/17</h1>
  <p><a href="index.php?cal=1">Выбрать тур</a></p>
  <p><a href="index.php?cal=2">Показать весь календарь</a></p>
  
  <?php
  
    if($_POST) // заносим значение сессионных переменных
    {
      if($_POST['tour'])
      {
        $_SESSION['tour'] = (int) abs($_POST['tour']);
        $_SESSION['cal'] = 1;
      }
      
      if($_POST['tour_ot'] or $_POST['tour_do'])
      {
        $_SESSION['tour_ot'] = (int) abs($_POST['tour_ot']);
        $_SESSION['tour_do'] = (int) abs($_POST['tour_do']);
        $_SESSION['cal'] = 2;
      }
      
      $gt = ($_GET['cal']) ? "?cal=".$_GET['cal'] : NULL;
      
      if($_POST['g1'] and $_POST['g2'])
      {
        $_SESSION['g1'] = $_POST['g1'];
        $_SESSION['g2'] = $_POST['g2'];
        $_SESSION['upd'] = true;
        $gt = "?cal=".$_GET['cal']."&upd=".$_GET['upd'];
      }
      
      header("Location: index.php".$gt);
    }
  
    if($_GET['cal']) // выводим результат запроса из бд
    { // вносим изменения в результаты
      if($_GET['cal'] == 1) // отображаем календарь по турам
      { // отображаем один конкретный тур ?>
          <form action="" method="post">
            <p>Выберите тур:
            <select name="tour">
            <?php 
              for($i=1; $i<=38; $i++) 
              {
                $sel = ($_SESSION['tour'] == $i) ? " selected" : NULL;
                echo "<option".$sel." value = ".$i.">".$i."</option>";
              }
            ?>
            </select>
            <input type="submit" value="выбрать">
            </p>
          </form>
          <form action="" method="post">
            <p>Выберите диапазон туров от:
            <select name="tour_ot">
            <?php 
              for($i=1; $i<=38; $i++) 
              {
                $sel = ($_SESSION['tour_ot'] == $i) ? " selected" : NULL;
                echo "<option".$sel." value = ".$i.">".$i."</option>";
              }
              ?></select> и до:&nbsp;<select name="tour_do">
            <?php 
              for($i=1; $i<=38; $i++) 
              {
                if($i < $_SESSION['tour_ot']) continue;
                $sel = ($_SESSION['tour_do'] == $i) ? " selected" : NULL;
                echo "<option".$sel." value = ".$i.">".$i."</option>";
              }
            ?>
            </select>
            <input type="submit" value="выбрать">
            </p>
          </form>

          <?php // отоюражаем календарь матчей
        
            if($_SESSION['tour'] and $_SESSION['cal'] == 1)
            {
              if(!$res = $gen->getTour($_SESSION['tour']))
                echo "Нет выбранных туров";
              else
                $gen->getTable($_SESSION['tour'], $res, $_GET['upd']);
            }
            // отображаем диапазон туров
            if(($_SESSION['tour_ot'] or $_SESSION['tour_do']) and $_SESSION['cal'] == 2)
              $gen->getTableDiap($_SESSION['tour_ot'], $_SESSION['tour_do'], $_GET['upd']);    
            
        }
      
        if($_GET['cal'] == 2) // отображаем весь календарь
          $gen->getTableDiap(1, 38, $_GET['upd']);
    } // конец $_GET['cal']
    
    //if($_SESSION['upd']) // вносим изменения результатов в БД
    if($_SESSION['g1'] and $_SESSION['g2']) // вносим изменения результатов в БД
    {
      $mat = $gen->setRes($_SESSION['g1'], $_SESSION['g2']);
      $mes = ($mat) ? "Данные внесены успешно" 
                    : "Произошла ошибка при внесении данных: ".$gen->db->error;
      echo $mes;
    }
  
  //catch (Exception $e){ echo $e->getMessage()."<br>"; }
  
  ?>
</body>
</html>