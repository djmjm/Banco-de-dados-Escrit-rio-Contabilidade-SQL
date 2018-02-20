
--		INSERT
--		Algumas instâncias fictícias feitas no banco de dados
--		Foi utilizado o SGBD MysSQL
--
--
--
--
--

use escritorio;

insert into cliente (nome, sobrenome, telefone, cidade, rua, numeroCasa) values
('Douglas', 'Macedo Pereira', '5123432123', 'Camaqua','Jorge Machado', '332'),
('Joao', 'Silveira', '5123323456', 'Porto Alegre','Coronel Pedro Osorio', '2211'),
('Diogo', 'Machado', '5345432345', 'Pelotas','Almirante Barroso', '234'),
('Ricardo', 'Chagas da Silva', '534234563', 'Pelotas','Borges de Medeiros', '2113'),
('Jonatan', 'Rosa', '5323432123', 'Pelotas','Borges de Medeiros', '331'),
('Joao', 'Maciel Souza', '53234432123', 'Pelotas','Almirante Neto', '231'),
('Douglas', 'Moura', '5323542123', 'Pelotas','General Souza', '213'),
('Douglas', 'Roque Junior', '5324535643', 'Pelotas','Beato Salu', '213'),
('Robert', 'Lewandowski', '5365454123', 'Pelotas','General Souza', '2345'),
('Pedro', 'Rogerio Silva', '5323431123', 'Pelotas','Jorge Soyza', '3333'),
('Tiago', 'Souto', '532343244', 'Pelotas','Beco diagonal', '3213'),
('Estanislau', 'Wasiliuk', '5323432134', 'Pelotas','Almirante Neto', '2341'),
('Luciano', 'Vieto', '513276567', 'Cristal',' BR 116', '1223'),
('GREMIO', 'FBPA', '513345123', 'Porto Alegre','Azenha', '1'),
('JME LTDA', 'LTDA', '5323412123', 'Pelotas','Jorge Machado', '112'),
('Papelaria ME', 'ME', '5323432123', 'Pelotas','Almirante Neto', '213');

insert into pessoaFisica values
('1', '37866463894893'),
('2', '94832849839834'),
('3', '19482343849894'),
('4', '79321217837283'),
('5', '78437487837240'),
('6', '89128392838923'),
('7', '82983823892380'),
('8', '12302930293029'),
('9', '49894972837287'),
('10', '2398984737465'),
('11', '1293837495049'),
('12', '0932832838377'),
('13', '1232434300019');

insert into pessoaJuridica values
('14', '37866464000195'),
('15', '03713050000104'),
('16', '12324343000195');

insert into trabalho (nome) values
('IRPF'),
('Contab empresa'),
('criar empresa'),
('ITR'),
('contab pessoal');

insert into funcionario (nome, sobrenome, telefone, rua, numeroCasa, salario) values
('Geraldo', 'Pedroso', '534373729','Borges de Medeiros', '432', '2000'),
('Jorge', 'Janovik', '5348930209','Almirante Neto', '345', '1500'),
('Robert', 'Lewandowski', '539942123','General Souza', '945', '1000');

insert into servico (idCliente, idFuncionario, valor) values
('1', '1', '515'),
('2', '1', '678'),
('3', '3', '890'),
('4', '2', '1200'),
('5', '1', '421'),
('6', '1', '2000'),
('7', '2', '2567'),
('8', '3', '511'),
('9', '3', '1223'),
('10', '1', '897'),
('11', '2', '776'),
('12', '1', '2009'),
('13', '3', '1560'),
('14', '1', '7670'),
('15', '2', '5480'),
('16', '3', '3309');

insert into servicoTrabalho values
('1', '4'),
('2', '4'),
('3', '1'),
('4', '1'),
('4', '4'),
('5', '4'),
('6', '5'),
('6', '1'),
('7', '4'),
('7', '5'),
('7', '1'),
('7', '4'),
('8', '4'),
('9', '5'),
('9', '1'),
('10', '5'),
('11', '4'),
('12', '5'),
('13', '5'),
('13', '1'),
('14', '3'),
('14', '2'),
('15', '2'),
('16', '3');

insert into servicoSimples values
('1', '3', '11', '2016'),
('5', '1', '2', '2017'),
('6', '22', '6', '2017'),
('8', '29', '9', '2017'),
('10', '7', '10', '2017'),
('11', '1', '1', '2017'),
('12', '4', '1', '2016'),
('13', '21', '12', '2016'),
('14', '3', '3', '2016'),
('9', '12', '10', '2017'),
('16', '16', '11', '2017');

insert into servicoMensal values
('3', '6', '2018'),
('4', '12', '2018'),
('7', '9', '2017'),
('15', '26', '2016');

insert into funcionarioTrabalho (idFuncionario, idTrabalho) values
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('1', '5'),
('2', '3'),
('2', '4'),
('3', '1'),
('3', '2'),
('3', '5');

insert into dono (nome, sobrenome, cpf, telefone, rua, numeroCasa) values
('Douglas', 'Janovik Maliszewski', '43256743300', '5388765390', 'Joao Afonso Pereira', '213');

insert into contratacao (idDono, idFuncionario, dia, mes, ano) values
('1', '1' , '20', '6', '2015'),
('1', '2', '20', '9', '2015'),
('1', '3','2', '5', '2015');

insert into demissao (idDono, idFuncionario, dia, mes, ano) values
('1', '3', '10', '2', '2018');

insert into consultoria (idDono, nome, cnpj, valor) values
('1', 'Solucoes contabeis MM', '090493434533', '12342'),
('1', 'Escritorio Santos', '57434943378', '20122');

insert into consultoriaTrabalho (idConsultoria, idTrabalho) values
('1', '3'),
('1', '2'),
('1', '5'),
('2', '2'),
('2', '5');