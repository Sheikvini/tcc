
create database tcc;
use tcc;


show databases;
show tables;

create table    (
 id_cliente			int primary key auto_increment,
 nm_cliente			varchar(200),
 ds_sex 			ENUM ('Feminino', 'Masculino','Prefiro não informar'),
 dt_nascimento		date,
 ds_cpf				varchar(200),
 ds_telefone		varchar(200),
 ds_tipo_endereco     varchar(100),
 ds_cep                  dec(11),
 ds_numero_complemento    varchar(100),
 ds_rua                   varchar(100),
 ds_bairro                varchar(100),
 ds_cidade                varchar(100),
 ds_estado	              varchar(100),
 ds_senha               varchar(200),
 ds_email               varchar(200)
);

select * from tb_cliente;

create table tb_login (
id_logi 	       		int primary key auto_increment,
id_cliente				integer,
ds_email                varchar(200),
ds_senha                varchar(200),
foreign key (id_cliente) references tb_cliente(id_cliente)
);

insert into tb_login (ds_email, ds_senha)
values ('teste@gmail.com' , '1234');

select * from tb_login;


create table tb_loginAdm (
id_loginAdm 	       	int primary key auto_increment,
ds_usuario              varchar(200),
ds_senha                varchar(200)
);

select * from tb_loginAdm;

insert into tb_loginAdm (ds_usuario, ds_senha)
values ('@admin' , '@dminbr');

create table tb_produto(
    id_produto                  int primary key auto_increment,
    img_produto                 varchar(200),
    nm_produto                  varchar(200),
    vl_preco                    dec(5,2),
    vl_promocao                 varchar(200),
    qtd_estoque                 int,
    ds_descricao                varchar(200),
    ds_tipo                     varchar(100),
    bt_disponivel               bool,
    ds_fabricante               varchar(200),
    ds_recomendacao             varchar(200),
    ds_validade                 date,
    nm_categoria                varchar(200)
);

select * from tb_produto;

select * from tb_produto;
insert INTO tb_produto    (img_produto, nm_produto, vl_preco, vl_promocao, qtd_estoque, ds_descricao, ds_tipo, bt_disponivel, ds_fabricante, ds_recomendacao, ds_validade, nm_categoria)
values ('/assets/img/produtos/tinta1.png', 'Tinta Pva Acrílica Interna Coralar Branco 3.6 litros - Coral', 63.90, '57.90', '32', 'Tinta acrílica Coral recomendada para ambientes internos, 3.6L branco', 'tinta Acrílica', true,
 'Coral', 'Para ambiente internos', '2024-02-03', 'Internas');

create table tb_endereco(
 id_endereco			int primary key auto_increment,
 ds_tipo_endereco       varchar(200),
 ds_cep                 varchar(200),
 ds_numero_complemento  varchar(200),
 ds_rua                 varchar(200),
 ds_bairro              varchar(200),
 ds_cidade              varchar(200),
 ds_estado	        	varchar(200)
);

select * from tb_endereco;


create table tb_cartao(
id_cartao				int primary key auto_increment,
ds_ncartao				varchar(200),
dt_vencimentocartao		date,
ds_cvc					varchar(200),
ds_fromadepagamento 	 ENUM ('Débito', 'Crédito') NOT NULL,
qtd_parcelas 			int
);

select * from tb_cartao;

create table tb_pedido(
id_pedido				int primary key auto_increment,
id_cliente				integer,
id_endereco				integer,
id_cartao				integer,
ds_numero_cartao		varchar(200),
ds_cvc					varchar(200),
ds_vencimento_cartao    varchar(200),
foreign key (id_cliente) references tb_cliente (id_cliente),
foreign key (id_cartao) references tb_cartao (id_cartao),
foreign key (id_endereco) references tb_endereco (id_endereco)
);

select * from tb_pedido;


create table tb_produto_item(
id_produto_item       int primary key auto_increment,
id_produto            integer,
id_pedidos            integer,
qtd_item              int,
foreign key (id_produto) references tb_produto (id_produto)
);


select * from tb_produto_item;






Select id_produto id,
nm_produto		nome
from tb_produto
where nm_produto like '%%';

update id_cliente
	set nm_cliente  =  '',
		ds_sexo =	'',
        ds_cpf	= '',
        ds_telefone= '',
        ds_senha ='',
        ds_email	=	''
where tb_cliente = 1;

select id_cliente		id,
ds_email			email,
ds_senha			senha
from tb_cliente
where ds_email		= 'admin@admin.com.br'
and ds_senha 		= 'admin1234';

delete from  tb_produto
where  id_produto = 1;

