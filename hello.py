#!/usr/bin/python
# -*- coding: latin-1 -*-

# hello.py by Jean-Sébastien St-Pierre STPJ15018206, September 2019
# This is the logic implementation for the basic flask server

from flask import Flask, request, render_template
import hashlib
import re

app = Flask(__name__)

# Basic default route
@app.route('/', methods = ['GET', 'POST'])
def accueil():
	secretHash = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
	titre = "Découvrez le code secret!!!"
	
	# Data processing
	if request.method == 'POST':
		answer = request.form.get('ans')
		mode = request.form.get('algorithmes')
		pattern = "[a-zA-Z0-9]+"
		if not re.match(pattern, answer):
			return render_template('noWay.tpl', titre = "Nooooooo!", message = "Tu m'auras pas comme ça!!  ;)")
		hashed = hashThisShit(answer, mode)
		if hashed == secretHash:
			verdict = "correspond"
		else:
			verdict = "ne correspond pas"
			
		return render_template('accueil.tpl', titre = titre, result = hashed, mode = mode, verdict = verdict)
		
	else :
		return render_template('accueil.tpl', titre = titre)

# Error 404 management for any invalid GET request
@app.errorhandler(404)
def myErrorHandle(e):
	titre = "Erreur 404!  Page non trouvée!"
	message = "La page " + request.base_url + " n'existe pas!"
	return render_template('page404.tpl', titre = titre, message = message)
	
# Function returning the hashed value of user's input depending on the selected algorithm
def hashThisShit(ans, mode):
	switcher={
		"md5": hashlib.md5(),
		"sha1": hashlib.sha1(),
		"sha224": hashlib.sha224(),
		"sha256": hashlib.sha256(),
		"sha384": hashlib.sha384(),
		"sha512": hashlib.sha512()
	}
	
	hashMode = switcher.get(mode, "Error!!!")
	hashMode.update(ans.encode('utf-8'))
	return hashMode.hexdigest()
	
# App launcher in https mode with SSL keys ID
if __name__ == '__main__':
	app.run(ssl_context=('travail2_cert.crt', 'travail2_pv.key'))