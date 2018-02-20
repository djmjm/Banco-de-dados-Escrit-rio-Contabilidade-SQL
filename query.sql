--	CONSULTAS PARA TESTE
--  Foi utilizado o SGBD MysSQL
--	(1) Necessita-se saber o nome e sobrenome de todos os seus clientes junto com o nome do(s) trabalho(s) e id(s) do(s) serviço(s),
--	contratado(s) do escritório. A lista deve ser ordenada pelo id do serviço.
--

use escritorio;

select idServ, nome, sobrenome, nomeTrabalho from(select idCliente, id as idServ, nomeTrabalho 
		from (select * from 
			(select nome as nomeTrabalho, id as idTrab from trabalho) as a join servicoTrabalho
		on servicoTrabalho.idTrabalho = a.idTrab) as b join servico
	on servico.id = b.idServico) as c join cliente
on c.idCliente = cliente.id
order by idServ;

--
--
--  (2) Necessita-se saber o nome junto com o numero de clientes atendidos do(s) funcionário(s) que possue(m)
--	o maior numero de atendimentos a clientes
--

select NClientesAtendidos as 'Numero de clientes atendidos', nome as 'Nome Funcionario' from 
	(select * from
		(select max(NClientesAtendidos) as NumeroClientesAtendidos from
			( select count(*) as NClientesAtendidos, idFuncionario from servico
			group by idFuncionario) as b) as a join ( select count(*) as NClientesAtendidos, idFuncionario from servico
			group by idFuncionario) as c
	on c.NClientesAtendidos = a.NumeroClientesAtendidos) d join funcionario
on d.idFuncionario = funcionario.id;

--
--
--	(3) Necessita-se saber o salário de todos os funcionarios que fazem o trabalho de Contabilidade Pessoal no escritório
--
--

select salario from 
	(select * from
		(select salario, id from funcionario) as a join funcionarioTrabalho
	on funcionarioTrabalho.idFuncionario = a.id) as b join trabalho
on trabalho.id = b.idTrabalho
where nome = 'contab pessoal';

--
--	(4) Necessita-se de informações sobre um serviço simples prestado a um cliente na data de 01/02/2017.
--	As informações necessárias são o nome e telefone do cliente e o nome e telefone do funcionario que
--	atendeu esse cliente
--

select NomeFuncionario as 'Nome Funcionario', TelefoneFuncionario as 'Telefone Funcionario', nome as 'Nome Cliente', telefone as 'Telefone Cliente' from 
	(select nome as NomeFuncionario, telefone as TelefoneFuncionario, idCliente from
		(select * from 
			(select idServico from servicoSimples
			where ano = '2017' and dia = '1' and mes = '2') as a join servico
		on servico.id = a.idServico) as b join funcionario
	on funcionario.id = b.idFuncionario) as c join cliente
on cliente.id = c.idCliente;

--
--	(5) Necessita-se saber qual é o serviço prestado mensalmente com a menor mensalidade
--	lembrando que só contam os serviços que ainda estão em vigor (ano de quitação maior ou igual 2018)
--
--

select min(valor) as 'Menor mensalidade' from
	(select * from servicoMensal
	where anoQuitacao >= '2018') as a join servico
on servico.id = a.idServico;

--
-- (6) Necessita-se saber quanto tempo (em anos) o último funcionario demitido trabalhou no escritório
--
--
--

select (anoDemissao - ano) as 'Tempo de servico em anos' from 
	(select anoDemissao, id as idFuncionario from
		(select idFuncionario, ano as anoDemissao from
			(select max(id) as idUltima from demissao) as a join demissao
		on demissao.id = a.idUltima) as b join funcionario
	on funcionario.id = b.idFuncionario) as c join contratacao
on contratacao.idFuncionario = c.idFuncionario;

--
--
--	(7) Necessita-se saber o quanto custa cada serviço prestado de cada funcionário do escritório
--	Para chegar nesse resultado, é necessário consultar todos clientes atendidos e trabalhos que o usuário faz,
--	fazendo uma média
--

select b.nome, salario div (nTrabs + count(*)) as 'Remuneracao x servico prestado'  from 
	(select count(*) as nTrabs, id, salario, nome from 
		(select * from funcionario) as a join funcionarioTrabalho
	on funcionarioTrabalho.idFuncionario = a.id
	group by id) as b join servico
on servico.idFuncionario = b.id
group by b.id
order by salario div (nTrabs + count(*)) desc;

--
--
-- 	(8) Necessita-se saber quais os nomes dos trabalhos tem consultoria de "Solucoes Contabeis MM"
--
--

select nome as 'Nome Trabalho' from 
	(select idTrabalho from 
		(select id from consultoria
		where nome = 'Solucoes contabeis MM') as a join consultoriaTrabalho
	on consultoriaTrabalho.idConsultoria = a.id) as b join trabalho
on trabalho.id = b.idTrabalho;