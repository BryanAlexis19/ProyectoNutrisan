from django.urls import path
from . import views

# URL patterns for the nutriApp application here

app_name = 'nutriApp'
#nutrisan color hex> #f78b1f, rgb>(247,139,31)

urlpatterns = [
    # MIS VIEWS PARA NUTRISAN
    #-------------------------------------------PAGINA PRINCIPAL-----------------------------------------------------
    path('index', views.index, name='index'),    
    #-------------------------------------------LOGIN USUARIO-----------------------------------------------------
    path('', views.loginUsuario, name='loginUsuario'),
    path('logoutUsuario', views.logoutUsuario, name='logoutUsuario'),
    #----------------------------------------------------PACIENTE----------------------------------------------------
    path('verPacientes', views.verPacientes, name="verPacientes"),
    path('verTodoPacientes', views.verTodoPacientes, name="verTodoPacientes"),
    path('actualizarPaciente', views.actualizarPaciente, name="actualizarPacinete"),
    path('cargarPaciente/<str:dni>', views.cargarPaciente, name="cargarPaciente"),
    path('actualizarPacienteCod', views.actualizarPacienteCod, name="actualizarPacienteCod"),
    path('registrarPaciente', views.registrarPaciente, name="registrarPaciente"),    
    path('buscarDniPac', views.buscarDniPac, name="buscarDniPac"),
    path('buscarApellidoPac', views.buscarApellidoPac, name="buscarApellidoPac"),
        
    #----------------------------------------------------ALIMENTO---------------------------------------------------
    path('verAlimentos', views.verAlimentos, name="verAlimentos"),
    path('verTodoAlimentos', views.verTodoAlimentos, name="verTodoAlimentos"),
    path('registrarAlimento', views.registrarAlimento, name="registrarAlimento"),    
    path('cargarAlimento/<str:codigo_alimento>', views.cargarAlimento, name="cargarAlimento"),    
    path('actualizarAlimentoCod', views.actualizarAlimentoCod, name="actualizarAlimentoCod"),
    path('eliminarAlimento/<str:codigo_alimento>', views.eliminarAlimento, name="eliminarAlimento"),                
    path('buscarCodigoAlim', views.buscarCodigoAlim, name="buscarCodigoAlim"),
    path('buscarNombreAlim', views.buscarNombreAlim, name="buscarNombreAlim"),

    #----------------------------------------------------DIAGNOSTICO-------------------------------------------------    
    path('registrarDiagnostico', views.registrarDiagnostico, name="registrarDiagnostico"),
    path('actualizarDiagnostico', views.actualizarDiagnostico, name="actualizarDiagnostico"),
    path('verDiagnosticos', views.verDiagnosticos, name="verDiagnosticos"),

    #----------------------------------------------------CALCULADORA NUTRICIONAL-------------------------------------
    path('calcNutri', views.calcNutri, name="calcNutri"),
]