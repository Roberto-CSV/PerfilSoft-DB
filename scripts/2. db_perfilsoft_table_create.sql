CREATE TABLE public.pregunta (
    id_pregunta serial NOT NULL,
    fk_habilidad integer NOT NULL,
    fk_seccion_cuestionario integer NOT NULL,
    enunciado varchar(255) NOT NULL,
    activo boolean NOT NULL,
    puntos integer NOT NULL,
    PRIMARY KEY (id_pregunta)
);

CREATE INDEX ON public.pregunta
    (fk_habilidad);
CREATE INDEX ON public.pregunta
    (fk_seccion_cuestionario);


CREATE TABLE public.opcion_respuesta (
    id_opcion_respuesta serial NOT NULL,
    fk_pregunta integer NOT NULL,
    opcion_respuesta varchar(255) NOT NULL,
    porcentaje_exactitud integer NOT NULL,
    PRIMARY KEY (id_opcion_respuesta)
);

CREATE INDEX ON public.opcion_respuesta
    (fk_pregunta);


CREATE TABLE public.cuestionario (
    id_cuestionario serial NOT NULL,
    fk_semestre integer NOT NULL,
    estandar_puntuacion integer NOT NULL,
    PRIMARY KEY (id_cuestionario)
);

CREATE INDEX ON public.cuestionario
    (fk_semestre);


CREATE TABLE public.seccion_cuestionario (
    id_seccion_cuestionario serial NOT NULL,
    fk_habilidad integer NOT NULL,
    seccion varchar(50) NOT NULL,
    estandar_puntuacion integer NOT NULL,
    PRIMARY KEY (id_seccion_cuestionario)
);

CREATE INDEX ON public.seccion_cuestionario
    (fk_habilidad);


CREATE TABLE public.diagnostico (
    id_diagnostico serial NOT NULL,
    fk_usuario integer NOT NULL,
    fk_respuesta_cuestionario integer NOT NULL,
    PRIMARY KEY (id_diagnostico)
);

CREATE INDEX ON public.diagnostico
    (fk_usuario);
CREATE INDEX ON public.diagnostico
    (fk_respuesta_cuestionario);


CREATE TABLE public.recomendacion (
    id_recomendacion serial NOT NULL,
    fk_opcion_respuesta integer NOT NULL,
    recomendacion varchar(255) NOT NULL,
    PRIMARY KEY (id_recomendacion)
);

CREATE INDEX ON public.recomendacion
    (fk_opcion_respuesta);


CREATE TABLE public.usuario (
    id_usuario serial NOT NULL,
    fk_semestre integer NOT NULL,
    fk_rol_usuario integer NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    correo varchar(50) NOT NULL,
    clave varchar(25) NOT NULL,
    activo boolean NOT NULL,
    PRIMARY KEY (id_usuario)
);

CREATE INDEX ON public.usuario
    (fk_semestre);
CREATE INDEX ON public.usuario
    (fk_rol_usuario);


CREATE TABLE public.semestre (
    id_semestre serial NOT NULL,
    semestre integer NOT NULL,
    PRIMARY KEY (id_semestre)
);


CREATE TABLE public.rol_ingeniero (
    id_rol_ingeniero serial NOT NULL,
    nombre varchar(50) NOT NULL,
    descripcion varchar(255) NOT NULL,
    PRIMARY KEY (id_rol_ingeniero)
);


CREATE TABLE public.habilidad (
    id_habilidad serial NOT NULL,
    fk_tipo_habilidad integer NOT NULL,
    habilidad varchar(50) NOT NULL,
    PRIMARY KEY (id_habilidad)
);

CREATE INDEX ON public.habilidad
    (fk_tipo_habilidad);


CREATE TABLE public.tipo_habilidad (
    id_tipo_habilidad serial NOT NULL,
    tipo varchar(50) NOT NULL,
    PRIMARY KEY (id_tipo_habilidad)
);


CREATE TABLE public.diagnostico_rol_ingeniero (
    id_diagnostico_rol_ingeniero serial NOT NULL,
    fk_diagnostico integer NOT NULL,
    fk_rol_ingeniero integer NOT NULL,
    porcentaje_similitud integer NOT NULL,
    PRIMARY KEY (id_diagnostico_rol_ingeniero)
);

CREATE INDEX ON public.diagnostico_rol_ingeniero
    (fk_diagnostico);
CREATE INDEX ON public.diagnostico_rol_ingeniero
    (fk_rol_ingeniero);


CREATE TABLE public.rol_usuario (
    id_rol_usuario serial NOT NULL,
    rol varchar(50) NOT NULL,
    activo boolean NOT NULL,
    PRIMARY KEY (id_rol_usuario)
);


CREATE TABLE public.respuesta_cuestionario (
    id_respuesta_cuestionario serial NOT NULL,
    fk_cuestionario integer NOT NULL,
	fecha_desarrollo timestamp with time zone NOT NULL,
    PRIMARY KEY (id_respuesta_cuestionario)
);

CREATE INDEX ON public.respuesta_cuestionario
    (fk_cuestionario);


CREATE TABLE public.respuesta_pregunta (
    id_respuesta_pregunta serial NOT NULL,
    fk_respuesta_cuestionario integer NOT NULL,
    fk_opcion_respuesta integer NOT NULL,
    PRIMARY KEY (id_respuesta_pregunta)
);

CREATE INDEX ON public.respuesta_pregunta
    (fk_respuesta_cuestionario);
CREATE INDEX ON public.respuesta_pregunta
    (fk_opcion_respuesta);


CREATE TABLE public.diagnostico_recomendacion (
    id_diagnostico_recomendacion serial NOT NULL,
    fk_diagnostico integer NOT NULL,
	fk_recomendacion integer NOT NULL,
    PRIMARY KEY (id_diagnostico_recomendacion)
);
	
CREATE TABLE public.rol_ingeniero_habilidad (
    id_rol_ingeniero_habilidad serial NOT NULL,
    fk_rol_ingeniero integer NOT NULL,
	fk_habilidad integer NOT NULL,
    PRIMARY KEY (id_rol_ingeniero_habilidad)
);

CREATE TABLE public.cuestionario_seccion_cuestionario (
    id_cuestionario_seccion_cuestionario serial NOT NULL,
    fk_cuestionario integer NOT NULL,
	fk_seccion_cuestionario integer NOT NULL,
    PRIMARY KEY (id_cuestionario_seccion_cuestionario)
);


-- FOREIGN KEYS

ALTER TABLE public.cuestionario_seccion_cuestionario
ADD CONSTRAINT fk_cuestionario
FOREIGN KEY (fk_cuestionario)
REFERENCES public.cuestionario(id_cuestionario);

ALTER TABLE public.cuestionario_seccion_cuestionario
ADD CONSTRAINT fk_seccion_cuestionario
FOREIGN KEY (fk_seccion_cuestionario)
REFERENCES public.seccion_cuestionario(id_seccion_cuestionario);

ALTER TABLE public.diagnostico_recomendacion
ADD CONSTRAINT fk_diagnostico
FOREIGN KEY (fk_diagnostico)
REFERENCES public.diagnostico(id_diagnostico);

ALTER TABLE public.diagnostico_recomendacion
ADD CONSTRAINT fk_recomendacion
FOREIGN KEY (fk_recomendacion)
REFERENCES public.recomendacion(id_recomendacion);

ALTER TABLE public.rol_ingeniero_habilidad
ADD CONSTRAINT fk_rol_ingeniero
FOREIGN KEY (fk_rol_ingeniero)
REFERENCES public.rol_ingeniero(id_rol_ingeniero);

ALTER TABLE public.rol_ingeniero_habilidad
ADD CONSTRAINT fk_habilidad
FOREIGN KEY (fk_habilidad)
REFERENCES public.habilidad(id_habilidad);

ALTER TABLE public.usuario
ADD CONSTRAINT fk_semestre
FOREIGN KEY (fk_semestre)
REFERENCES public.semestre(id_semestre);

ALTER TABLE public.usuario
ADD CONSTRAINT fk_rol_usuario
FOREIGN KEY (fk_rol_usuario)
REFERENCES public.rol_usuario(id_rol_usuario);

ALTER TABLE public.diagnostico
ADD CONSTRAINT fk_usuario
FOREIGN KEY (fk_usuario)
REFERENCES public.usuario(id_usuario);

ALTER TABLE public.diagnostico
ADD CONSTRAINT fk_respuesta_cuestionario
FOREIGN KEY (fk_respuesta_cuestionario)
REFERENCES public.respuesta_cuestionario(id_respuesta_cuestionario);

ALTER TABLE public.respuesta_cuestionario
ADD CONSTRAINT fk_cuestionario
FOREIGN KEY (fk_cuestionario)
REFERENCES public.cuestionario(id_cuestionario);

ALTER TABLE public.respuesta_pregunta
ADD CONSTRAINT fk_respuesta_cuestionario
FOREIGN KEY (fk_respuesta_cuestionario)
REFERENCES public.respuesta_cuestionario(id_respuesta_cuestionario);

ALTER TABLE public.respuesta_pregunta
ADD CONSTRAINT fk_opcion_respuesta
FOREIGN KEY (fk_opcion_respuesta)
REFERENCES public.opcion_respuesta(id_opcion_respuesta);

ALTER TABLE public.opcion_respuesta
ADD CONSTRAINT fk_pregunta
FOREIGN KEY (fk_pregunta)
REFERENCES public.pregunta(id_pregunta);

ALTER TABLE public.pregunta
ADD CONSTRAINT fk_habilidad
FOREIGN KEY (fk_habilidad)
REFERENCES public.habilidad(id_habilidad);

ALTER TABLE public.pregunta
ADD CONSTRAINT fk_seccion_cuestionario
FOREIGN KEY (fk_seccion_cuestionario)
REFERENCES public.seccion_cuestionario(id_seccion_cuestionario);

ALTER TABLE public.habilidad
ADD CONSTRAINT fk_tipo_habilidad
FOREIGN KEY (fk_tipo_habilidad)
REFERENCES public.tipo_habilidad(id_tipo_habilidad);

ALTER TABLE public.diagnostico_rol_ingeniero
ADD CONSTRAINT fk_diagnostico
FOREIGN KEY (fk_diagnostico)
REFERENCES public.diagnostico(id_diagnostico);

ALTER TABLE public.diagnostico_rol_ingeniero
ADD CONSTRAINT fk_rol_ingeniero
FOREIGN KEY (fk_rol_ingeniero)
REFERENCES public.rol_ingeniero(id_rol_ingeniero);

ALTER TABLE public.recomendacion
ADD CONSTRAINT fk_opcion_respuesta
FOREIGN KEY (fk_opcion_respuesta)
REFERENCES public.opcion_respuesta(id_opcion_respuesta);

ALTER TABLE public.seccion_cuestionario
ADD CONSTRAINT fk_habilidad
FOREIGN KEY (fk_habilidad)
REFERENCES public.habilidad(id_habilidad);

ALTER TABLE public.cuestionario
ADD CONSTRAINT fk_semestre
FOREIGN KEY (fk_semestre)
REFERENCES public.semestre(id_semestre);

