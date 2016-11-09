<?php require("gen.class.php"); // подулючаем обработчик ?>
<!DOCTYPE html>
<html lang="ru">
<head>
 <link href="stl.css" rel="stylesheet">
  <meta charset="UTF-8">
  <title>Document</title>
</head>
<body>
  <h1>Английская Премьер-Лига, сезон 16/17</h1>
  <p><a href="index.php?cal=1">Выбрать тур</a></p>
  <p><a href="index.php?cal=2">Показать весь календарь</a></p>
  
  <?php
    if($_GET['cal']){ // вносим изменения в результаты
      if($_GET['cal'] == 1) // отображаем календарь по турам
        { // отображаем один конкретный тур ?>
          <form action="" method="post">
            <p>Выберите тур:
            <select name="tour">
            <?php 
              for($i=1; $i<=38; $i++) 
              {
                $sel = ($_POST['tour'] == $i) ? " selected" : NULL;
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
                $sel = ($_POST['tour_ot'] == $i) ? " selected" : NULL;
                echo "<option".$sel." value = ".$i.">".$i."</option>";
              }
              ?></select> и до:&nbsp;<select name="tour_do">
            <?php 
              for($i=1; $i<=38; $i++) 
              {
                if($i < $_POST['tour_ot']) continue;
                $sel = ($_POST['tour_do'] == $i) ? " selected" : NULL;
                echo "<option".$sel." value = ".$i.">".$i."</option>";
              }
            ?>
            </select>
            <input type="submit" value="выбрать">
            </p>
          </form>

          <?php // отоюражаем календарь матчей
        
            if($_POST['tour'])
            {
              if(!$res = $gen->getTour($_POST['tour']))
                echo "Нет выбранных туров";
              else
                $gen->getTable($_POST['tour'], $res, $_GET['upd']);
            }
            // отображаем диапазон туров
            if($_POST['tour_ot'] or $_POST['tour_do'])
              $gen->getTableDiap($_POST['tour_ot'], $_POST['tour_do'], $_GET['upd']);
        }
      
        if($_GET['cal'] == 2) // отображаем весь календарь
          $gen->getTableDiap();
    } // конец $_GET['upd'] ?>
</body>
</html>