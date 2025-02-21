CREATE TABLE `Pagamento` (
	`idPagamento` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`IdPedido` INTEGER NOT NULL,
	`Metodo` VARCHAR(255) NOT NULL,
	`ValorPago` DECIMAL NOT NULL,
	`StatusPagamento` VARCHAR(255),
	PRIMARY KEY(`idPagamento`)
);


CREATE TABLE `Cliente` (
	`idCliente` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`Nome` TEXT(65535),
	`Email` VARCHAR(255),
	`Telefone` INTEGER,
	`Tipo` VARCHAR(255),
	`CPF/CNPJ` INTEGER NOT NULL,
	`idPedido` INTEGER,
	PRIMARY KEY(`idCliente`)
);


CREATE TABLE `Pedido_Entrega` (
	`idPedido` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`DataPedido` DATE,
	`Status` TEXT(65535),
	`Endereco_Entrega` VARCHAR(255),
	`idEntrega` INTEGER,
	`idPedido1` INTEGER,
	`StatusEntrega` VARCHAR(255),
	`CodigoRastreio` VARCHAR(255),
	PRIMARY KEY(`idPedido`, `idEntrega`)
);


CREATE TABLE `Pedido_Produto` (
	`idPedido` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`idProduto` INTEGER NOT NULL,
	`Quantidade` TINYINT,
	`ValorUnitario` INTEGER,
	PRIMARY KEY(`idPedido`, `idProduto`)
);


CREATE TABLE `Produto` (
	`idProduto` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`Nome` VARCHAR(255) NOT NULL,
	`Categoria` VARCHAR(255),
	`Descricao` VARCHAR(255),
	`Valor` DECIMAL NOT NULL,
	`idFornecedor` INTEGER NOT NULL,
	PRIMARY KEY(`idProduto`, `idFornecedor`)
);


CREATE TABLE `Fornecedor` (
	`idFornecedor` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`RazaoSocial` VARCHAR(255) NOT NULL,
	`CNPJ` INTEGER NOT NULL,
	`Endereco` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`idFornecedor`)
);


CREATE TABLE `Estoque` (
	`idEstoque` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`idProduto` INTEGER NOT NULL,
	`Quantidade` INTEGER,
	PRIMARY KEY(`idEstoque`, `idProduto`)
);


ALTER TABLE `Pagamento`
ADD FOREIGN KEY(`IdPedido`) REFERENCES `Cliente`(`idPedido`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Pedido_Produto`
ADD FOREIGN KEY(`idPedido`) REFERENCES `Produto`(`idProduto`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Pedido_Produto`
ADD FOREIGN KEY(`idPedido`) REFERENCES `Pedido_Entrega`(`idPedido1`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Produto`
ADD FOREIGN KEY(`idProduto`) REFERENCES `Fornecedor`(`idFornecedor`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Pedido_Produto`
ADD FOREIGN KEY(`idPedido`) REFERENCES `Estoque`(`idEstoque`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Estoque`
ADD FOREIGN KEY(`idEstoque`) REFERENCES `Produto`(`idProduto`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Pedido_Produto`
ADD FOREIGN KEY(`idPedido`) REFERENCES `Cliente`(`idPedido`)
ON UPDATE NO ACTION ON DELETE NO ACTION;