<!DOCTYPE html>
<html>
<html lang="fr">
    <head>
        <meta charset="latin-1" />
		<title>{{ titre }}</title>		
    </head>

    <body>
        <h1>{{ titre }}</h1>
		<img src="/static/scrat.jpg" alt="Scrat!!!" height="300" width="300">
		
		<form SolveThisShit>
			<fieldset>
			<div><strong>Tentez de deviner le code secret: 5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8</strong><br><br>			
			<strong><label for='algorithmes'>Algorithme:</label></strong>
			<select algorithmes name="algorithmes">
				<option value = "md5">md5</option>
				<option value = "sha1">sha1</option>
				<option value = "sha224">sha224</option>
				<option value = "sha256">sha256</option>
				<option value = "sha384">sha384</option>
				<option value = "sha512">sha512</option>
			</select><br><br>
			
			<strong><label for='ans'>Votre réponse:</label></strong>
			<input type="text" name="ans">
			<input type="submit" value="Vérifier!" formmethod="post"></input><br><br>
			{{result}}<br>
			{{mode}}<br>
			
			</div>
			</fieldset>
			
		</form>
			
		    
    </body>
</html>
