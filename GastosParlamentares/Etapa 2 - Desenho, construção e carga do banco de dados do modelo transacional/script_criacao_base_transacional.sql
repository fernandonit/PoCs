
CREATE TABLE senado_transacional.senado_cad_grupo_despesas (
                cod_grupo_despesa INTEGER NOT NULL,
                grupo_despesa VARCHAR NOT NULL,
                CONSTRAINT pk_cod_grupo_despesa PRIMARY KEY (cod_grupo_despesa)
);
COMMENT ON TABLE senado_transacional.senado_cad_grupo_despesas IS 'Tabela que armazena dados sobre os grupos de despesas.';


CREATE TABLE senado_transacional.senado_cad_tipo_despesas (
                cod_tipo_despesa INTEGER NOT NULL,
                cod_grupo_despesa INTEGER NOT NULL,
                despesa_descricao VARCHAR NOT NULL,
                CONSTRAINT pk_senado_cad_tipo_despesas PRIMARY KEY (cod_tipo_despesa)
);
COMMENT ON TABLE senado_transacional.senado_cad_tipo_despesas IS 'Tabela que armazena dados sobre os tipos de despesas relacionados as atividades dos senadores.';


CREATE TABLE senado_transacional.senado_cad_func_categoria (
                cod_func_categoria INTEGER NOT NULL,
                cod_tipo_despesa INTEGER NOT NULL,
                func_categoria VARCHAR NOT NULL,
                CONSTRAINT pk_cod_func_categoria PRIMARY KEY (cod_func_categoria)
);
COMMENT ON TABLE senado_transacional.senado_cad_func_categoria IS 'Tabela que armazena dados sobre as categorias de funcionários. A categoria tem relação com a remuneração e despesas diversas.';


CREATE TABLE senado_transacional.senado_cad_senadores (
                cod_senador INTEGER NOT NULL,
                nome_senador VARCHAR NOT NULL,
                situacao VARCHAR NOT NULL,
                partido VARCHAR,
                uf VARCHAR(2) NOT NULL,
                mandato VARCHAR,
                titularidade VARCHAR,
                telefone VARCHAR,
                data_nascimento DATE,
                email VARCHAR,
                chefe_gabinete VARCHAR,
                endereco VARCHAR,
                auxilio_moradia VARCHAR,
                CONSTRAINT pk_cod_senador PRIMARY KEY (cod_senador)
);
COMMENT ON TABLE senado_transacional.senado_cad_senadores IS 'Tabela que armazena dados sobre o cadastro de senadores.';
COMMENT ON COLUMN senado_transacional.senado_cad_senadores.uf IS 'Este atributo informa sobre o estado pelo qual o parlamentar foi eleito, não informa sobre o estado de nascimento.';


CREATE TABLE senado_transacional.senado_ceaps (
                cod_documento VARCHAR NOT NULL,
                periodo INTEGER NOT NULL,
                data_documento_sistema DATE NOT NULL,
                cod_senador INTEGER NOT NULL,
                cod_tipo_despesa INTEGER NOT NULL,
                historico VARCHAR NOT NULL,
                valor NUMERIC NOT NULL,
                CONSTRAINT pk_cod_documento PRIMARY KEY (cod_documento)
);
COMMENT ON TABLE senado_transacional.senado_ceaps IS 'Ceaps significa Cota para o Exercício da Atividade Parlamentar dos Senadores. É o sistema usado para ressarcimento de despesas efetuadas pelos senadores no exercício da atividade parlamentar.';


CREATE TABLE senado_transacional.senado_viagens_oficiais (
                cod_viagem_oficial VARCHAR NOT NULL,
                periodo INTEGER NOT NULL,
                data_emissao_bilhete DATE NOT NULL,
                cod_senador INTEGER NOT NULL,
                cod_tipo_despesa INTEGER NOT NULL,
                motivo VARCHAR NOT NULL,
                valor NUMERIC NOT NULL,
                CONSTRAINT pk_cod_viagem_oficial PRIMARY KEY (cod_viagem_oficial)
);
COMMENT ON TABLE senado_transacional.senado_viagens_oficiais IS 'Tabela que armazena dados sobre os gastos com as viagens oficiais. Estes gastos não tem relação com as viagens de deslocamento entre o estado de origem do senador e Brasília.';


CREATE TABLE senado_transacional.senado_gasolina (
                cod_registro_combustivel VARCHAR NOT NULL,
                periodo INTEGER NOT NULL,
                data DATE NOT NULL,
                cod_senador INTEGER NOT NULL,
                cod_tipo_despesa INTEGER NOT NULL,
                veiculo VARCHAR,
                valor NUMERIC NOT NULL,
                CONSTRAINT pk_cod_registro_combustivel PRIMARY KEY (cod_registro_combustivel)
);
COMMENT ON TABLE senado_transacional.senado_gasolina IS 'Tabela que armazena dados sobre os gastos dos senadores com combustíveis.';


CREATE TABLE senado_transacional.senado_cad_func_cargos (
                cod_func_cargo INTEGER NOT NULL,
                func_cargo VARCHAR NOT NULL,
                CONSTRAINT pk_cod_func_cargo PRIMARY KEY (cod_func_cargo)
);
COMMENT ON TABLE senado_transacional.senado_cad_func_cargos IS 'Tabela que armazena dados sobre os tipos de cargos dos funcionários que trabalham para os senadores.';


CREATE TABLE senado_transacional.senado_cad_func_local_exercicio (
                cod_local_exercicio INTEGER NOT NULL,
                local_exercicio VARCHAR NOT NULL,
                CONSTRAINT pk_cod_local_exercicio PRIMARY KEY (cod_local_exercicio)
);
COMMENT ON TABLE senado_transacional.senado_cad_func_local_exercicio IS 'Tabela que armazena dados sobre os locais onde são exercidas as atividades dos funcionários que trabalham para os senadores.';


CREATE TABLE senado_transacional.senado_cad_folha (
                cod_tipo_folha INTEGER NOT NULL,
                tipo_folha VARCHAR NOT NULL,
                CONSTRAINT pk_cod_tipo_folha PRIMARY KEY (cod_tipo_folha)
);
COMMENT ON TABLE senado_transacional.senado_cad_folha IS 'Tabela que armazena dados sobre o tipo de folha de pagamento.';


CREATE TABLE senado_transacional.senado_remuneracao (
                cod_pagto VARCHAR NOT NULL,
                periodo INTEGER NOT NULL,
                data_pgto DATE NOT NULL,
                cod_tipo_despesa INTEGER NOT NULL,
                cod_func_categoria INTEGER NOT NULL,
                cod_func_cargo INTEGER,
                cod_senador INTEGER NOT NULL,
                cod_local_exercicio INTEGER NOT NULL,
                cod_tipo_folha INTEGER NOT NULL,
                vb_remuneracao_basica NUMERIC,
                vb_vantagens_pessoais NUMERIC,
                vb_funcao_comissionada NUMERIC,
                vb_gratificacao_natalina NUMERIC,
                vb_horas_extras NUMERIC,
                vb_outras_eventuais NUMERIC,
                vb_abono_permanencia NUMERIC,
                vb_diarias NUMERIC,
                vb_auxilios NUMERIC,
                vb_vantagens_indenizatorias VARCHAR,
                d_reversao_teto_constitucional NUMERIC,
                d_imposto_renda NUMERIC,
                d_previdencia NUMERIC,
                d_faltas NUMERIC,
                bruto NUMERIC NOT NULL,
                descontos NUMERIC NOT NULL,
                liquido NUMERIC NOT NULL,
                CONSTRAINT pk_cod_remuneracao PRIMARY KEY (cod_pagto)
);
COMMENT ON TABLE senado_transacional.senado_remuneracao IS 'Tabela que armazena dados sobre a remuneração de senadores, funcionários do senado e comissionados.';
COMMENT ON COLUMN senado_transacional.senado_remuneracao.bruto IS 'Atributo cujo o valor é o somatório dos campos abaixo, todos com "vb"(valor bruto) na frente

vb_remuneracao_basica
vb_vantagens_pessoais
vb_funcao_comissionada
vb_gratificacao_natalina
vb_horas_extras
vb_outras_eventuais
vb_abono_permanencia
vb_diarias
vb_auxilios
vb_vantagens_indenizatorias';
COMMENT ON COLUMN senado_transacional.senado_remuneracao.descontos IS 'Atributo cujo o valor é o somatório dos campos abaixo, todos com "d"(desconto) na frente:

d_reversao_teto_constitucional
d_imposto_renda
d_previdencia
d_faltas';
COMMENT ON COLUMN senado_transacional.senado_remuneracao.liquido IS 'Atributo cujo o valor é a diferença entre o valor bruto e os descontos.';


ALTER TABLE senado_transacional.senado_cad_tipo_despesas ADD CONSTRAINT senado_cad_grupo_despesas_senado_cad_tipo_despesas_fk
FOREIGN KEY (cod_grupo_despesa)
REFERENCES senado_transacional.senado_cad_grupo_despesas (cod_grupo_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_remuneracao ADD CONSTRAINT senado_cad_tipo_despesas_senado_remuneracao_fk
FOREIGN KEY (cod_tipo_despesa)
REFERENCES senado_transacional.senado_cad_tipo_despesas (cod_tipo_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_cad_func_categoria ADD CONSTRAINT senado_cad_tipo_despesas_senado_cad_func_categoria_fk
FOREIGN KEY (cod_tipo_despesa)
REFERENCES senado_transacional.senado_cad_tipo_despesas (cod_tipo_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_gasolina ADD CONSTRAINT senado_cad_tipo_despesas_senado_gasolina_fk
FOREIGN KEY (cod_tipo_despesa)
REFERENCES senado_transacional.senado_cad_tipo_despesas (cod_tipo_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_viagens_oficiais ADD CONSTRAINT senado_cad_tipo_despesas_senado_viagens_oficiais_fk
FOREIGN KEY (cod_tipo_despesa)
REFERENCES senado_transacional.senado_cad_tipo_despesas (cod_tipo_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_ceaps ADD CONSTRAINT senado_cad_tipo_despesas_senado_ceaps_fk
FOREIGN KEY (cod_tipo_despesa)
REFERENCES senado_transacional.senado_cad_tipo_despesas (cod_tipo_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_remuneracao ADD CONSTRAINT senado_cad_func_categoria_senado_remuneracao_fk
FOREIGN KEY (cod_func_categoria)
REFERENCES senado_transacional.senado_cad_func_categoria (cod_func_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_remuneracao ADD CONSTRAINT senado_cad_senadores_senado_remuneracao_fk
FOREIGN KEY (cod_senador)
REFERENCES senado_transacional.senado_cad_senadores (cod_senador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_gasolina ADD CONSTRAINT senado_cad_senadores_senado_gasolina_fk
FOREIGN KEY (cod_senador)
REFERENCES senado_transacional.senado_cad_senadores (cod_senador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_viagens_oficiais ADD CONSTRAINT senado_cad_senadores_senado_viagens_oficiais_fk
FOREIGN KEY (cod_senador)
REFERENCES senado_transacional.senado_cad_senadores (cod_senador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_ceaps ADD CONSTRAINT senado_cad_senadores_senado_ceaps_fk
FOREIGN KEY (cod_senador)
REFERENCES senado_transacional.senado_cad_senadores (cod_senador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_remuneracao ADD CONSTRAINT senado_cad_func_cargos_senado_remuneracao_fk
FOREIGN KEY (cod_func_cargo)
REFERENCES senado_transacional.senado_cad_func_cargos (cod_func_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_remuneracao ADD CONSTRAINT senado_cad_func_local_exercicio_senado_remuneracao_fk
FOREIGN KEY (cod_local_exercicio)
REFERENCES senado_transacional.senado_cad_func_local_exercicio (cod_local_exercicio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_transacional.senado_remuneracao ADD CONSTRAINT senado_cad_folha_senado_remuneracao_fk
FOREIGN KEY (cod_tipo_folha)
REFERENCES senado_transacional.senado_cad_folha (cod_tipo_folha)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
