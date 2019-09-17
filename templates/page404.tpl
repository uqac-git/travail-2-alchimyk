<!-- page404.tpl by Jean-Sébastien St-Pierre STPJ15018206, September 2019
     This page is displayed by the flask server following any invalid GET request -->
	 
<!DOCTYPE html>
<html>
<html lang="fr">
    <head>
        <meta charset="latin-1" />
		<title>{{ titre }}</title>
		<style>
		<!-- A bit of CSS again! -->
		h1 {text-align:center;}
		h2 {text-align:center;}
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
		<img src="/static/scrat2.jpg" alt="Scrat!!!" height="200" width="550">
		<h2>{{ message }}</h2>		
		<p><font size = "4"><a href="https://localhost:5000">Retour à l'accueil</a></font></p>
    </body>
</html>
