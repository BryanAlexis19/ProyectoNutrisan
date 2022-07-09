from email.policy import default
from django.db import models
from django.db.models.deletion import RESTRICT
from django.db.models.fields import CharField
from django.contrib.auth.models import User
from cloudinary.models import CloudinaryField

# Create your models here.

class Paciente(models.Model):
    GENEROS= (
        ('M', 'Masculino'),
        ('F', 'Femenino'),
    )
    GRADO_INSTRUCC= (
        ('Sin Grado', 'Sin Grado'),
        ('Primaria', 'Primaria'),
        ('Secundaria', 'Secundaria'),
        ('Tecnica', 'Tecnica'),
        ('Universitaria', 'Universitaria'),
        ('Master', 'Master'),
        ('Doctorado', 'Doctorado'),
    )
    TIPO_SEG = (
        ('Sin seguro', 'Seguro'),
        ('Essalud', 'Essalud'),
        ('Ministerio de Salud', "Ministerio de Salud"),
        ('EPS', 'EPS'),
        ('Privado', 'Privado'),
        ('Otro', 'Otro'),
    )
    EST_CIVIL = (
        ('Soltero', 'Soltero'),
        ('Casado', 'Casado'),
        ('Divorciado', 'Divorciado'),
        ('Viudo', 'Viudo'),
    )
    PARENT = (
        ('Padre', 'Padre'),
        ('Madre', 'Madre'),
        ('Hijo(a)', 'Hijo(a)'),
        ('Esposo(a)', 'Esposo(a)'),
        ('Abuelo(a)', 'Abuelo(a)'),
        ('Otro', 'Otro'),
    )
    doc_identidad_pac = models.CharField(max_length=8,primary_key=True, null=False, blank=False)
    apellido_paterno = models.CharField(max_length=50, null=False, blank=False)
    apellido_materno = models.CharField(max_length=50, null=False, blank=False)
    nombre = models.CharField(max_length=50, null=False, blank=False)
    fecha_nacimiento = models.DateField(null=False, blank=False)
    lugar_nacimiento = models.CharField(max_length=150, blank=True, null=True)
    # edad = models.IntegerField() #Solo en vista
    telefono = models.CharField(max_length=9, blank=True, null=True)
    domicilio = models.CharField(max_length=200, null=False, blank=False)
    genero = models.CharField(max_length=1, choices=GENEROS, null=False, blank=False)
    email = models.EmailField(null=True, blank=True)
    grado_instruccion = models.CharField(max_length=50, choices=GRADO_INSTRUCC, null=False, blank=False)
    tipo_seguro = models.CharField(max_length=50, choices=TIPO_SEG, null=False, blank=False)
    religion = models.CharField(max_length=50, blank=True, null=True)
    ocupacion = models.CharField(max_length=100, blank=True, null=True)
    estado_civil = models.CharField(max_length=50, choices=EST_CIVIL, null=True, blank=True, default='Soltero')
    grupo_etnico = models.CharField(max_length=50, null=True, blank=True)
    acompaniante_nombre = models.CharField(max_length=200, blank=True, null=True)
    acompaniante_doc_identidad = models.CharField(max_length=8, blank=True, null=True)
    acompaniante_parentezco = models.CharField(max_length=50, choices=PARENT, blank=True, null=True)
    fecha_registro = models.DateTimeField(auto_now_add=True)
    estado_registro = models.BooleanField(default=True)

    def __str__(self):
        return self.apellido_materno + " " + self.apellido_paterno + " " + self.nombre

class Trabajador(models.Model):
    GENEROS= (
        ('M', 'Masculino'),
        ('F', 'Femenino'),
    )
    ESPEC = (
        ('Nutricionista', 'Nutricionista'),
    )
    usuario = models.OneToOneField(User, on_delete=RESTRICT)
    doc_identidad_trab = models.CharField(max_length=8,primary_key=True, null=False, blank=False)
    #apellido_paterno = models.CharField(max_lenght=50)
    #apellido_materno = models.CharField(max_length=50)
    #nombre = models.CharField(max_length=50)
    #edad = models.IntegerField()
    genero = CharField(max_length=1, choices=GENEROS, null=False, blank=False)
    especialidad = models.CharField(max_length=50, choices=ESPEC, null=False, blank=False, default='Nutricionista')
    domicilio = models.CharField(max_length=200, null=False, blank=False)
    telefono = models.CharField(max_length=9)
    #email = models.EmailField()
    #fecha_registro = models.DateTimeField(auto_now_add=True)
    #estado_registro = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.usuario.last_name} {self.usuario.first_name}"

    class Meta:
        verbose_name_plural = 'Trabajadores'
    
class Diagnostico(models.Model):
    paciente = models.ForeignKey(Paciente, on_delete=RESTRICT)
    trabajador = models.ForeignKey(Trabajador, on_delete=RESTRICT)
    estado_nutri = models.TextField(blank=True, null=True)
    req_ener = models.DecimalField(max_digits=10, decimal_places=2,blank=True, null=True)
    req_carboh = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    req_prot = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    req_grasa = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    tipo_patologia = models.CharField(max_length=200, blank=True, null=True)
    tipo_dieta = models.CharField(max_length=200, blank=True, null=True)
    r24_ener = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    r24_carboh = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    r24_prot = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    r24_grasa = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    r24_analisis = models.TextField(blank=True, null=True)
    fc_analisis = models.TextField(blank=True, null=True)
    recomendaciones = models.TextField(blank=True, null=True)
    fecha_registro = models.DateTimeField(auto_now_add=True)
    estado_registro = models.BooleanField(default=True)
    file1 = CloudinaryField('Archivo 1', default='', blank=True, null=True)

    def __str__(self):
        return "DX0"+str(self.id) + "-"+ self.paciente.apellido_paterno + " " + self.paciente.apellido_materno + " " + self.paciente.nombre + "-" + self.fecha_registro.strftime('%d/%m/%Y')

class Categoria_alimento(models.Model):
    nombre_categoria = models.CharField(max_length=50, null=False, blank=False)
    fecha_registro = models.DateTimeField(auto_now_add=True)
    estado_registro = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre_categoria

class Alimento(models.Model):
    codigo_alimento = models.CharField(max_length=6, primary_key=True, null=False, blank=False)
    categoria_alimento = models.ForeignKey(Categoria_alimento, on_delete=RESTRICT)
    nombre_alimento = models.CharField(max_length=50, null=False, blank=False)
    energ = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    agua = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    prot_t = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    #prot_a = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    #prot_v = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    grasa_t = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    #grasa_a = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    #grasa_v = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    carboh = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    fib = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    calc = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    fosf = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    zinc = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    hier = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    b_carot = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    vit_a = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    #reti = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    tiam = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    ribo = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    niac = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    vit_c = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    aci_fol = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    sodio = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)
    potas = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0)    
    
    def __str__(self):
        return self.nombre_alimento

    
