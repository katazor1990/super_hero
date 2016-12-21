<?php
require_once "connexion.php";
require_once "SuperHero.php";

if (isset($_POST)&&!empty($_POST)){
    $sql = "INSERT INTO sh_hero(hero_first_name,
                            hero_last_name,
                            hero_pseudo,
                            hero_country,
                            hero_team_id)
        VALUES (?,?,?,?,?)";
    $params = [
        $_POST['heroFirstName'],
        $_POST['heroLastName'],
        $_POST['heroPseudo'],
        $_POST['heroCountry'],
        1
    ];
    $con = new connexion();
    $con->requestDB($sql,$params);
}



$sql = "SELECT * FROM super_heros.sh_hero;";
$con = new connexion();
$result = $con->requestDB($sql);
$heroes = [];
while ($row = $result->fetch()){
    $hero = new SuperHero();
    $hero->hydrate($row);
    $heroes[] = $hero;
}
var_dump($heroes);
$result->closeCursor();


?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Super Hero</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<form action="index.php" method="post">
    <fieldset>
        <legend>Ajouter un super hero</legend>
    </fieldset>
    <div>
        <div class="form-group">
            <label for="heroFirstName" class="col-sm-2 control-label">Prénom</label>
            <div class="col-sm-10">
                <input type="text" name="heroFirstName" id="heroFirstName" class="form-control" placeholder="">
            </div>
        </div>
        <div class="form-group">
            <label for="heroLastName" class="col-sm-2 control-label">Nom</label>
            <div class="col-sm-10">
                <input type="text" name="heroLastName" id="heroLastName" class="form-control" placeholder="">
            </div>
        </div>
        <div class="form-group">
            <label for="heroPseudo" class="col-sm-2 control-label">Identité Secrete</label>
            <div class="col-sm-10">
                <input type="text" name="heroPseudo" id="heroPseudo" class="form-control" placeholder="">
            </div>
        </div>
        <div class="form-group">
            <label for="heroCountry" class="col-sm-2 control-label">Pays</label>
            <div class="col-sm-10">
                <input type="text" name="heroCountry" id="heroCountry" class="form-control" placeholder="">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-10 col-sm-2">
                <input type="submit" class="btn btn-default" value="Ajouter">
            </div>
        </div>
    </div>

</form>
<section>
    <table>
    <thead>
        <tr>
            <th>Prenom</th>
            <th>Nom</th>
            <th>Identite Secrete</th>
            <th>Pays</th>
            <th>Equipe</th>
            <th>Option</th>
        </tr>
        </thead>
        <tbody>
            <?php foreach($heroes as $oneHero)?>
            <tr>
                <!-- printr() -->
                <td><?= $oneHero->getHeroFirstName()?></td>
                <td><?= $oneHero->getHeroLastName()?></td>
                <td><?= $oneHero->getHeroPseudo()?></td>
                <td><?= $oneHero->getHeroCountry()?></td>
                <td><?= $oneHero->getHeroTeamId()?></td>
                <td><a href="index.php?id=<?= $oneHero->getHeroID() ?>">Supp</td>
            </tr>
        </tbody>
    </table>
</section>
</body>
</html>
