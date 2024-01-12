-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bdrestaurantes
CREATE DATABASE IF NOT EXISTS `bdrestaurantes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bdrestaurantes`;

-- Copiando estrutura para tabela bdrestaurantes.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id_Categoria` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bdrestaurantes.categoria: ~12 rows (aproximadamente)
INSERT INTO `categoria` (`Id_Categoria`, `Nome`) VALUES
	(1, 'Italiana'),
	(2, 'Chinesa'),
	(3, 'Mexicana'),
	(4, 'Indiana'),
	(5, 'Vegetariana'),
	(6, 'Fast Food'),
	(7, 'Frutos do Mar'),
	(8, 'Sobremesas'),
	(9, 'Brasileira'),
	(10, 'Japonesa'),
	(11, 'Árabe'),
	(12, 'Bebidas');

-- Copiando estrutura para tabela bdrestaurantes.pratos
CREATE TABLE IF NOT EXISTS `pratos` (
  `Id_Pratos` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Restaurante` int(11) DEFAULT NULL,
  `Nome_Prato` varchar(50) DEFAULT NULL,
  `Id_Tipo_Prato` int(11) DEFAULT NULL,
  `Descrição` varchar(50) DEFAULT NULL,
  `Valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Pratos`),
  KEY `Id_Tipo_Prato` (`Id_Tipo_Prato`),
  KEY `fk_Id_Restaurante` (`Id_Restaurante`),
  CONSTRAINT `fk_Id_Restaurante` FOREIGN KEY (`Id_Restaurante`) REFERENCES `restaurantes` (`CNPJ`) ON DELETE CASCADE,
  CONSTRAINT `pratos_ibfk_1` FOREIGN KEY (`Id_Restaurante`) REFERENCES `restaurantes` (`CNPJ`),
  CONSTRAINT `pratos_ibfk_2` FOREIGN KEY (`Id_Tipo_Prato`) REFERENCES `tipo_prato` (`Id_Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bdrestaurantes.pratos: ~66 rows (aproximadamente)
INSERT INTO `pratos` (`Id_Pratos`, `Id_Restaurante`, `Nome_Prato`, `Id_Tipo_Prato`, `Descrição`, `Valor`) VALUES
	(1, 123456789, 'Spaghetti Carbonara', 1, 'Massa com molho carbonara', 15.99),
	(2, 123456789, 'Fettuccine Alfredo', 1, 'Massa com molho Alfredo', 14.50),
	(3, 234567890, 'Kung Pao Chicken', 6, 'Frango com molho Kung Pao', 12.99),
	(4, 234567890, 'Mapo Tofu', 2, 'Tofu apimentado', 10.50),
	(5, 345678901, 'Tacos al Pastor', 3, 'Tacos com carne de porco marinada', 9.99),
	(6, 345678901, 'Enchiladas Verdes', 5, 'Tortillas com molho verde e queijo', 11.50),
	(7, 456789012, 'Chicken Tikka Masala', 4, 'Frango em molho curry', 13.99),
	(8, 456789012, 'Vegetable Biryani', 9, 'Arroz temperado com vegetais', 12.50),
	(9, 567890123, 'Mediterranean Salad', 5, 'Salada com azeitonas e queijo feta', 8.99),
	(10, 567890123, 'Beyond Burger', 6, 'Hambúrguer vegetariano', 11.50),
	(11, 678901234, 'Double Cheeseburger', 6, 'Hambúrguer duplo com queijo', 9.99),
	(12, 678901234, 'Chicken Nuggets', 6, 'Porção de nuggets de frango', 7.50),
	(13, 789012345, 'Grilled Shrimp', 7, 'Camarões grelhados', 16.99),
	(14, 789012345, 'Seafood Paella', 7, 'Paella de frutos do mar', 18.50),
	(15, 890123456, 'Chocolate Cake', 8, 'Bolo de chocolate', 6.99),
	(16, 890123456, 'Tiramisu', 8, 'Sobremesa italiana', 8.50),
	(17, 901234567, 'Feijoada', 9, 'Feijoada brasileira tradicional', 14.99),
	(18, 901234567, 'Pão de Queijo', 9, 'Petisco mineiro', 5.50),
	(19, 123450987, 'Sashimi Platter', 10, 'Variedade de sashimis', 20.99),
	(20, 123450987, 'California Roll', 10, 'Sushi roll com abacate', 16.50),
	(21, 234509876, 'Hummus with Pita', 11, 'Pasta de grão-de-bico com pão árabe', 8.99),
	(22, 234509876, 'Shawarma Plate', 11, 'Prato árabe com carne grelhada', 12.50),
	(23, 345098765, 'Detox Juice', 12, 'Suco detox refrescante', 5.99),
	(24, 345098765, 'Berry Smoothie', 12, 'Smoothie de frutas vermelhas', 6.50),
	(25, 123456789, 'Lasagna', 1, 'Camadas de massa com molho de tomate e queijo', 13.99),
	(26, 123456789, 'Ravioli di Ricotta', 1, 'Ravioli recheado com ricota', 14.50),
	(27, 234567890, 'Sweet and Sour Chicken', 6, 'Frango agridoce', 11.99),
	(28, 234567890, 'Hot and Sour Soup', 2, 'Sopa picante e azeda', 9.50),
	(29, 345678901, 'Quesadillas', 5, 'Tortillas com queijo e recheio', 10.99),
	(30, 345678901, 'Burritos', 5, 'Tortilla enrolada com carne e feijão', 11.50),
	(31, 456789012, 'Lamb Vindaloo', 4, 'Cordeiro em molho picante', 15.99),
	(32, 456789012, 'Naan Bread', 4, 'Pão indiano assado', 8.50),
	(33, 567890123, 'Greek Salad', 5, 'Salada grega com pepino e queijo feta', 9.99),
	(34, 567890123, 'Vegan Pizza', 5, 'Pizza vegetariana', 12.50),
	(35, 678901234, 'Crispy Chicken Sandwich', 6, 'Sanduíche de frango crocante', 9.99),
	(36, 678901234, 'French Fries', 6, 'Batatas fritas', 4.50),
	(37, 789012345, 'Grilled Octopus', 7, 'Polvo grelhado', 17.99),
	(38, 789012345, 'Crab Cakes', 7, 'Bolinhos de caranguejo', 16.50),
	(39, 890123456, 'Cheesecake', 8, 'Cheesecake tradicional', 7.99),
	(40, 890123456, 'Ice Cream Sundae', 8, 'Sorvete com cobertura e chantilly', 8.50),
	(41, 901234567, 'Moqueca', 9, 'Moqueca de peixe', 16.99),
	(42, 901234567, 'Coxinha', 9, 'Salgado brasileiro', 5.50),
	(43, 123450987, 'Rainbow Roll', 10, 'Sushi roll colorido', 18.99),
	(44, 123450987, 'Sake Nigiri', 10, 'Nigiri de salmão', 14.50),
	(45, 234509876, 'Baba Ganoush', 11, 'Pasta de berinjela', 8.99),
	(46, 234509876, 'Falafel Plate', 11, 'Prato árabe com bolinhos de grão-de-bico', 12.50),
	(47, 345098765, 'Mango Tango Smoothie', 12, 'Smoothie de manga', 6.99),
	(48, 345098765, 'Green Detox Juice', 12, 'Suco detox verde', 7.50),
	(49, 123456789, 'Pesto Pasta', 1, 'Massa com molho pesto', 13.99),
	(50, 123456789, 'Cannelloni', 1, 'Massa recheada com carne e queijo', 14.50),
	(51, 234567890, 'General Tso\'s Chicken', 6, 'Frango picante ao estilo chinês', 11.99),
	(52, 234567890, 'Egg Drop Soup', 2, 'Sopa de ovo chinesa', 9.50),
	(53, 345678901, 'Tamales', 5, 'Prato mexicano com massa de milho', 10.99),
	(54, 345678901, 'Chiles Rellenos', 5, 'Pimentões recheados', 11.50),
	(55, 456789012, 'Paneer Tikka', 4, 'Queijo indiano grelhado', 15.99),
	(56, 456789012, 'Samosa', 4, 'Salgado indiano', 8.50),
	(57, 567890123, 'Caprese Salad', 5, 'Salada com tomate e mozarela', 9.99),
	(58, 567890123, 'Temaki', 5, 'Cone de sushi enrolado', 12.50),
	(59, 678901234, 'BBQ Ribs', 6, 'Costelas ao molho barbecue', 18.99),
	(60, 678901234, 'Onion Rings', 6, 'Anéis de cebola empanados', 6.50),
	(61, 123456789, 'Spaghetti Carbonara', 1, 'Massa com molho carbonara', 15.99),
	(62, 123456789, 'salada defruta', 1, 'Massa com molho carbonara', 15.99),
	(63, 123450987, 'Peixe frito', 7, 'Peixe Frito no Alho Acebolado', 8.00),
	(64, 234567890, 'Peixe Gato', 1, 'Um peixe em formato de gato', 9.99),
	(65, 123450987, 'Bolinho de Arroz', 1, 'Arroz amassado com condimentos', 5.25),
	(66, 777999444, 'Carne de Cabra', 9, 'Carne de Cabra com molhos', 14.45);

-- Copiando estrutura para tabela bdrestaurantes.restaurantes
CREATE TABLE IF NOT EXISTS `restaurantes` (
  `CNPJ` int(11) NOT NULL,
  `Nome_Restaurante` varchar(50) DEFAULT NULL,
  `Id_Categoria_Rest` int(11) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Avaliação` int(11) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`),
  KEY `Id_Categoria_Rest` (`Id_Categoria_Rest`),
  CONSTRAINT `restaurantes_ibfk_1` FOREIGN KEY (`Id_Categoria_Rest`) REFERENCES `categoria` (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bdrestaurantes.restaurantes: ~21 rows (aproximadamente)
INSERT INTO `restaurantes` (`CNPJ`, `Nome_Restaurante`, `Id_Categoria_Rest`, `Endereco`, `Cidade`, `Estado`, `Avaliação`) VALUES
	(123450987, 'Sushi Master', 10, 'Avenida do Sushi, 777', 'Belém', 'PA', 5),
	(123456789, 'Pasta Express', 1, 'Rua das Massas, 123', 'São Paulo', 'SP', 4),
	(210987654, 'Sweets & Treats', 8, 'Rua das Guloseimas, 444', 'Manaus', 'AM', 4),
	(234509876, 'Arabian Nights', 11, 'Rua das Especiarias, 333', 'Goiânia', 'GO', 4),
	(234567890, 'China Garden', 2, 'Avenida dos Sabores, 456', 'Rio de Janeiro', 'RJ', 5),
	(321098765, 'Seafood Cove', 7, 'Avenida dos Frutos do Mar, 333', 'Fortaleza', 'CE', 5),
	(345098765, 'Juice Bar', 12, 'Avenida das Bebidas, 999', 'Florianópolis', 'SC', 4),
	(345678901, 'MexiCanto', 3, 'Travessa das Tortillas, 789', 'Brasília', 'DF', 4),
	(432109876, 'Burger Haven', 6, 'Rua dos Hambúrgueres, 222', 'Porto Alegre', 'RS', 4),
	(456789012, 'Taj Mahal', 4, 'Praça dos Temperos, 321', 'Salvador', 'BA', 2),
	(543210987, 'Veggie Delight', 5, 'Avenida Vegana, 111', 'Curitiba', 'PR', 4),
	(567890123, 'Green Leaf', 5, 'Avenida Vegana, 654', 'Curitiba', 'PR', 4),
	(654321098, 'El Mariachi', 3, 'Rua das Maracas, 999', 'Salvador', 'BA', 5),
	(678901234, 'Burger Rush', 6, 'Rua do Fast, 987', 'Porto Alegre', 'RS', 4),
	(765432109, 'Dragon Palace', 2, 'Avenida dos Dragões, 888', 'Brasília', 'DF', 4),
	(777999444, 'Salah Hammas', 11, 'Rua KantoKi', 'Jerusalém', 'De Calamidade', 2),
	(789012345, 'Sea Delights', 7, 'Avenida dos Mariscos, 222', 'Fortaleza', 'CE', 2),
	(876543210, 'Mamma Mia Trattoria', 1, 'Rua das Delícias Italianas, 777', 'Rio de Janeiro', 'RJ', 5),
	(890123456, 'Sweet Temptation', 8, 'Rua das Sobremesas, 111', 'Manaus', 'AM', 4),
	(901234567, 'Feijão & Cia', 9, 'Praça da Feijoada, 555', 'Recife', 'PE', 4),
	(987654321, 'Taste of India', 4, 'Avenida das Especiarias, 555', 'São Paulo', 'SP', 4);

-- Copiando estrutura para tabela bdrestaurantes.tipo_prato
CREATE TABLE IF NOT EXISTS `tipo_prato` (
  `Id_Tipo` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bdrestaurantes.tipo_prato: ~12 rows (aproximadamente)
INSERT INTO `tipo_prato` (`Id_Tipo`, `Nome`) VALUES
	(1, 'Massas'),
	(2, 'Sopas'),
	(3, 'Tacos'),
	(4, 'Curries'),
	(5, 'Saladas'),
	(6, 'Hambúrgueres'),
	(7, 'Frutos do Mar'),
	(8, 'Sobremesas'),
	(9, 'Feijoada'),
	(10, 'Sushi'),
	(11, 'Kebab'),
	(12, 'Bebidas');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
