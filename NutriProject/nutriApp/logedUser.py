class logedUser:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        cuser = self.session.get('cuser')
        if not cuser:
            cuser = self.session['cuser'] = {}
        self.cuser = cuser


    def setUser(self, user, trab):
        if str(user.id) not in self.cuser.keys():
            self.cuser[str(user.id)] = {
                "user_id" : user.id,
                "user_username" : user.username,
                "user_firstName" : user.first_name,
                "user_lastName" : user.last_name,
                "user_docIdentidadTrab": trab.doc_identidad_trab,
                "user_genero": trab.genero,
                "user_especialidad": trab.especialidad
            }
    
    def clear(self):
        self.session["cuser"] = {}
