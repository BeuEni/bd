--USE bdConfeitariaSonho

--A:
CREATE PROCEDURE spInserirCategoriaProduto (
    @nomeCategoriaProduto VARCHAR(50)
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tbCategoriaProduto WHERE nomeCategoriaProduto = @nomeCategoriaProduto)
    BEGIN
        INSERT INTO tbCategoriaProduto (nomeCategoriaProduto) VALUES (@nomeCategoriaProduto)
        PRINT 'Categoria de produto inserida com sucesso.'
    END
    ELSE
    BEGIN
        PRINT 'Categoria de produto já existe.'
    END
END

--inserindo
EXEC spInserirCategoriaProduto @nomeCategoriaProduto = 'Bolo Festa';
EXEC spInserirCategoriaProduto @nomeCategoriaProduto = 'Bolo Simples';
EXEC spInserirCategoriaProduto @nomeCategoriaProduto = 'Torta';
EXEC spInserirCategoriaProduto @nomeCategoriaProduto = 'Salgado';

SELECT * FROM tbCategoriaProduto

--B:
CREATE PROCEDURE spInserirProduto (
    @nomeProduto VARCHAR(50)
    ,@precoKiloProduto MONEY
    ,@codCategoriaProduto INT
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tbProduto WHERE nomeProduto = @nomeProduto)
    BEGIN
        INSERT INTO tbProduto (nomeProduto, precoKiloProduto, codCategoriaProduto)
        VALUES (@nomeProduto, @precoKiloProduto, @codCategoriaProduto)
        PRINT 'Produto inserido com sucesso.'
    END
    ELSE
    BEGIN
        PRINT 'Produto já existe.'
    END
END

--inserindo
EXEC spInserirProduto @nomeProduto = 'Bolo Floresta Negra', @precoKiloProduto = 42.00, @codCategoriaProduto = 1;
EXEC spInserirProduto @nomeProduto = 'Bolo Prestígio', @precoKiloProduto = 43.00, @codCategoriaProduto = 1;
EXEC spInserirProduto @nomeProduto = 'Bolo Nutella', @precoKiloProduto = 44.00, @codCategoriaProduto = 2;
EXEC spInserirProduto @nomeProduto = 'Bolo Formigueiro', @precoKiloProduto = 17.00, @codCategoriaProduto = 2;
EXEC spInserirProduto @nomeProduto = 'Bolo de Cenoura', @precoKiloProduto = 19.00, @codCategoriaProduto = 3;
EXEC spInserirProduto @nomeProduto = 'Torta de Palmito', @precoKiloProduto = 45.00, @codCategoriaProduto = 3;
EXEC spInserirProduto @nomeProduto = 'Torta de frango e catupiry', @precoKiloProduto = 47.00, @codCategoriaProduto = 3;
EXEC spInserirProduto @nomeProduto = 'Torta de Escarola', @precoKiloProduto = 44.00, @codCategoriaProduto = 4;
EXEC spInserirProduto @nomeProduto = 'Coxinha de Frango', @precoKiloProduto = 25.00, @codCategoriaProduto = 4;
EXEC spInserirProduto @nomeProduto = 'Esfiha de carne', @precoKiloProduto = 27.00, @codCategoriaProduto = 4;
EXEC spInserirProduto @nomeProduto = 'Folhado Queijo', @precoKiloProduto = 31.00, @codCategoriaProduto = 4;
EXEC spInserirProduto @nomeProduto = 'Risole Misto', @precoKiloProduto = 29.00, @codCategoriaProduto = 4;

SELECT * FROM tbProduto

--C:
CREATE PROCEDURE spCadastrarCliente (
    @nomeCliente VARCHAR(50)
    ,@dataNascCliente DATE
    ,@ruaCliente VARCHAR(50)
    ,@numCasaCliente INT
    ,@cepCliente CHAR(10)
    ,@bairroCliente VARCHAR(50)
    ,@cidadeCliente VARCHAR(20)
    ,@estadoCliente VARCHAR(20)
    ,@cpfCliente CHAR(14)
    ,@sexoCliente CHAR(10)
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tbCliente WHERE cpfCliente = @cpfCliente)
    BEGIN
        IF (@bairroCliente = 'Itaquera' OR @bairroCliente = 'Guaianases')
        BEGIN
            INSERT INTO tbCliente (nomeCliente, dataNascCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
            VALUES (@nomeCliente, @dataNascCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)
            PRINT 'Cliente cadastrado com sucesso.'
        END
        ELSE
        BEGIN
            PRINT 'Não foi possível cadastrar o cliente, pois o bairro não é atendido pela confeitaria.'
        END
    END
    ELSE
    BEGIN
        PRINT 'Cliente já cadastrado.'
    END
END

--teste 
    EXEC spCadastrarCliente 
    @nomeCliente = 'Carlos Alberto'
    ,@dataNascCliente = '1988-03-15'
    ,@ruaCliente = 'Rua das Flores'
    ,@numCasaCliente = 123
    ,@cepCliente = '08.765-432'
    ,@bairroCliente = 'Itaquera'
    ,@cidadeCliente = 'São Paulo'
    ,@estadoCliente = 'SP'
    ,@cpfCliente = '123.456.789-00'
    ,@sexoCliente = 'M'

--TESTE ERRADO
    EXEC spCadastrarCliente 
    @nomeCliente = 'Jeoón barsil'
    ,@dataNascCliente = '1888-09-20'
    ,@ruaCliente = 'Rua das folhas'
    ,@numCasaCliente = 090
    ,@cepCliente = '08.340-300'
    ,@bairroCliente = 'Tubarão'
    ,@cidadeCliente = 'Santa Catarina'
    ,@estadoCliente = 'SC'
    ,@cpfCliente = '000.000.000-00'
    ,@sexoCliente = 'M'

	--inserindo
    EXEC spCadastrarCliente 
    @nomeCliente = 'Samira Fatah'
    ,@dataNascCliente = '1990-05-05'
    ,@ruaCliente = 'Rua Aguapeí'
    ,@numCasaCliente = 1000
    ,@cepCliente = '08.090-000'
    ,@bairroCliente = 'Guaianases'
    ,@cidadeCliente = 'São Paulo'
    ,@estadoCliente = 'SP'
    ,@cpfCliente = '454.672.798-90'
    ,@sexoCliente = 'F'

    EXEC spCadastrarCliente 
    @nomeCliente = 'Celia Nogueira'
    ,@dataNascCliente = '1992-06-06'
    ,@ruaCliente = 'Rua Andes'
    ,@numCasaCliente = 234
    ,@cepCliente = '08.456-090'
    ,@bairroCliente = 'Guaianases'
    ,@cidadeCliente = 'São Paulo'
    ,@estadoCliente = 'SP'
    ,@cpfCliente = '234.564.708-98'
    ,@sexoCliente = 'F'

    EXEC spCadastrarCliente 
    @nomeCliente = 'Paulo Cesar Siqueira'
    ,@dataNascCliente = '1984-04-04'
    ,@ruaCliente = 'Rua Castelo do Piauí'
    ,@numCasaCliente = 232
    ,@cepCliente = '08.109-000'
    ,@bairroCliente = 'Itaquera'
    ,@cidadeCliente = 'São Paulo'
    ,@estadoCliente = 'SP'
    ,@cpfCliente = '131.131.131-13'
    ,@sexoCliente = 'M'

    EXEC spCadastrarCliente 
    @nomeCliente = 'Rodrigo Favaroni'
    ,@dataNascCliente = '1992-04-09'
    ,@ruaCliente = 'Rua Sansão Castelo Branco'
    ,@numCasaCliente = 10
    ,@cepCliente = '08.431-090'
    ,@bairroCliente = 'Guaianases'
    ,@cidadeCliente = 'São Paulo'
    ,@estadoCliente = 'SP'
    ,@cpfCliente = '000.234.567-00'
    ,@sexoCliente = 'M'

    EXEC spCadastrarCliente 
    @nomeCliente = 'Flávia Regina Moro'
    ,@dataNascCliente = '1992-04-22'
    ,@ruaCliente = 'Rua Mariano Moro'
    ,@numCasaCliente = 300
    ,@cepCliente = '08.200-123'
    ,@bairroCliente = 'Itaquera'
    ,@cidadeCliente = 'São Paulo'
    ,@estadoCliente = 'SP'
    ,@cpfCliente = '333.456.098-09'
    ,@sexoCliente = 'F'

	SELECT * FROM tbCliente

--D: 
CREATE PROCEDURE spCadastrarEncomenda (
    @dataEncomenda DATE
    ,@codCliente INT
    ,@valorTotalEncomenda MONEY
    ,@dataEntregaEncomenda DATE
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tbCliente WHERE codCliente = @codCliente)
    BEGIN
        PRINT 'Não foi possível efetivar a encomenda, pois o cliente não está cadastrado.'
        RETURN
    END
    
    DECLARE @encomendaMsg VARCHAR(100)
    INSERT INTO tbEncomenda (dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
    VALUES (@dataEncomenda, @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda)
    
    SET @encomendaMsg = 'Encomenda ' + CAST(SCOPE_IDENTITY() AS VARCHAR) + ' para o cliente ' + (SELECT nomeCliente FROM tbCliente WHERE codCliente = @codCliente) + ' efetuada com sucesso.'
    PRINT @encomendaMsg
END


--inserindo
EXEC spCadastrarEncomenda 
    @dataEncomenda = '2015-10-05'
    ,@codCliente = 4
    ,@valorTotalEncomenda = 150.00
    ,@dataEntregaEncomenda = '2015-10-12'

EXEC spCadastrarEncomenda 
    @dataEncomenda = '2015-08-08'
    ,@codCliente = 1
    ,@valorTotalEncomenda = 450.00
    ,@dataEntregaEncomenda = '2015-08-15'

EXEC spCadastrarEncomenda 
    @dataEncomenda = '2015-10-10'
    ,@codCliente = 2
    ,@valorTotalEncomenda = 200.00
    ,@dataEntregaEncomenda = '2015-10-15'

EXEC spCadastrarEncomenda 
    @dataEncomenda = '2015-10-10'
    ,@codCliente = 3
    ,@valorTotalEncomenda = 150.00
    ,@dataEntregaEncomenda = '2015-12-10'

EXEC spCadastrarEncomenda 
    @dataEncomenda = '2015-06-10'
    ,@codCliente = 1
    ,@valorTotalEncomenda = 250.00
    ,@dataEntregaEncomenda = '2015-12-10'

	SELECT * FROM tbEncomenda

--E
CREATE PROCEDURE spInserirItensEncomenda (
    @codEncomenda INT
    ,@codProduto INT
    ,@quantidadeKilos DECIMAL(10, 2)
    ,@subTotal SMALLINT
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tbEncomenda WHERE codEncomenda = @codEncomenda)
    BEGIN
        PRINT 'Não foi possível inserir os itens da encomenda, pois a encomenda não existe.'
        RETURN
    END
    
    INSERT INTO tbItensEncomenda (codEncomenda, codProduto, quantidadeKilos, subTotal)
    VALUES (@codEncomenda, @codProduto, @quantidadeKilos, @subTotal)
    
    PRINT 'Itens da encomenda inseridos com sucesso.'
END

--inserindo
	EXEC spInserirItensEncomenda 
    @codEncomenda = 1
    ,@codProduto = 3
    ,@quantidadeKilos = 2.5
    ,@subTotal = 105.00

    EXEC spInserirItensEncomenda 
	@codEncomenda = 1
    ,@codProduto = 10
    ,@quantidadeKilos = 2.6
    ,@subTotal = 70.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 1
    ,@codProduto = 9
    ,@quantidadeKilos = 6
    ,@subTotal = 150.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 1
    ,@codProduto = 12
    ,@quantidadeKilos = 4.3
    ,@subTotal = 125.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 2
    ,@codProduto = 9
    ,@quantidadeKilos = 8
    ,@subTotal = 200.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 3
    ,@codProduto = 11
    ,@quantidadeKilos = 3.2
    ,@subTotal = 100.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 3
    ,@codProduto = 9
    ,@quantidadeKilos = 2
    ,@subTotal = 150.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 4
    ,@codProduto = 2
    ,@quantidadeKilos = 3.5
    ,@subTotal = 150.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 4
    ,@codProduto = 3
    ,@quantidadeKilos = 2.2
    ,@subTotal = 100.00

	EXEC spInserirItensEncomenda 
	@codEncomenda = 5
    ,@codProduto = 6
    ,@quantidadeKilos = 3.4
    ,@subTotal = 150.00

SELECT * FROM tbItensEncomenda

--f
CREATE PROCEDURE spAtualizarPrecosProdutos
AS
BEGIN
    -- Aumenta o preço dos produtos da categoria "Bolo festa" em 10%
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.10
    WHERE codCategoriaProduto = 1;

    -- Aplica desconto de 20% nos produtos da categoria "Bolo simples"
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 0.80
    WHERE codCategoriaProduto = 2;

    -- Aumenta o preço dos produtos da categoria "Torta" em 25%
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.25
    WHERE codCategoriaProduto = 3;

    -- Aumenta o preço dos produtos da categoria "Salgado" (exceto esfiha de carne) em 20%
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.20
    WHERE codCategoriaProduto = 4 AND codProduto != 10;
END

--atualizando
EXEC spAtualizarPrecosProdutos;

SELECT * FROM tbProduto

--G
CREATE PROCEDURE spExcluirClientePorCPF (
    @cpfCliente CHAR(14)
)
AS
BEGIN
    DECLARE @nomeCliente VARCHAR(50);
    
    SELECT @nomeCliente = nomeCliente FROM tbCliente WHERE cpfCliente = @cpfCliente;
    
    IF EXISTS (SELECT 1 FROM tbEncomenda WHERE codCliente = (SELECT codCliente FROM tbCliente WHERE cpfCliente = @cpfCliente))
    BEGIN
        PRINT 'Impossível remover esse cliente pois o cliente ' + @nomeCliente + ' possui encomendas.';
    END
    ELSE
    BEGIN
        DELETE FROM tbCliente WHERE cpfCliente = @cpfCliente;
        PRINT 'Cliente ' + @nomeCliente + ' removido com sucesso.';
    END
END

--excluindo
 EXEC spExcluirClientePorCPF @cpfCliente = '454.672.798-90'; --samira

 SELECT * FROM tbCliente

 --H

 CREATE PROCEDURE spExcluirEncomenda (
    @codEncomenda INT
    ,@codProduto INT
)
AS
BEGIN
    DECLARE @valorItem MONEY;

    SELECT @valorItem = precoKiloProduto * quantidadeKilos
    FROM tbItensEncomenda
    JOIN tbProduto ON tbItensEncomenda.codProduto = tbProduto.codProduto
    WHERE tbItensEncomenda.codEncomenda = @codEncomenda AND tbItensEncomenda.codProduto = @codProduto;

    DELETE FROM tbItensEncomenda WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto;

    UPDATE tbEncomenda
    SET valorTotalEncomenda = valorTotalEncomenda - @valorItem
    WHERE codEncomenda = @codEncomenda;
END

--excluindo
EXEC spExcluirEncomenda @codEncomenda = 1, @codProduto = 2;


SELECT * FROM tbItensEncomenda

--I

CREATE PROCEDURE spExcluirEncomendaPorCPFData (
    @cpfCliente CHAR(14)
    ,@dataEntrega DATE
)
AS
BEGIN
    DECLARE @codigoCliente INT, @codigoEncomenda INT;

    SELECT @codigoCliente = codCliente FROM tbCliente WHERE cpfCliente = @cpfCliente;

    IF NOT EXISTS (SELECT 1 FROM tbEncomenda WHERE codCliente = @codigoCliente AND dataEntregaEncomenda = @dataEntrega)
    BEGIN
        PRINT 'Não existe encomenda para o cliente informado na data de entrega fornecida.';
        RETURN;
    END

    SELECT @codigoEncomenda = codEncomenda FROM tbEncomenda WHERE codCliente = @codigoCliente AND dataEntregaEncomenda = @dataEntrega;

    DELETE FROM tbItensEncomenda WHERE codEncomenda = @codigoEncomenda;
    DELETE FROM tbEncomenda WHERE codEncomenda = @codigoEncomenda;

    PRINT 'Encomenda do cliente ' + @cpfCliente + ' na data ' + CONVERT(VARCHAR, @dataEntrega, 103) + ' removida com sucesso.';
END


EXEC spExcluirEncomendaPorCPFData @cpfCliente = '454.672.798-90', @dataEntrega = '2015-08-08'; --samira

SELECT * FROM tbEncomenda

--J

CREATE PROCEDURE spListarEncomendasItensPorData (
    @dataEntrega DATE
)
AS
BEGIN
    SELECT 
        tbEncomenda.codEncomenda
        ,tbCliente.nomeCliente
        ,tbProduto.nomeProduto
        ,tbItensEncomenda.quantidadeKilos
    FROM tbEncomenda
    JOIN tbCliente ON tbEncomenda.codCliente = tbCliente.codCliente
    JOIN tbItensEncomenda ON tbEncomenda.codEncomenda = tbItensEncomenda.codEncomenda
    JOIN tbProduto ON tbItensEncomenda.codProduto = tbProduto.codProduto
    WHERE tbEncomenda.dataEntregaEncomenda = @dataEntrega;
END

EXEC spListarEncomendasItensPorData @dataEntrega = '2015-10-10'; --encomenda Celia cod2

SELECT * FROM tbEncomenda

