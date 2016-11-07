<?php require("gen.class.php"); // подулючаем обработчик ?>
<!DOCTYPE html>
<html lang="ru">
<head>
 <link href="stl.css" rel="stylesheet">
  <meta charset="UTF-8">
  <title>Document</title>
</head>
<body>
  <table>
    <caption>Тур 1</caption>
    <tr>
      <td>Арсенал</td>
      <td>3:3</td>
      <td>Ливерпуль</td>
      <td>6.12.2016</td>
    </tr>
  </table>
  <a href="index.php?upd=1">Внести изменения</a>
  
  <?php
    if($_GET['upd']) // вносим изменения в результаты
    { ?>
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
      
      <?php // вносим изменения, если тур выбран
        if($_POST['tour'])
        {
          if(!$res = $gen->getTour($_POST['tour']))
            echo "Нет выбранных туров";
          else
          {
            echo "<table>";
            echo "<caption>Тур ".$_POST['tour']."</caption>";
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
            echo "</table>";
          }         
        }
      ?>
    
  <?php } // конец $_GET['upd']?> 
</body>
</html>