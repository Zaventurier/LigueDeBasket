<?php 



?>
<h2>Formulaire</h2>
<div>
<table>
<?php
foreach ($lignes as $ligne) {
	$confirm = $ligne['nom_division']." est sur le point d\'être supprimé ! Cette action est irréversible ! Confirmez vous la supression ?";
	?>
<tr>
<form action="?action=GestionDivision" method="POST">
<td>

<input type="text" name="nom_division" value="<?php echo $ligne['nom_division']; ?>">
<input type="hidden" name="num_division" value="<?php echo $ligne['num_division']; ?>">
</td>
<td><input type="submit" name="btn" value="Modifier"></td>
<td><input type="submit" name="btn" value="Supprimer" onclick="return confirm ('<?= $confirm; ?>');"></td>
</form>
</tr>

<?php
}
?>
</table>
<br>
<br>

<fieldset>
<legend>Ajouter une division</legend>
<form action="?action=GestionDivision" method="POST">
<input type="text" name="nom_division" value="" placeholder="Saisissez un nom de division">
<input type="submit" name="btn" value="Ajouter">
</fieldset>



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

</div>
</div>
</form>


