from django.contrib import admin
from nutriApp.models import *
from django.db import models

# Register your models here.

admin.site.register(Paciente)
admin.site.register(Trabajador)
admin.site.register(Diagnostico)
admin.site.register(Categoria_alimento)
class AlimentoAdmin(admin.ModelAdmin):
    list_display= ('nombre_alimento','categoria_alimento')
    search_fields= ['nombre_alimento']

admin.site.register(Alimento, AlimentoAdmin)
