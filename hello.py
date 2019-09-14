#!/usr/bin/python
# -*- coding: latin-1 -*-

from flask import Flask, request, render_template
import hashlib

app = Flask(__name__)

@app.route('/', methods = ['GET', 'POST'])
def accueil():
	secretHash = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
	titre = "Découvrez le code secret!!!"
	
	if request.method == 'POST':
		answer = request.form.get('ans')
		mode = request.form.get('algorithmes')
		print(mode)
		myAns = isSameShit(answer, mode, secretHash)
		result = myAns
		return render_template('accueil.tpl', titre=titre, result = result)
		
	else :
		return render_template('accueil.tpl', titre = titre)
		
def isSameShit(ans, mode, hash):
	print(mode)
	switcher={
		"md5": hashlib.md5(),
		"sha1": hashlib.sha1(),
		"sha224": hashlib.sha224(),
		"sha256": hashlib.sha256(),
		"sha384": hashlib.sha384(),
		"sha512": hashlib.sha512()
	}
	
	hashMode = switcher.get(mode, "Error!!!")
	print(hashMode)
	hashMode.update(ans.encode('utf-8'))
	print(ans.encode('utf-8'))
	#hashmode=hashlib.md5().update(ans.encode('utf-8'))
	print(hashMode)
	hashed = hashMode.hexdigest()
	hashedString = hash + '   ,   ' + hashed
	return hashedString
	
# @app.route('/')
# def accueil():
	# mots = ["bonjour", "a", "toi,", "visiteur."]
	# titre = "Découvrez le code secret!!!"
	# return render_template('accueil.tpl', titre=titre, mots=mots)

if __name__ == '__main__':
	app.run(ssl_context=('travail2_cert.crt', 'travail2_pv.key'))