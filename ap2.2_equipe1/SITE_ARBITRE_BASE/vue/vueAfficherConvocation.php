<table>
<fieldset>
<legend>Les équipes :</legend>
	<?php
foreach ($equipes as $equipe) {
	?>
	<input type="text" name="num_equipe" value="<?php echo $equipe['num_equipe']; ?>">
	<input type="text" name="nom_equipe" value="<?php echo $equipe['nom_equipe']; ?>">
	<br/>
	<?php
}
	?>
</fieldset>
<br/>


<table>
<fieldset>
<legend>Les arbitres :</legend>
	<?php
foreach ($arbitres as $arbitre) {
	?>
	<input type="text" name="num_arbitre" value="<?php echo $arbitre['num_arbitre']; ?>">
	<input type="text" name="nom_arbitre" value="<?php echo $arbitre['nom_arbitre']; ?>">
	<input type="text" name="prenom_arbitre" value="<?php echo $arbitre['prenom_arbitre']; ?>">
	<br/>
	<?php
}
	?>
</fieldset>

<fieldset>
<legend>Saisir un match :</legend>

<form action="?action=AfficherConvoc" method="POST">
	<input type="text" name="num_match" value="" placeholder="Saisissez un match">
	<input type="submit" name="btn" value="Saisir">
</fieldset>
<td>
</form>





























<?php
if ($message != "") { ?>
	<div class="alert success"> 
	  <?= $message ?>.
	</div>
<?php } ?>

<?php
if ($erreur != "") { ?>
	<div class="alert warning">
	   <?= $erreur ?>
	</div>
<?php } ?>
<?php
/*
<input type="text" name="nom_division" value="<?php echo $ligne['nom_division']; ?>">
<input type="hidden" name="num_division" value="<?php echo $ligne['num_division']; ?>">

</td>
</form>
</tr>

<?php

?>
</table>*/
?>