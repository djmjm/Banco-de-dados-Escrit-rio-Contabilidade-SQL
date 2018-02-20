
--      CRIAÇÃO
--      Script para criação do db
--      Foi utilizado o SGBD MySQL
--
--
--


create schema escritorio;

use escritorio;

create table cliente(
    id int auto_increment,
    nome varchar(30) not null,
    sobrenome varchar(40) not null,
    telefone varchar(15) not null,
    cidade varchar(30) not null,
    rua varchar(50) default 'sem endereco',
    numeroCasa varchar(12) default '000',
    primary key (id)
);

create table pessoaFisica(
    idCliente int,
    CPF varchar(30) not null,
    foreign key(idCliente) references cliente(id),
    primary key(CPF)
);

create table pessoaJuridica(
    idCliente int,
    CNPJ varchar(30) not null unique,
    foreign key(idCliente) references cliente(id),
    primary key(CNPJ)
);



create table funcionario(
    id int auto_increment,
    nome varchar(30) not null,
    sobrenome varchar(40) not null,
    telefone varchar(15) not null,
    rua varchar(50) default 'sem endereco',
    numeroCasa varchar(12) default '000',
    salario int not null,
    idDemissao int,
    idContratacao int,
    primary key(id)

);

create table servico(
    id int auto_increment,
    idCliente int not null,
    idFuncionario int not null,
    valor int not null,
    primary key(id),
    foreign key (idCliente) references cliente(id),
    foreign key (idFuncionario) references funcionario(id)
);


create table servicoMensal(
    idServico int not null,
    diaPagamento tinyint not null,
    anoQuitacao int not null,
    foreign key (idServico) references servico(id)
);

create table servicoSimples(
    idServico int not null,
    dia tinyint not null,
    mes tinyint not null,
    ano int not null,
    foreign key (idServico) references servico(id)
);


create table trabalho(
    id int auto_increment,
    nome varchar(20) not null,
    primary key (id)
);

create table servicoTrabalho(
    idServico int not null,
    idTrabalho int not null,
    foreign key (idServico) references servico(id),
    foreign key (idTrabalho) references trabalho(id)
    
);


create table funcionarioTrabalho(
    idFuncionario int not null,
    idTrabalho int not null,
    foreign key (idFuncionario) references funcionario(id),
    foreign key (idTrabalho) references trabalho(id)

);

create table dono(
    id int auto_increment,
    nome varchar(30) not null,
    sobrenome varchar(40) not null,
    cpf varchar(30) not null,
    telefone varchar(15) not null,
    rua varchar (40) not null,
    numeroCasa varchar(12) not null,
    
    primary key(id)
);


create table contratacao(
    id int auto_increment,
    idFuncionario int not null,
    idDono int not null,
    dia tinyint not null,
    mes tinyint not null,
    ano int not null,
    primary key (id),
    foreign key (idDono) references dono(id),
    foreign key (idFuncionario) references funcionario(id)
);

create table demissao(
    id int auto_increment,
    idFuncionario int not null,
    idDono int not null,
    dia tinyint not null,
    mes tinyint not null,
    ano int not null,
    primary key (id),
    foreign key (idDono) references dono(id),
    foreign key (idFuncionario) references funcionario(id)
);

create table consultoria(
    id int auto_increment,
    idDono int, 
    nome varchar(30) not null unique,
    cnpj varchar(30) not null unique,
    valor int not null,
    primary key (id),
    foreign key (idDono) references dono(id)

);

create table consultoriaTrabalho(
    idTrabalho int not null,
    idConsultoria int not null,
    foreign key (idTrabalho) references trabalho(id),
    foreign key (idConsultoria) references consultoria(id)
)
