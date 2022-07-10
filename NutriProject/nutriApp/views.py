from datetime import datetime, date
from django.shortcuts import render, redirect
from .models import Paciente, Trabajador, Diagnostico, Categoria_alimento, Alimento
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout, user_logged_out
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test
from .logedUser import logedUser


#-------VARIABLES GLOBALES----------
loginUsuario = None
# NUTRISAN VIEWS
#------------AUTENTICACION---------------------
def loginUsuario(request):
    context = {}
    if request.method == 'POST':
        dataUsuario = request.POST['usuario']
        dataClave = request.POST['clave']

        print(dataUsuario)

        loginUsuario = authenticate(request, username=dataUsuario, password=dataClave)
        if(loginUsuario):
            login(request, loginUsuario)
            objUsuario = User.objects.get(pk=loginUsuario.id)
            trab = Trabajador.objects.get(usuario=objUsuario)
            setLogin = logedUser(request)
            setLogin.setUser(objUsuario, trab)                   
            return render(request, 'index.html')
        else:
            context = {
                'error': 'Usuario o contraseña incorrectos'
            }
    return render(request, 'loginUsuario.html', context)

def logoutUsuario(request):
    setLogin = logedUser(request)
    setLogin.clear()
    logout(request)
    context = {
        'success' : 'Sesión cerrada correctamente, Gracias por su visita!'
    }
    return render(request, 'loginUsuario.html', context)


def index(request):
    return render(request, 'index.html')

#-----------VISTAS DEL PACIENTE--------------------

def verPacientes(request):
    return render(request, 'verPacientes.html')

def verTodoPacientes(request):
    try:
        #Crear un objeto del modelo pacientes
        objPacientes = Paciente.objects.all()
        context = {
            'pacientes' : objPacientes,
        }
        return render(request, 'verPacientes.html', context)
    except Exception as e:
        context = {
            'error' : 'Error al mostrar pacientes: ' + str(e)            
        }
        return render(request, 'verPacientes.html', context)

def actualizarPaciente(request):
    return render(request, 'actualizarPaciente.html')


def registrarPaciente(request):
    # MultiValueDictKeyError   # ValidationError
    #Si el metodo es POST
    if request.method == 'POST':
        try:
            #crear un objeto del modelo paciente
            newPac = Paciente()
            #Obtenemos los datos del formulario y seteamos los atributos
            newPac.doc_identidad_pac = request.POST['dni']
            newPac.apellido_paterno = request.POST['apellido_p']
            newPac.apellido_materno = request.POST['apellido_m']
            newPac.nombre = request.POST['nombre']
            newPac.fecha_nacimiento = request.POST['fecha_nac']            
            newPac.lugar_nacimiento = request.POST['lugar_nac']
            newPac.telefono = request.POST['telefono']
            newPac.domicilio = request.POST['domicilio']
            newPac.genero = request.POST['genero']
            newPac.email = request.POST['email']
            newPac.grado_instruccion = request.POST['grado_in']
            newPac.tipo_seguro = request.POST['tipo_seg']
            newPac.religion = request.POST['religion']
            newPac.ocupacion = request.POST['ocupacion']
            newPac.estado_civil = request.POST['estado_civ']
            newPac.grupo_etnico = request.POST['grupo_et']
            newPac.acompaniante_nombre = request.POST['acomp_nombre']
            newPac.acompaniante_doc_identidad = request.POST['acomp_dni']
            if 'acomp_parent' in request.POST:
                newPac.acompaniante_parentezco = request.POST['acomp_parent']
            else:
                newPac.acompaniante_parentezco = ""                            
            if 'estado_reg' in request.POST:
                newPac.estado_registro = True
            else:
                newPac.estado_registro = False
            #Guardamos el objeto en la base de datos                       
            newPac.save(force_insert=True)
                #Crear un mensaje de exito
            context = {
                'success' : 'Paciente registrado correctamente'
            }
            #Mostramos un mensaje de Paciente registrado exitosamente
            return render(request, 'registrarPaciente.html', context)
        except Exception as e:
            #Crear un mensaje de error
            context = {
                'error' : 'Error al registrar paciente: ' + str(e)
            }
            #Mostramos un mensaje de error al registrar paciente
            return render(request, 'registrarPaciente.html', context)                        
    return render(request, 'registrarPaciente.html')

#Cargar el paciente en la pantalla de actualizar paciente
def cargarPaciente(request,dni):
    try:
        #Crear un objeto del modelo pacientes
        updPac = Paciente.objects.get(doc_identidad_pac=dni)
        updPac.fecha_nacimiento = str(updPac.fecha_nacimiento)
        context = {
            'paciente': updPac,
        }
        return render(request, 'actualizarPaciente.html', context)
    except Exception as e:
        #Crear mensaje de error
        context = {
            'error' : 'Error al cargar paciente:' + str(e),
        }
        return render(request, 'verPacientes.html', context)

def actualizarPacienteCod(request):
    if request and request.method == 'POST':
        try:
            #Crear un objeto del modelo pacientes
            updPac = Paciente()
            #Obtenemos los datos del formulario y seteamos los atributos
            updPac.doc_identidad_pac = request.POST['dni']
            updPac.apellido_paterno = request.POST['apellido_p']
            updPac.apellido_materno = request.POST['apellido_m']
            updPac.nombre = request.POST['nombre']
            updPac.fecha_nacimiento = request.POST['fecha_nac']            
            updPac.lugar_nacimiento = request.POST['lugar_nac']
            updPac.telefono = request.POST['telefono']
            updPac.domicilio = request.POST['domicilio']
            updPac.genero = request.POST['genero']
            updPac.email = request.POST['email']
            updPac.grado_instruccion = request.POST['grado_in']
            updPac.tipo_seguro = request.POST['tipo_seg']
            updPac.religion = request.POST['religion']
            updPac.ocupacion = request.POST['ocupacion']
            updPac.estado_civil = request.POST['estado_civ']
            updPac.grupo_etnico = request.POST['grupo_et']
            updPac.acompaniante_nombre = request.POST['acomp_nombre']
            updPac.acompaniante_doc_identidad = request.POST['acomp_dni']

            updPac.acompaniante_parentezco = request.POST['acomp_parent']

            if 'estado_reg' in request.POST:
                updPac.estado_registro = True
            else:
                updPac.estado_registro = False
            now = datetime.now()
            #nowStr = now.strftime("%Y-%m-%d %H:%M:%S")
            print(now)
            updPac.fecha_registro= now
            #Guardamos el objeto en la base de datos  
            updPac.save(force_update=True)
            #crear un objeto de todos los pacientes
            objPacientes = Paciente.objects.all()
            #Crear un mensaje de exito y mostrar todos los pacientes
            context = {
                'success' : (f"Paciente: {updPac.nombre} {updPac.apellido_paterno} registrado correctamente"),
                'pacientes' : objPacientes
            }
            return render(request, 'verPacientes.html', context)
        except Exception as e:
            #Crear un mensaje de error
            context = {
                'error' : 'Error al actualizar paciente: ' + str(e),
                'paciente': updPac
            }
            return render(request, 'actualizarPaciente.html', context)
    return render(request, 'actualizarPaciente.html')

def buscarDniPac(request):
    lstPaciente = []
    try:
        if request and request.method == 'POST':
            if 'dni' in request.POST and request.POST['dni'] != '':
                objPaciente = Paciente.objects.get(doc_identidad_pac=request.POST['dni'])
                lstPaciente.append(objPaciente)
                context = {
                    'pacientes' : lstPaciente
                }
                return render(request, 'verPacientes.html', context)
            else:
                context = {
                    'error' : 'Paciente buscado no existe'
                }
                return render(request, 'verPacientes.html', context)
    except Exception as e:
        context = {
            'error' : 'Error al buscar paciente: ' + str(e)
        }
        return render(request, 'verPacientes.html', context)
    return render(request, 'verPacientes.html')

def buscarApellidoPac(request):
    lstPaciente = []
    try:
        if request and request.method == 'POST':
            if 'apellido_p' in request.POST and request.POST['apellido_p'] != '':
                #objPaciente = Paciente.objects.filter(apellido_paterno=request.POST['apellido_p'])
                apePat = str(request.POST['apellido_p'])
                objPaciente = Paciente.objects.raw('SELECT * FROM nutriApp_paciente where apellido_paterno = %s', [apePat])
                #select * from tabla where nombre like '%" &  parametro & "%'
                for pac in objPaciente:
                    lstPaciente.append(pac)
                context = {
                    'pacientes' : lstPaciente
                }
                return render(request, 'verPacientes.html', context)
            else:
                context = {
                    'error' : 'Paciente buscado no existe'
                }
                return render(request, 'verPacientes.html', context)
    except Exception as e:
        context = {
            'error' : 'Error al buscar paciente: ' + str(e)
        }
        return render(request, 'verPacientes.html', context)
    return render(request, 'verPacientes.html')


#----------------------------VISTAS DEL ALIMENTO----------------------------
def verAlimentos(request):
    return render(request, 'verAlimentos.html')

def verTodoAlimentos(request):
    try:
        #crear un objeto del modelo alimento
        objAlimento = Alimento.objects.all()
        #Crear un context para enviar la lista de alimentos
        context = {
            'alimentos': objAlimento
        }
        return render(request, 'verAlimentos.html', context)
    except Exception as e:
        context = {
            'error': 'Error al obtener los alimentos: ' + str(e)
        }
        return render(request, 'verAlimentos.html', context)


def registrarAlimento(request):
    #Traer las categorias de alimentos
    lstCategorias = Categoria_alimento.objects.all()
    context = {
        'categoria_alimento': lstCategorias
    }
    if request.method == 'POST':
        try:
            #Crear un nuevo objeto del modelo Alimento
            newAli = Alimento()
            newAli.codigo_alimento = request.POST['codigo_alimento'] 
            #Obtener la categoria del alimento
            newAli.categoria_alimento = Categoria_alimento.objects.get(pk=request.POST['categoria_alimento'])
            #newAli.categoria_alimento = request.POST['categoria_alimento']
            newAli.nombre_alimento = request.POST['nombre_alimento']
            print("energia =>" +request.POST['energ'])
            newAli.energ = request.POST['energ']
            newAli.agua = request.POST['agua']
            newAli.prot_t = request.POST['prot']
            newAli.grasa_t = request.POST['grasa']
            newAli.carboh = request.POST['carboh']
            newAli.fib = request.POST['fibra']
            newAli.calc = request.POST['calc']
            newAli.fosf = request.POST['fosf']
            newAli.zinc = request.POST['zinc']
            newAli.hier = request.POST['hier']
            newAli.b_carot = request.POST['b_carot']
            newAli.vit_a = request.POST['vit_a']
            newAli.tiam = request.POST['tiam']
            newAli.ribo = request.POST['ribo']
            newAli.niac = request.POST['niac']
            newAli.vit_c = request.POST['vit_c']
            newAli.aci_fol = request.POST['aci_fol']
            newAli.sodio = request.POST['sodio']
            newAli.potas = request.POST['potas']
            #Guardar el contenido del objeto en la base de datos
            newAli.save(force_insert=True)
            #Crear un mensaje de exito
            context = {
                'success' : 'Alimento registrado correctamente',
                'categoria_alimento': lstCategorias
            }
            #Mostramos un mensaje de Alimento registrado exitosamente
            return render(request, 'registrarAlimento.html', context)
        except Exception as e:
            #Crear un mensaje de error
            context = {
                'error' : 'Error al registrar el alimento: ' + str(e),
                'categoria_alimento': lstCategorias
            }
            return render(request, 'registrarAlimento.html', context)
    return render(request, 'registrarAlimento.html', context)

#Cargar el alimento en la pantalla de actualizar alimento
def cargarAlimento(request, codigo_alimento):
    try:
        #Crear un objeto del modelo alimento con el cod enviado
        updAli = Alimento.objects.get(codigo_alimento=codigo_alimento)
        lstCategorias = Categoria_alimento.objects.all()
        idCategAliSelected = updAli.categoria_alimento.id
        print("idCategAliSelected =>" + str(idCategAliSelected))
        #Crear un context para enviar el objeto alimento
        context = {
            'alimento' : updAli,
            'categoria_alimento': lstCategorias,
            'idcategoria_alimento' : idCategAliSelected
        }    
        return render(request, 'actualizarAlimento.html', context)
    except Exception as e:
        context = {
            'error': 'Error al obtener el alimento: ' + str(e)
        }
        return render(request, 'verAlimentos.html', context)

    

def actualizarAlimentoCod(request):
    #Traer las categorias de alimentos
    lstCategorias = Categoria_alimento.objects.all()
    context = {
        'categoria_alimento': lstCategorias
    }
    if request and request.method == 'POST':
        try:
            #Crear un nuevo objeto del modelo Alimento
            updAli = Alimento()
            updAli.codigo_alimento = request.POST['codigo_alimento'] 
            #Actualizar el objeto del modelo alimento
            updAli.categoria_alimento = Categoria_alimento.objects.get(pk=request.POST['categoria_alimento'])                    
            updAli.nombre_alimento = request.POST['nombre_alimento']            
            updAli.energ = request.POST['energ']
            updAli.agua = request.POST['agua']
            updAli.prot_t = request.POST['prot']
            updAli.grasa_t = request.POST['grasa']
            updAli.carboh = request.POST['carboh']
            updAli.fib = request.POST['fibra']
            updAli.calc = request.POST['calc']
            updAli.fosf = request.POST['fosf']
            updAli.zinc = request.POST['zinc']
            updAli.hier = request.POST['hier']
            updAli.b_carot = request.POST['b_carot']
            updAli.vit_a = request.POST['vit_a']
            updAli.tiam = request.POST['tiam']
            updAli.ribo = request.POST['ribo']
            updAli.niac = request.POST['niac']
            updAli.vit_c = request.POST['vit_c']
            updAli.aci_fol = request.POST['aci_fol']
            updAli.sodio = request.POST['sodio']
            updAli.potas = request.POST['potas']
            #Guardar el contenido del objeto en la base de datos
            updAli.save(force_update=True)
            #Crear un objeto con todos los alimentos
            objAlimento = Alimento.objects.all()
            #Crear un mensaje de exito
            context = {
                'success' : (f"Alimento: {updAli.codigo_alimento} - {updAli.nombre_alimento} actualizado correctamente"),
                'alimentos': objAlimento                
            }
            #Mostramos un mensaje de Alimento registrado exitosamente
            return render(request, 'verAlimentos.html', context)            
        except Exception as e:
            #Crear un mensaje de error
            context = {
                'error' : 'Error al actulizar el alimento: ' + str(e),
                'ali': updAli,
                'categoria_alimento': lstCategorias
            }
            return render(request, 'actualizarAlimento.html', context)    
    return render(request, 'registrarAlimento.html', context)

def eliminarAlimento(request, codigo_alimento):
    
    try:
        delAli = Alimento.objects.get(codigo_alimento=codigo_alimento)       
        delAli.delete()       
    except Exception as e:
        objAlimento = Alimento.objects.all()
        #Crear un mensaje de error
        context = {
            'error' : 'Error al eliminar el alimento: ' + str(e),
            'alimentos': objAlimento,
        }   
        return render(request, 'verAlimentos.html', context)

    #Crear un objeto con todos los alimento
    objAlimento = Alimento.objects.all()
    #Crear un mensaje de exito
    context = { 
        'success' : (f"Alimento: {delAli.nombre_alimento} eliminado correctamente"),
        'alimentos': objAlimento,
    }
    return render(request, 'verAlimentos.html', context)

def buscarCodigoAlim(request):
    lstAlimento = []
    try:    
        if request and request.method == 'POST':
            if 'codigo_alimento' in request.POST and request.POST['codigo_alimento'] != '':
                objAlimento = Alimento.objects.get(codigo_alimento = request.POST['codigo_alimento'])            
                lstAlimento.append(objAlimento)
                context = {
                    'alimentos': lstAlimento
                }
                return render(request, 'verAlimentos.html', context)
            else:
                context = {
                    'error': 'Alimento buscado no registrado'
                }
                return render(request, 'verAlimentos.html', context)
    except Exception as e:
        context = {
            'error': 'Alimento buscado no registrado : ' + str(e)
        }
        return render(request, 'verAlimentos.html', context)
    return render(request, 'verAlimentos.html')

def buscarNombreAlim(request):
    lstAlimento = []
    try:    
        if request and request.method == 'POST':
            if 'nombre_alimento' in request.POST and request.POST['nombre_alimento'] != '':
                objAlimento = Alimento.objects.get(nombre_alimento = request.POST['nombre_alimento'])            
                lstAlimento.append(objAlimento)
                context = {
                    'alimentos': lstAlimento
                }
                return render(request, 'verAlimentos.html', context)
            else:
                context = {
                    'error': 'Alimento buscado no registrado'
                }
                return render(request, 'verAlimentos.html', context)
    except Exception as e:
        context = {
            'error': 'Alimento buscado no registrado : ' + str(e)
        }
        return render(request, 'verAlimentos.html', context)
    return render(request, 'verAlimentos.html')
    
#-----------VISTAS DEL DIAGNOSTICO-----------------
def registrarDiagnostico(request):
    lstDiagnosticos = []    
    if request.method == 'POST' and 'dni' in request.POST and request.POST['dni'] != '':
        try:
            pac = Paciente.objects.get(doc_identidad_pac=request.POST['dni'])
            if request.user.id is not None:
                    usuarioSistema = User.objects.get(pk=request.user.id)
                    trab = Trabajador.objects.get(usuario=usuarioSistema)
                    fecha = date.today().strftime("%d/%m/%Y")
                    pac.fecha_nacimiento = pac.fecha_nacimiento.strftime("%d/%m/%Y")                
                    
            context = {
                'paciente' : pac,
                'usuario' : usuarioSistema,
                'trabajador': trab,
                'fecha' : fecha,
            }
            return render(request, 'registrarDiagnostico.html', context)        
        except Exception as e:
            context = {
                'error': 'Paciente no registrado: ' + str(e)
            }
            return render(request, 'verDiagnosticos.html', context)
    elif request.method == 'POST' and 'dni2' in request.POST and request.POST['dni2'] != '':
        try:
        #Si el usuario esta logeado al sistema
            if request.user.id is not None:
                usuarioSistema = User.objects.get(pk=request.user.id)
                trab = Trabajador.objects.get(usuario=usuarioSistema)
                pac = Paciente.objects.get(doc_identidad_pac=request.POST['dni2'])            
                dx = Diagnostico()
                dx.trabajador = trab
                dx.paciente = pac
                dx.estado_nutri = request.POST['estado_nut']
                dx.req_ener = request.POST['req_ener']
                dx.req_carboh = request.POST['req_carboh']
                dx.req_prot = request.POST['req_prot']
                dx.req_grasa = request.POST['req_grasa']
                dx.tipo_patologia = request.POST['tipo_patologia']
                dx.tipo_dieta = request.POST['tipo_dieta']
                dx.r24_ener = request.POST['r24_ener']
                dx.r24_carboh = request.POST['r24_carboh']
                dx.r24_prot = request.POST['r24_prot']
                dx.r24_grasa = request.POST['r24_grasa']
                dx.r24_analisis = request.POST['r24_analisis']
                dx.fc_analisis = request.POST['fc_analisis']
                dx.recomendaciones = request.POST['recomendaciones']
                dx.estado_registro = True
                dx.file1 = ""
                print("hola")
                dx.save(force_insert=True)
                #Crear objeto con todos los diagnosticos y un mensaje de exito                
                try:                                        
                    objDiagnostico = Diagnostico.objects.filter(paciente=pac)  
                    for diag in objDiagnostico:
                        diag.fecha_registro = diag.fecha_registro.strftime("%d/%m/%Y")
                        lstDiagnosticos.append(diag)
                        print(diag.trabajador)
                    print("Cant dx => " + str(len(lstDiagnosticos)))
                    if len(lstDiagnosticos) > 0:
                        context = {
                            'success': (f"Diagnostico {dx.id} registrado correctamente"),   
                            'paciente' : pac,
                            'diagnosticos': lstDiagnosticos
                        }
                        return render(request, 'verDiagnosticos.html', context)
                    else:
                        context = {
                            'paciente' : pac,
                            'error': (f"Paciente {pac.apellido_paterno} {pac.apellido_materno} no tiene diagnosticos registrados"),
                        }                    
                        return render(request, 'verDiagnosticos.html', context)
                except Exception as e:
                    context = {
                        'error': (f"Paciente DNI {request.POST['dni']} no registrado"),
                    }
                    return render(request, 'verDiagnosticos.html', context)                                     
        except Exception as e:
                #Crear mensaje de error
                context = {
                    'error' : 'Error al registrar el diagnostico: ' + str(e)
                }
                return render(request, 'registrarDiagnostico.html', context)
    else:
        context = {
            'success' : 'Para comenzar, busque el paciente'
        }
        return render(request, 'verDiagnosticos.html', context)
        

   

def actualizarDiagnostico(request):
    return render(request, 'actualizarDiagnostico.html')

def verDiagnosticos(request):
    lstDiagnosticos = []    
    if request.user.id is not None:
        if request and request.method == 'POST':
            if 'dni' in request.POST and request.POST['dni'] != '':
                try:
                    objPaciente = Paciente.objects.get(doc_identidad_pac=request.POST['dni'])                    
                    objDiagnostico = Diagnostico.objects.filter(paciente=objPaciente)  
                    for diag in objDiagnostico:
                        diag.fecha_registro = diag.fecha_registro.strftime("%d/%m/%Y")
                        lstDiagnosticos.append(diag)
                        print(diag.trabajador)
                    print("Cant dx => " + str(len(lstDiagnosticos)))
                    if len(lstDiagnosticos) > 0:
                        context = {
                            'paciente' : objPaciente,
                            'diagnosticos': lstDiagnosticos
                        }
                        return render(request, 'verDiagnosticos.html', context)
                    else:
                        context = {
                            'paciente' : objPaciente,
                            'error': (f"Paciente {objPaciente.apellido_paterno} {objPaciente.apellido_materno} no tiene diagnosticos registrados"),
                        }                    
                        return render(request, 'verDiagnosticos.html', context)
                except Exception as e:
                    context = {
                        'error': (f"Paciente DNI {request.POST['dni']} no registrado"),
                    }
                    return render(request, 'verDiagnosticos.html', context)
            else:
                context = {
                    'error': 'Campo de busqueda de paciente vacio!'
                }
                return render(request, 'verDiagnosticos.html', context)

        else:
            context = {
                'success' : "Para comenzar, busque el paciente."
            }
            return render(request, 'verDiagnosticos.html', context)
    else:
        context = {
            'error': 'Usuario no logeado'
        }
        return render(request, 'loginUsuario.html', context)
        

#---------------------VISTAS DE LA CALCULADORA---------------------

def calcNutri(request):
    #lstAlimentos = []
    #if request and request.method=="POST":

    return render(request, 'calcNutri.html')