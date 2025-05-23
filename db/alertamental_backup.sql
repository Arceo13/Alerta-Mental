PGDMP  '    5                }            alertamental_db    17.4    17.4 X    o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            r           1262    24995    alertamental_db    DATABASE     u   CREATE DATABASE alertamental_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE alertamental_db;
                     postgres    false            �            1259    25198    alerta_emocional    TABLE       CREATE TABLE public.alerta_emocional (
    id_alerta integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_alerta date DEFAULT CURRENT_DATE,
    tipo_alerta character varying(100),
    estado character varying(50) DEFAULT 'pendiente'::character varying
);
 $   DROP TABLE public.alerta_emocional;
       public         heap r       postgres    false            �            1259    25197    alerta_emocional_id_alerta_seq    SEQUENCE     �   CREATE SEQUENCE public.alerta_emocional_id_alerta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.alerta_emocional_id_alerta_seq;
       public               postgres    false    229            s           0    0    alerta_emocional_id_alerta_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.alerta_emocional_id_alerta_seq OWNED BY public.alerta_emocional.id_alerta;
          public               postgres    false    228            �            1259    25138    asignacion_usuario_terapeuta    TABLE     �   CREATE TABLE public.asignacion_usuario_terapeuta (
    id_usuario integer NOT NULL,
    id_terapeuta integer NOT NULL,
    fecha_asignacion date DEFAULT CURRENT_DATE
);
 0   DROP TABLE public.asignacion_usuario_terapeuta;
       public         heap r       postgres    false            �            1259    25231    cita_confirmada    TABLE       CREATE TABLE public.cita_confirmada (
    id_cita integer NOT NULL,
    id_solicitud integer NOT NULL,
    fecha_cita date NOT NULL,
    hora_cita time without time zone NOT NULL,
    lugar character varying(255),
    precio_acordado numeric(10,2),
    observaciones text
);
 #   DROP TABLE public.cita_confirmada;
       public         heap r       postgres    false            �            1259    25230    cita_confirmada_id_cita_seq    SEQUENCE     �   CREATE SEQUENCE public.cita_confirmada_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.cita_confirmada_id_cita_seq;
       public               postgres    false    233            t           0    0    cita_confirmada_id_cita_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.cita_confirmada_id_cita_seq OWNED BY public.cita_confirmada.id_cita;
          public               postgres    false    232            �            1259    25168    diagnostico    TABLE       CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    id_evaluacion integer NOT NULL,
    nivel_gravedad integer,
    descripcion text,
    CONSTRAINT diagnostico_nivel_gravedad_check CHECK (((nivel_gravedad >= 1) AND (nivel_gravedad <= 10)))
);
    DROP TABLE public.diagnostico;
       public         heap r       postgres    false            �            1259    25167    diagnostico_id_diagnostico_seq    SEQUENCE     �   CREATE SEQUENCE public.diagnostico_id_diagnostico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.diagnostico_id_diagnostico_seq;
       public               postgres    false    225            u           0    0    diagnostico_id_diagnostico_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.diagnostico_id_diagnostico_seq OWNED BY public.diagnostico.id_diagnostico;
          public               postgres    false    224            �            1259    25258    diagnostico_recomendacion    TABLE     ~   CREATE TABLE public.diagnostico_recomendacion (
    id_diagnostico integer NOT NULL,
    id_recomendacion integer NOT NULL
);
 -   DROP TABLE public.diagnostico_recomendacion;
       public         heap r       postgres    false            �            1259    25155 
   evaluacion    TABLE     �   CREATE TABLE public.evaluacion (
    id_evaluacion integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha date DEFAULT CURRENT_DATE,
    resultado_general character varying(50)
);
    DROP TABLE public.evaluacion;
       public         heap r       postgres    false            �            1259    25154    evaluacion_id_evaluacion_seq    SEQUENCE     �   CREATE SEQUENCE public.evaluacion_id_evaluacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.evaluacion_id_evaluacion_seq;
       public               postgres    false    223            v           0    0    evaluacion_id_evaluacion_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.evaluacion_id_evaluacion_seq OWNED BY public.evaluacion.id_evaluacion;
          public               postgres    false    222            �            1259    25247    recomendacion    TABLE     U  CREATE TABLE public.recomendacion (
    id_recomendacion integer NOT NULL,
    titulo character varying(100),
    descripcion text,
    nivel_minimo integer,
    nivel_maximo integer,
    CONSTRAINT recomendacion_nivel_maximo_check CHECK ((nivel_maximo <= 10)),
    CONSTRAINT recomendacion_nivel_minimo_check CHECK ((nivel_minimo >= 1))
);
 !   DROP TABLE public.recomendacion;
       public         heap r       postgres    false            �            1259    25246 "   recomendacion_id_recomendacion_seq    SEQUENCE     �   CREATE SEQUENCE public.recomendacion_id_recomendacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.recomendacion_id_recomendacion_seq;
       public               postgres    false    235            w           0    0 "   recomendacion_id_recomendacion_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.recomendacion_id_recomendacion_seq OWNED BY public.recomendacion.id_recomendacion;
          public               postgres    false    234            �            1259    25185    respuesta_cuestionario    TABLE     :  CREATE TABLE public.respuesta_cuestionario (
    id_respuesta integer NOT NULL,
    id_evaluacion integer NOT NULL,
    numero_pregunta integer NOT NULL,
    respuesta_usuario integer,
    CONSTRAINT respuesta_cuestionario_respuesta_usuario_check CHECK (((respuesta_usuario >= 0) AND (respuesta_usuario <= 2)))
);
 *   DROP TABLE public.respuesta_cuestionario;
       public         heap r       postgres    false            �            1259    25184 '   respuesta_cuestionario_id_respuesta_seq    SEQUENCE     �   CREATE SEQUENCE public.respuesta_cuestionario_id_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.respuesta_cuestionario_id_respuesta_seq;
       public               postgres    false    227            x           0    0 '   respuesta_cuestionario_id_respuesta_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.respuesta_cuestionario_id_respuesta_seq OWNED BY public.respuesta_cuestionario.id_respuesta;
          public               postgres    false    226            �            1259    25212    solicitud_cita    TABLE     "  CREATE TABLE public.solicitud_cita (
    id_solicitud integer NOT NULL,
    id_usuario integer NOT NULL,
    id_terapeuta integer NOT NULL,
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(20) DEFAULT 'pendiente'::character varying
);
 "   DROP TABLE public.solicitud_cita;
       public         heap r       postgres    false            �            1259    25211    solicitud_cita_id_solicitud_seq    SEQUENCE     �   CREATE SEQUENCE public.solicitud_cita_id_solicitud_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.solicitud_cita_id_solicitud_seq;
       public               postgres    false    231            y           0    0    solicitud_cita_id_solicitud_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.solicitud_cita_id_solicitud_seq OWNED BY public.solicitud_cita.id_solicitud;
          public               postgres    false    230            �            1259    25130 	   terapeuta    TABLE     �   CREATE TABLE public.terapeuta (
    id_terapeuta integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo_electronico character varying(100) NOT NULL,
    especialidad character varying(100)
);
    DROP TABLE public.terapeuta;
       public         heap r       postgres    false            �            1259    25129    terapeuta_id_terapeuta_seq    SEQUENCE     �   CREATE SEQUENCE public.terapeuta_id_terapeuta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.terapeuta_id_terapeuta_seq;
       public               postgres    false    220            z           0    0    terapeuta_id_terapeuta_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.terapeuta_id_terapeuta_seq OWNED BY public.terapeuta.id_terapeuta;
          public               postgres    false    219            �            1259    25114    usuario    TABLE        CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo_electronico character varying(100) NOT NULL,
    "contraseña" character varying(255) NOT NULL,
    edad integer,
    carrera character varying(100),
    semestre integer,
    rol_usuario character varying(20) DEFAULT 'estudiante'::character varying,
    fecha_registro date DEFAULT CURRENT_DATE,
    CONSTRAINT usuario_edad_check CHECK (((edad >= 10) AND (edad <= 120))),
    CONSTRAINT usuario_rol_usuario_check CHECK (((rol_usuario)::text = ANY ((ARRAY['estudiante'::character varying, 'terapeuta'::character varying, 'admin'::character varying])::text[]))),
    CONSTRAINT usuario_semestre_check CHECK (((semestre >= 1) AND (semestre <= 12)))
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    25113    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public               postgres    false    218            {           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public               postgres    false    217            �           2604    25201    alerta_emocional id_alerta    DEFAULT     �   ALTER TABLE ONLY public.alerta_emocional ALTER COLUMN id_alerta SET DEFAULT nextval('public.alerta_emocional_id_alerta_seq'::regclass);
 I   ALTER TABLE public.alerta_emocional ALTER COLUMN id_alerta DROP DEFAULT;
       public               postgres    false    229    228    229            �           2604    25234    cita_confirmada id_cita    DEFAULT     �   ALTER TABLE ONLY public.cita_confirmada ALTER COLUMN id_cita SET DEFAULT nextval('public.cita_confirmada_id_cita_seq'::regclass);
 F   ALTER TABLE public.cita_confirmada ALTER COLUMN id_cita DROP DEFAULT;
       public               postgres    false    233    232    233            �           2604    25171    diagnostico id_diagnostico    DEFAULT     �   ALTER TABLE ONLY public.diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('public.diagnostico_id_diagnostico_seq'::regclass);
 I   ALTER TABLE public.diagnostico ALTER COLUMN id_diagnostico DROP DEFAULT;
       public               postgres    false    224    225    225            �           2604    25158    evaluacion id_evaluacion    DEFAULT     �   ALTER TABLE ONLY public.evaluacion ALTER COLUMN id_evaluacion SET DEFAULT nextval('public.evaluacion_id_evaluacion_seq'::regclass);
 G   ALTER TABLE public.evaluacion ALTER COLUMN id_evaluacion DROP DEFAULT;
       public               postgres    false    222    223    223            �           2604    25250    recomendacion id_recomendacion    DEFAULT     �   ALTER TABLE ONLY public.recomendacion ALTER COLUMN id_recomendacion SET DEFAULT nextval('public.recomendacion_id_recomendacion_seq'::regclass);
 M   ALTER TABLE public.recomendacion ALTER COLUMN id_recomendacion DROP DEFAULT;
       public               postgres    false    234    235    235            �           2604    25188 #   respuesta_cuestionario id_respuesta    DEFAULT     �   ALTER TABLE ONLY public.respuesta_cuestionario ALTER COLUMN id_respuesta SET DEFAULT nextval('public.respuesta_cuestionario_id_respuesta_seq'::regclass);
 R   ALTER TABLE public.respuesta_cuestionario ALTER COLUMN id_respuesta DROP DEFAULT;
       public               postgres    false    226    227    227            �           2604    25215    solicitud_cita id_solicitud    DEFAULT     �   ALTER TABLE ONLY public.solicitud_cita ALTER COLUMN id_solicitud SET DEFAULT nextval('public.solicitud_cita_id_solicitud_seq'::regclass);
 J   ALTER TABLE public.solicitud_cita ALTER COLUMN id_solicitud DROP DEFAULT;
       public               postgres    false    230    231    231            �           2604    25133    terapeuta id_terapeuta    DEFAULT     �   ALTER TABLE ONLY public.terapeuta ALTER COLUMN id_terapeuta SET DEFAULT nextval('public.terapeuta_id_terapeuta_seq'::regclass);
 E   ALTER TABLE public.terapeuta ALTER COLUMN id_terapeuta DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    25117    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public               postgres    false    218    217    218            e          0    25198    alerta_emocional 
   TABLE DATA           d   COPY public.alerta_emocional (id_alerta, id_usuario, fecha_alerta, tipo_alerta, estado) FROM stdin;
    public               postgres    false    229   �x       ]          0    25138    asignacion_usuario_terapeuta 
   TABLE DATA           b   COPY public.asignacion_usuario_terapeuta (id_usuario, id_terapeuta, fecha_asignacion) FROM stdin;
    public               postgres    false    221   �x       i          0    25231    cita_confirmada 
   TABLE DATA           ~   COPY public.cita_confirmada (id_cita, id_solicitud, fecha_cita, hora_cita, lugar, precio_acordado, observaciones) FROM stdin;
    public               postgres    false    233   �x       a          0    25168    diagnostico 
   TABLE DATA           a   COPY public.diagnostico (id_diagnostico, id_evaluacion, nivel_gravedad, descripcion) FROM stdin;
    public               postgres    false    225   y       l          0    25258    diagnostico_recomendacion 
   TABLE DATA           U   COPY public.diagnostico_recomendacion (id_diagnostico, id_recomendacion) FROM stdin;
    public               postgres    false    236   %y       _          0    25155 
   evaluacion 
   TABLE DATA           Y   COPY public.evaluacion (id_evaluacion, id_usuario, fecha, resultado_general) FROM stdin;
    public               postgres    false    223   By       k          0    25247    recomendacion 
   TABLE DATA           j   COPY public.recomendacion (id_recomendacion, titulo, descripcion, nivel_minimo, nivel_maximo) FROM stdin;
    public               postgres    false    235   _y       c          0    25185    respuesta_cuestionario 
   TABLE DATA           q   COPY public.respuesta_cuestionario (id_respuesta, id_evaluacion, numero_pregunta, respuesta_usuario) FROM stdin;
    public               postgres    false    227   |y       g          0    25212    solicitud_cita 
   TABLE DATA           i   COPY public.solicitud_cita (id_solicitud, id_usuario, id_terapeuta, fecha_solicitud, estado) FROM stdin;
    public               postgres    false    231   �y       \          0    25130 	   terapeuta 
   TABLE DATA           [   COPY public.terapeuta (id_terapeuta, nombre, correo_electronico, especialidad) FROM stdin;
    public               postgres    false    220   �y       Z          0    25114    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, nombre, correo_electronico, "contraseña", edad, carrera, semestre, rol_usuario, fecha_registro) FROM stdin;
    public               postgres    false    218   �y       |           0    0    alerta_emocional_id_alerta_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.alerta_emocional_id_alerta_seq', 1, false);
          public               postgres    false    228            }           0    0    cita_confirmada_id_cita_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cita_confirmada_id_cita_seq', 1, false);
          public               postgres    false    232            ~           0    0    diagnostico_id_diagnostico_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.diagnostico_id_diagnostico_seq', 1, false);
          public               postgres    false    224                       0    0    evaluacion_id_evaluacion_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.evaluacion_id_evaluacion_seq', 1, false);
          public               postgres    false    222            �           0    0 "   recomendacion_id_recomendacion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.recomendacion_id_recomendacion_seq', 1, false);
          public               postgres    false    234            �           0    0 '   respuesta_cuestionario_id_respuesta_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.respuesta_cuestionario_id_respuesta_seq', 1, false);
          public               postgres    false    226            �           0    0    solicitud_cita_id_solicitud_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.solicitud_cita_id_solicitud_seq', 1, false);
          public               postgres    false    230            �           0    0    terapeuta_id_terapeuta_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.terapeuta_id_terapeuta_seq', 1, false);
          public               postgres    false    219            �           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public               postgres    false    217            �           2606    25205 &   alerta_emocional alerta_emocional_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.alerta_emocional
    ADD CONSTRAINT alerta_emocional_pkey PRIMARY KEY (id_alerta);
 P   ALTER TABLE ONLY public.alerta_emocional DROP CONSTRAINT alerta_emocional_pkey;
       public                 postgres    false    229            �           2606    25143 >   asignacion_usuario_terapeuta asignacion_usuario_terapeuta_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_usuario_terapeuta
    ADD CONSTRAINT asignacion_usuario_terapeuta_pkey PRIMARY KEY (id_usuario, id_terapeuta);
 h   ALTER TABLE ONLY public.asignacion_usuario_terapeuta DROP CONSTRAINT asignacion_usuario_terapeuta_pkey;
       public                 postgres    false    221    221            �           2606    25240 0   cita_confirmada cita_confirmada_id_solicitud_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.cita_confirmada
    ADD CONSTRAINT cita_confirmada_id_solicitud_key UNIQUE (id_solicitud);
 Z   ALTER TABLE ONLY public.cita_confirmada DROP CONSTRAINT cita_confirmada_id_solicitud_key;
       public                 postgres    false    233            �           2606    25238 $   cita_confirmada cita_confirmada_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.cita_confirmada
    ADD CONSTRAINT cita_confirmada_pkey PRIMARY KEY (id_cita);
 N   ALTER TABLE ONLY public.cita_confirmada DROP CONSTRAINT cita_confirmada_pkey;
       public                 postgres    false    233            �           2606    25178 )   diagnostico diagnostico_id_evaluacion_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_id_evaluacion_key UNIQUE (id_evaluacion);
 S   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_id_evaluacion_key;
       public                 postgres    false    225            �           2606    25176    diagnostico diagnostico_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);
 F   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_pkey;
       public                 postgres    false    225            �           2606    25262 8   diagnostico_recomendacion diagnostico_recomendacion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_recomendacion
    ADD CONSTRAINT diagnostico_recomendacion_pkey PRIMARY KEY (id_diagnostico, id_recomendacion);
 b   ALTER TABLE ONLY public.diagnostico_recomendacion DROP CONSTRAINT diagnostico_recomendacion_pkey;
       public                 postgres    false    236    236            �           2606    25161    evaluacion evaluacion_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_pkey PRIMARY KEY (id_evaluacion);
 D   ALTER TABLE ONLY public.evaluacion DROP CONSTRAINT evaluacion_pkey;
       public                 postgres    false    223            �           2606    25256     recomendacion recomendacion_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.recomendacion
    ADD CONSTRAINT recomendacion_pkey PRIMARY KEY (id_recomendacion);
 J   ALTER TABLE ONLY public.recomendacion DROP CONSTRAINT recomendacion_pkey;
       public                 postgres    false    235            �           2606    25191 2   respuesta_cuestionario respuesta_cuestionario_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.respuesta_cuestionario
    ADD CONSTRAINT respuesta_cuestionario_pkey PRIMARY KEY (id_respuesta);
 \   ALTER TABLE ONLY public.respuesta_cuestionario DROP CONSTRAINT respuesta_cuestionario_pkey;
       public                 postgres    false    227            �           2606    25219 "   solicitud_cita solicitud_cita_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.solicitud_cita
    ADD CONSTRAINT solicitud_cita_pkey PRIMARY KEY (id_solicitud);
 L   ALTER TABLE ONLY public.solicitud_cita DROP CONSTRAINT solicitud_cita_pkey;
       public                 postgres    false    231            �           2606    25137 *   terapeuta terapeuta_correo_electronico_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.terapeuta
    ADD CONSTRAINT terapeuta_correo_electronico_key UNIQUE (correo_electronico);
 T   ALTER TABLE ONLY public.terapeuta DROP CONSTRAINT terapeuta_correo_electronico_key;
       public                 postgres    false    220            �           2606    25135    terapeuta terapeuta_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.terapeuta
    ADD CONSTRAINT terapeuta_pkey PRIMARY KEY (id_terapeuta);
 B   ALTER TABLE ONLY public.terapeuta DROP CONSTRAINT terapeuta_pkey;
       public                 postgres    false    220            �           2606    25128 &   usuario usuario_correo_electronico_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_correo_electronico_key UNIQUE (correo_electronico);
 P   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_correo_electronico_key;
       public                 postgres    false    218            �           2606    25126    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    218            �           2606    25206 "   alerta_emocional fk_alerta_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.alerta_emocional
    ADD CONSTRAINT fk_alerta_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.alerta_emocional DROP CONSTRAINT fk_alerta_usuario;
       public               postgres    false    218    229    4770            �           2606    25149 4   asignacion_usuario_terapeuta fk_asignacion_terapeuta    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_usuario_terapeuta
    ADD CONSTRAINT fk_asignacion_terapeuta FOREIGN KEY (id_terapeuta) REFERENCES public.terapeuta(id_terapeuta) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.asignacion_usuario_terapeuta DROP CONSTRAINT fk_asignacion_terapeuta;
       public               postgres    false    221    4774    220            �           2606    25144 2   asignacion_usuario_terapeuta fk_asignacion_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_usuario_terapeuta
    ADD CONSTRAINT fk_asignacion_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.asignacion_usuario_terapeuta DROP CONSTRAINT fk_asignacion_usuario;
       public               postgres    false    221    218    4770            �           2606    25241 !   cita_confirmada fk_cita_solicitud    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita_confirmada
    ADD CONSTRAINT fk_cita_solicitud FOREIGN KEY (id_solicitud) REFERENCES public.solicitud_cita(id_solicitud) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.cita_confirmada DROP CONSTRAINT fk_cita_solicitud;
       public               postgres    false    233    4788    231            �           2606    25263 1   diagnostico_recomendacion fk_diag_rec_diagnostico    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_recomendacion
    ADD CONSTRAINT fk_diag_rec_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES public.diagnostico(id_diagnostico) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.diagnostico_recomendacion DROP CONSTRAINT fk_diag_rec_diagnostico;
       public               postgres    false    236    225    4782            �           2606    25268 3   diagnostico_recomendacion fk_diag_rec_recomendacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_recomendacion
    ADD CONSTRAINT fk_diag_rec_recomendacion FOREIGN KEY (id_recomendacion) REFERENCES public.recomendacion(id_recomendacion) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.diagnostico_recomendacion DROP CONSTRAINT fk_diag_rec_recomendacion;
       public               postgres    false    236    235    4794            �           2606    25179 %   diagnostico fk_diagnostico_evaluacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT fk_diagnostico_evaluacion FOREIGN KEY (id_evaluacion) REFERENCES public.evaluacion(id_evaluacion) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT fk_diagnostico_evaluacion;
       public               postgres    false    4778    223    225            �           2606    25162     evaluacion fk_evaluacion_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT fk_evaluacion_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.evaluacion DROP CONSTRAINT fk_evaluacion_usuario;
       public               postgres    false    218    4770    223            �           2606    25192 .   respuesta_cuestionario fk_respuesta_evaluacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.respuesta_cuestionario
    ADD CONSTRAINT fk_respuesta_evaluacion FOREIGN KEY (id_evaluacion) REFERENCES public.evaluacion(id_evaluacion) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.respuesta_cuestionario DROP CONSTRAINT fk_respuesta_evaluacion;
       public               postgres    false    223    227    4778            �           2606    25225 %   solicitud_cita fk_solicitud_terapeuta    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud_cita
    ADD CONSTRAINT fk_solicitud_terapeuta FOREIGN KEY (id_terapeuta) REFERENCES public.terapeuta(id_terapeuta) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.solicitud_cita DROP CONSTRAINT fk_solicitud_terapeuta;
       public               postgres    false    4774    231    220            �           2606    25220 #   solicitud_cita fk_solicitud_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud_cita
    ADD CONSTRAINT fk_solicitud_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.solicitud_cita DROP CONSTRAINT fk_solicitud_usuario;
       public               postgres    false    4770    218    231            e      x������ � �      ]      x������ � �      i      x������ � �      a      x������ � �      l      x������ � �      _      x������ � �      k      x������ � �      c      x������ � �      g      x������ � �      \      x������ � �      Z      x������ � �     