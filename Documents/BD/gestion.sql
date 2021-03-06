PGDMP                     	    x         	   Productos    13.0    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394 	   Productos    DATABASE     i   CREATE DATABASE "Productos" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Bolivia.1252';
    DROP DATABASE "Productos";
                postgres    false            �            1259    16413    combo    TABLE     z   CREATE TABLE public.combo (
    codcombo character(20) NOT NULL,
    nombre character(30),
    codprecio character(20)
);
    DROP TABLE public.combo;
       public         heap    postgres    false            �            1259    16398 	   descuento    TABLE     �   CREATE TABLE public.descuento (
    coddescuento character(20) NOT NULL,
    fechainicio date NOT NULL,
    fechafin date NOT NULL,
    porcentaje smallint,
    cantidadproducto smallint
);
    DROP TABLE public.descuento;
       public         heap    postgres    false            �            1259    16416    detalle_combo    TABLE     a   CREATE TABLE public.detalle_combo (
    codproducto character(20),
    codcombo character(20)
);
 !   DROP TABLE public.detalle_combo;
       public         heap    postgres    false            �            1259    16404    fotos    TABLE     �   CREATE TABLE public.fotos (
    "codFoto" character(20) NOT NULL,
    imagen bytea NOT NULL,
    codproducto character(20),
    codcombo character(20)
);
    DROP TABLE public.fotos;
       public         heap    postgres    false            �            1259    16410    precio    TABLE     c   CREATE TABLE public.precio (
    codprecio character(20) NOT NULL,
    precio smallint NOT NULL
);
    DROP TABLE public.precio;
       public         heap    postgres    false            �            1259    16395    producto    TABLE     (  CREATE TABLE public.producto (
    codproducto character(20) NOT NULL,
    nombre character(30) NOT NULL,
    "descripción" character(1000) NOT NULL,
    tamanio smallint,
    fechavencimiento date,
    tipo character(10) NOT NULL,
    codprecio character(20),
    coddescuento character(20)
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �          0    16413    combo 
   TABLE DATA           <   COPY public.combo (codcombo, nombre, codprecio) FROM stdin;
    public          postgres    false    204   �       �          0    16398 	   descuento 
   TABLE DATA           f   COPY public.descuento (coddescuento, fechainicio, fechafin, porcentaje, cantidadproducto) FROM stdin;
    public          postgres    false    201   |        �          0    16416    detalle_combo 
   TABLE DATA           >   COPY public.detalle_combo (codproducto, codcombo) FROM stdin;
    public          postgres    false    205   �        �          0    16404    fotos 
   TABLE DATA           I   COPY public.fotos ("codFoto", imagen, codproducto, codcombo) FROM stdin;
    public          postgres    false    202   ?!       �          0    16410    precio 
   TABLE DATA           3   COPY public.precio (codprecio, precio) FROM stdin;
    public          postgres    false    203   \!       �          0    16395    producto 
   TABLE DATA           �   COPY public.producto (codproducto, nombre, "descripción", tamanio, fechavencimiento, tipo, codprecio, coddescuento) FROM stdin;
    public          postgres    false    200   �!       @           2606    16420    combo combo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.combo
    ADD CONSTRAINT combo_pkey PRIMARY KEY (codcombo);
 :   ALTER TABLE ONLY public.combo DROP CONSTRAINT combo_pkey;
       public            postgres    false    204            :           2606    16422    descuento descuento_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.descuento
    ADD CONSTRAINT descuento_pkey PRIMARY KEY (coddescuento);
 B   ALTER TABLE ONLY public.descuento DROP CONSTRAINT descuento_pkey;
       public            postgres    false    201            <           2606    16424    fotos fotos_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fotos_pkey PRIMARY KEY ("codFoto");
 :   ALTER TABLE ONLY public.fotos DROP CONSTRAINT fotos_pkey;
       public            postgres    false    202            >           2606    16426    precio precio_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precio_pkey PRIMARY KEY (codprecio);
 <   ALTER TABLE ONLY public.precio DROP CONSTRAINT precio_pkey;
       public            postgres    false    203            8           2606    16428    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (codproducto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    200            G           2606    16459 )   detalle_combo detalle_combo_codcombo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_combo
    ADD CONSTRAINT detalle_combo_codcombo_fkey FOREIGN KEY (codcombo) REFERENCES public.combo(codcombo);
 S   ALTER TABLE ONLY public.detalle_combo DROP CONSTRAINT detalle_combo_codcombo_fkey;
       public          postgres    false    2880    205    204            C           2606    16439    fotos fktest    FK CONSTRAINT     {   ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fktest FOREIGN KEY (codproducto) REFERENCES public.producto(codproducto);
 6   ALTER TABLE ONLY public.fotos DROP CONSTRAINT fktest;
       public          postgres    false    200    202    2872            F           2606    16444    detalle_combo fktest    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_combo
    ADD CONSTRAINT fktest FOREIGN KEY (codproducto) REFERENCES public.producto(codproducto);
 >   ALTER TABLE ONLY public.detalle_combo DROP CONSTRAINT fktest;
       public          postgres    false    205    2872    200            E           2606    16483    combo fktest    FK CONSTRAINT     u   ALTER TABLE ONLY public.combo
    ADD CONSTRAINT fktest FOREIGN KEY (codprecio) REFERENCES public.precio(codprecio);
 6   ALTER TABLE ONLY public.combo DROP CONSTRAINT fktest;
       public          postgres    false    204    203    2878            A           2606    16488    producto fktest    FK CONSTRAINT     x   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fktest FOREIGN KEY (codprecio) REFERENCES public.precio(codprecio);
 9   ALTER TABLE ONLY public.producto DROP CONSTRAINT fktest;
       public          postgres    false    2878    200    203            D           2606    16454    fotos fotos_codcombo_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fotos_codcombo_fkey FOREIGN KEY (codcombo) REFERENCES public.combo(codcombo);
 C   ALTER TABLE ONLY public.fotos DROP CONSTRAINT fotos_codcombo_fkey;
       public          postgres    false    204    2880    202            B           2606    16493 #   producto producto_coddescuento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_coddescuento_fkey FOREIGN KEY (coddescuento) REFERENCES public.descuento(coddescuento);
 M   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_coddescuento_fkey;
       public          postgres    false    2874    200    201            �   n   x�K6Q� ����I�
.�9ɩ
a�)�h�E�f�z��MqP�����Z�!�� c�9�''�:��$Y��y�HaXϕl��E��%���i�!n��&���A1z\\\ �F      �   H   x�KI-6T@�FF��@de����F\)��F��X�Z@��y� ��8�7B1�ЀӘ+F��� i��      �   [   x��ѽ�P��L���w�c���Or%�!Ԙh"7^�ֶK#/%w%�|�r�BRrP'9��4R��7�t�83R�%"�%�� >>RI      �      x������ � �      �   7   x�+(J5T@��\E�Ff qcq#��	�z��)��1X�Sܔ+F��� P�&      �   �  x��\Ms�=�~�*V�U�5�+R"u"�u�D�QvU倝�΂� c`���£<�t�1{���k`��;ˈ�D�(�v����ǲ^7S=b-IN'&���E��kn��L�Z�+�V[Y�=�[;)ˠ�(^&4���D��^�dk���Og�dܢϸY��8l��=e��~����V7���V*)��f����O%�����qT�Mdny�s�2�<�Mԡ�,#�s����?��j���(�͡*�]�Lf����X��D&�fM�GKnM�C[��3��Z���5/��� e'�){���ǿ=�;�3/hd�ha�����/��[_�?�v'�m�";��Ò���&o_&��
;=���kU{��A���y��XBm(n�$�!�5e��������Ο�|8x�_Z�
?D�/�׵4�d���u��I'��$���}��`C��=��6k��� aW&_��&�J���n���t��u&sø�f�툰f{�K�bGגg���D �;+;�1��*�6�}�Y�{Қ���w��J�a7#�b�e7'�=�T[=܍�5j��*c#�	�*i��ݚ�T,�6Z��lw�ZV��X�˵"F���{��蠴��J���i�����H�Rܥ�L8s��Ni���v+�� Sr=�I#gTh���?����
|�����8���h�Sp����,�>��H��"����N�{2Ǒy�����"I.�`�ც����"������:�5��	�9èG�r��
��v	N�'Y>�'���D�Eq�y�ܛ�, Kr�Ws��&�G�
�tw+2 `���@ELi��T{NPqW�4����7��a(4`*I����!r�=J�䲘#�p��&~�	�@�0����;S
�à�*�$�h�ȑ2��DŌ`���=���)zr4;��X���0�^�K�8p8(�j�\��������+7]��NS�����	��s���\�)���(�[%(%ti2YK(Ɗ��w�h�)`Sp�Б�mbD����:OSs��Z��Iз���c������6h��p�Ѩ�ÐriEF�Q�/h��,�����c�p�ǠǾ}JI��	^^`��!υॅ$���[�Yrʭ���b�ۓ��ټ���yI+|�0�ǰ�˿��D:餓�J�~�%3@@0�
�Fi�,a�R��!�`�{1�܃*��Jb�Rht��g/I��0�o7��)���9�,�+��[АW8/9+��t�k��8��
a�qӒ��`�W`ږO����M�ۅ>r�)N�Q���51�K�g��͍I�Fj�ccA��
� %H��G�5�+��ɜbN���S~��t�[K2���C��VT�A!�?<5w���[��H�(2 �&��($�y�ʐ�L�"��=�P�A�hȜ�2��"6���L���FsX��F5��1�%�f?�E���hv^�z��D9�6:e� ��`�B�NA��^r����T����%tĠͫ�U��f�c
DsVz��-1��f\^����B��S/�H��I U�j��v��~Zp�"X�P�����Ih�������v*h���\t1�N�3I"���?~�����%sB�|:��h�V��Z����:DLR����9~������_����̗��I'��$�"��Q�}���m'�$g���"���m�v�)��ps��DY���=�y,��cb/��h+Ka��xА���-Sf�U�?�Ce�%�}Gؒcl"+aG1�m�f���+�7uXu�C�c�5<�	^IE�PCF��kr�x����#��@��jCGD�?O𘚥�p��4����e8�)M.l�y��Ft�R��г��a�sQb'e����V��z=Z��5#/���ÔY�VНp�T�t�����x*��,�͇�M�Y'K4������֊ύ���g�S"7Y�"�+�!��w:g4���c�Qc������;����	-��W!�%tE�
�P<� +�<: �����7�SN��m�_�߾�r9��v<���5~k��3Ԝ�������+-�8@�Ŝ�\Fo��Ԧ�Z ��*A�&H	�XB �7t�XL��ओ�I���F�V��d��+�mQb$��Is�$�&p�7b�{�}�
%��%���*1�BYp1#��e����Lf7�`ȃv@��Y�c&����8��<�
T.Pm�sLɒ?����(����ۑ�y��;�����J�T<��݂b!!�DQ��^����)�X�Jw�D	ƄK;]����J>&\�N3a�W��4�Ծ���c����������>\�D�$���2`S�=٢�]�)���潷EF<L���/�э;�{�i8즫PÆ{�~z�R*��ki�G�� Rb�a�`��Lv����1@�dC�E-;��¡8�6�y�|�NcFd�̓g������s��V�c���[��l�l�u��L���s�҆��h-�ȔnȻ��{m�����k�r�
`kv=��
�b�>�9PV��t�5��Y���%x�4����p��\Pj�Gã�����|�����^�������������:�HcO��ea��z���4Bl'�e��B��%�jhe��nu���GK����z���K^��Qo���I$��^��@�o�I��x�Ұ�v�0\DA�&��4G�AL1��b,��x����-�"溅H���H��wE��X>����P�[�Q�+��p���l�a�YS6��ƞÅ�+b40���3�/�u&b�	礼�6O��0l9/�{�& 򴼦`	]P���rvݽ!���O����6N�e&��S~w���I��u*/��#LI���V2n�}��v�I'�D>*��$I���y�f�1��i��p�z�^���g�P!��LA�Su�$���p&|5OzY�=��Nus�T�$Ȅ���쪚�D$����<��]����!�%��G���O�v�C�����YJ5�z-�M�_`Ͱ���~�+�t�N~��Qg�^6Ф�>��~')}�+I��'s3}����;D*+�'T\ѣ�Y$�чG=v�꛳W/�/�Ϗ����1Wv�t��^O�]�����9��q����7&��7�z����~����G�k��vӫ�f�~G�t�����J{Ů�:�y�����&�d^     