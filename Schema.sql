create table obra(
  
	id_obra SERIAL PRIMARY KEY,
	codigo_obra VARCHAR(10) NOT NULL, -- ex: '12483D'
	nome_obra VARCHAR(200) NOT NULL, -- nome do contrato
	fator_k NUMERIC(5,4) NOT NULL, -- coeficiente de desconto, ex: 0.76
	bdi NUMERIC(6,4) NOT NULL -- ex: 0.2404
);

create table item(
  
	id_item SERIAL PRIMARY KEY,
	codigo_item VARCHAR(20) NOT NULL, -- ex: '27-01-01-001 O'
	descricao VARCHAR(300) NOT NULL, -- descrição completa do serviço
	unidade VARCHAR(5) NOT NULL, -- UN, H, KM, M, M2, M3...
	preco_unitario NUMERIC(15,2) NOT NULL -- preço de referência SINAPI
);
  
 
 CREATE TABLE item_orcado (
id_orcado SERIAL PRIMARY KEY,
id_obra INTEGER NOT NULL REFERENCES obra(id_obra),
id_item INTEGER NOT NULL REFERENCES item(id_item),
quantidade NUMERIC(15,4) NOT NULL DEFAULT 0,
preco_final NUMERIC(15,2) -- calculado: preco_unitario * fator_k
);
