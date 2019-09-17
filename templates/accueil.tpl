<!-- accueil.tpl by Jean-Sébastien St-Pierre STPJ15018206, September 2019
     This page is displayed by the flask server for route '/' -->
	 
<!DOCTYPE html>
<html>
<html lang="fr">
    <head>
        <meta charset="latin-1" />
		<title>{{ titre }}</title>
		
		<!-- A bit of CSS to make this look almost pretty -->
		<style>
		h1 {text-align:center;}
		div {text-align:center;}
		p {text-align:center;}
		img {
			width: 300px;
			display: block;
			margin: auto;
		}
		</style>
    </head>

    <body>
        <h1>{{ titre }}</h1>
		<img src="/static/scrat.jpg" alt="Scrat!!!" height="300" width="300"><br>
		<font size = "4">
		
		{% if not result %} <!-- Form will be displayed only if !result -->
		<form>
			<fieldset>
			<div><strong><font size = "5">Tentez de deviner le code secret: 5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8</font></strong><br><br>			
			<strong><label for='algorithmes'>Algorithme:</label></strong>
			<select name ="algorithmes">
				<option value = "md5">md5</option>
				<option value = "sha1">sha1</option>
				<option value = "sha224">sha224</option>
				<option value = "sha256">sha256</option>
				<option value = "sha384">sha384</option>
				<option value = "sha512">sha512</option>
			</select><br><br>
			
			<strong><label for='ans'>Votre réponse:</label></strong>
			<input type="text" id="ans" name="ans" pattern="[a-zA-Z0-9]+" >  <!-- Regex validation for alphanumeric-only input -->
			<input type="submit" value="Vérifier!" formmethod="post"></input><br><br>			
			
			</div>
			</fieldset>
		</form>
		
		{% else %} <!-- if result: display this instead of the form -->
		
		<strong>
		<p>Vous avez choisi l’algorithme: {{mode}}</p>
		<P>Votre réponse encodée donne: {{result}}</p>
		
		<font size = "5"><p>Cela {{verdict}} avec le code à deviner!</p></font>
		
		<p><a href="https://localhost:5000">Essayer à nouveau</a></p>
		
		{% endif %}
		
		</strong>
		</font>
		
		    
    </body>
</html>
