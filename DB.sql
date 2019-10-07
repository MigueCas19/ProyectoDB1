create table usuario(id_user integer NOT NULL, nombres varchar(50), apellidos varchar(50), fecha_de_nacimiento date, direccion varchar(30), telefono integer NOT NULL, contrasena varchar(10) NOT NULL, primary key(identif,contrasena));
create table carrito(usuario varchar(20) NOT NULL, id_car integer NOT NULL, primary key(id_car));
create table productos(id_prod integer NOT NULL, nombre varchar(30), fecha_ven date NOT NULL, precio integer NOT NULL, primary key(id_prod));
create table pedido(numero integer NOT NULL, direccion varchar(30), primary key(numero));
create table conductor(id_conduc integer NOT NULL, nombres varchar (50), apellidos varchar(50), licencia integer NOT NULL, placa integer NOT NULL, primary key(id_conduc));
create table medio_pago(tipo varchar(15) not null, numero integer not null, primary key (tipo, numero));
create table pertenece(
  ID_cart integer not null,
  ID_user integer not null,
  primary key (ID_cart, ID_user),
  foreign key (ID_cart) references carrito (id_car) on delete cascade on update cascade,
  foreign key (ID_user) references usuario (id_user) on delete cascade on update cascade
);
create table carro_contiene(
  ID_cart integer not null,
  ID_product integer not null,
  primary key (ID_cart, ID_product),
  foreign key (ID_cart) references carrito (id_car) on delete cascade on update cascade,
  foreign key (ID_product) references productos (id_prod) on delete cascade on update cascade
);
create table pedido_contiene(
  numero integer not null,
  ID_product integer not null,
  primary key (numero, ID_product),
  foreign key (numero) references pedido (numero) on delete cascade on update cascade,
  foreign key (ID_product) references productos (id_prod) on delete cascade on update cascade
);
create table transporta(
  numero integer not null,
  id_conduc integer not null,
  primary key (numero, id_conduc),
  foreign key (numero) references pedido (numero) on delete cascade on update cascade,
  foreign key (id_conduc) references conductor (id_conduc) on delete cascade on update cascade
);
create table tiene(
  id_user integer not null,
  tipo varchar(15) not null,
  numero integer not null,
  primary key (id_user, tipo, numero),
  foreign key (id_user) references usuario (id_user) on delete cascade on update cascade,
  foreign key (tipo, numero) references medio_pago (tipo, numero) on delete cascade on update cascade
);
