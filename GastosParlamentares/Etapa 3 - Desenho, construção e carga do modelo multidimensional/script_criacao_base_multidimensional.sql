
CREATE SEQUENCE senado_dw.dm_tempo_sk_tempo_seq_1;

CREATE TABLE senado_dw.dm_tempo (
                sk_tempo INTEGER NOT NULL DEFAULT nextval('senado_dw.dm_tempo_sk_tempo_seq_1'),
                nk_tempo DATE NOT NULL,
                ano INTEGER NOT NULL,
                mes INTEGER NOT NULL,
                dia INTEGER NOT NULL,
                CONSTRAINT sk_tempo PRIMARY KEY (sk_tempo)
);


ALTER SEQUENCE senado_dw.dm_tempo_sk_tempo_seq_1 OWNED BY senado_dw.dm_tempo.sk_tempo;

CREATE SEQUENCE senado_dw.dm_func_cargo_sk_cod_func_cargo_seq;

CREATE TABLE senado_dw.dm_func_cargo (
                sk_cod_func_cargo INTEGER NOT NULL DEFAULT nextval('senado_dw.dm_func_cargo_sk_cod_func_cargo_seq'),
                nk_cod_func_cargo INTEGER NOT NULL,
                func_cargo VARCHAR NOT NULL,
                CONSTRAINT sk_cod_func_cargo PRIMARY KEY (sk_cod_func_cargo)
);


ALTER SEQUENCE senado_dw.dm_func_cargo_sk_cod_func_cargo_seq OWNED BY senado_dw.dm_func_cargo.sk_cod_func_cargo;

CREATE SEQUENCE senado_dw.dm_func_categoria_sk_cod_func_categoria_seq;

CREATE TABLE senado_dw.dm_func_categoria (
                sk_cod_func_categoria INTEGER NOT NULL DEFAULT nextval('senado_dw.dm_func_categoria_sk_cod_func_categoria_seq'),
                nk_cod_func_categoria INTEGER NOT NULL,
                func_categoria VARCHAR NOT NULL,
                CONSTRAINT sk_cod_func_categoria PRIMARY KEY (sk_cod_func_categoria)
);


ALTER SEQUENCE senado_dw.dm_func_categoria_sk_cod_func_categoria_seq OWNED BY senado_dw.dm_func_categoria.sk_cod_func_categoria;

CREATE SEQUENCE senado_dw.dm_tipo_despesas_sk_cod_tipo_despesas_seq;

CREATE TABLE senado_dw.dm_tipo_despesas (
                sk_cod_tipo_despesas INTEGER NOT NULL DEFAULT nextval('senado_dw.dm_tipo_despesas_sk_cod_tipo_despesas_seq'),
                nk_cod_tipo_despesas INTEGER NOT NULL,
                tipo_despesa VARCHAR NOT NULL,
                CONSTRAINT sk_cod_tipo_despesa PRIMARY KEY (sk_cod_tipo_despesas)
);


ALTER SEQUENCE senado_dw.dm_tipo_despesas_sk_cod_tipo_despesas_seq OWNED BY senado_dw.dm_tipo_despesas.sk_cod_tipo_despesas;

CREATE SEQUENCE senado_dw.dm_grupo_despesas_sk_cod_despesa_seq;

CREATE TABLE senado_dw.dm_grupo_despesas (
                sk_cod_despesa INTEGER NOT NULL DEFAULT nextval('senado_dw.dm_grupo_despesas_sk_cod_despesa_seq'),
                nk_cod_grupo_deepesas INTEGER NOT NULL,
                grupo_despesa VARCHAR NOT NULL,
                CONSTRAINT sk_cod_despesa PRIMARY KEY (sk_cod_despesa)
);


ALTER SEQUENCE senado_dw.dm_grupo_despesas_sk_cod_despesa_seq OWNED BY senado_dw.dm_grupo_despesas.sk_cod_despesa;

CREATE SEQUENCE senado_dw.dm_senadores_sk_cod_senador_seq;

CREATE TABLE senado_dw.dm_senadores (
                sk_cod_senador INTEGER NOT NULL DEFAULT nextval('senado_dw.dm_senadores_sk_cod_senador_seq'),
                nk_cod_senador INTEGER NOT NULL,
                nome_senador VARCHAR NOT NULL,
                situacao VARCHAR NOT NULL,
                partido VARCHAR,
                uf VARCHAR(2) NOT NULL,
                titularidade VARCHAR,
                email VARCHAR,
                telefone VARCHAR,
                CONSTRAINT sk_cod_senador PRIMARY KEY (sk_cod_senador)
);


ALTER SEQUENCE senado_dw.dm_senadores_sk_cod_senador_seq OWNED BY senado_dw.dm_senadores.sk_cod_senador;

CREATE SEQUENCE senado_dw.fato_despesas_senadores_pk_cod_gasto_seq;

CREATE TABLE senado_dw.fato_despesas_senadores (
                pk_cod_gasto INTEGER NOT NULL DEFAULT nextval('senado_dw.fato_despesas_senadores_pk_cod_gasto_seq'),
                sk_cod_senador INTEGER NOT NULL,
                sk_cod_despesa INTEGER NOT NULL,
                sk_cod_tipo_despesas INTEGER NOT NULL,
                sk_cod_func_categoria INTEGER,
                sk_cod_func_cargo INTEGER,
                sk_tempo INTEGER NOT NULL,
                cod_evento VARCHAR NOT NULL,
                historico VARCHAR NOT NULL,
                valor NUMERIC,
                remuneracao_basica NUMERIC,
                CONSTRAINT pk_cod_gasto PRIMARY KEY (pk_cod_gasto)
);
COMMENT ON COLUMN senado_dw.fato_despesas_senadores.cod_evento IS 'Este atributo armazena os códigos de registro das quatro tabelas de despesas do modelo transacional. São elas:
- senado_ceaps
- senado_gasolina
- senado_viagens_oficiais
- senado_remuneracao';
COMMENT ON COLUMN senado_dw.fato_despesas_senadores.valor IS 'Este atributo armazena os valores relacionados ao custo de manutenção das atividades parlamentares dos senadores. Esses valores dizem respeito as seguintes tabelas do modelo transacinal:
- senado_ceaps
- senado_gasolina
- senado_viagens_oficiais
_ senado_remuneracao (valor bruto)';
COMMENT ON COLUMN senado_dw.fato_despesas_senadores.remuneracao_basica IS 'Este atributo armazena a remuneração básica de senadores, funcionários do senado e comissionados. Será utilizado no Power BI para demonstrar o quanto ganham com os adicionais. Este atributo, é claro, só será preenchido quando a despesa é originária da tabela senado_remuneracao do modelo transacional.';


ALTER SEQUENCE senado_dw.fato_despesas_senadores_pk_cod_gasto_seq OWNED BY senado_dw.fato_despesas_senadores.pk_cod_gasto;

ALTER TABLE senado_dw.fato_despesas_senadores ADD CONSTRAINT dm_tempo_fato_despesas_senadores_fk
FOREIGN KEY (sk_tempo)
REFERENCES senado_dw.dm_tempo (sk_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_dw.fato_despesas_senadores ADD CONSTRAINT dm_func_cargo_fato_despesas_senadores_fk
FOREIGN KEY (sk_cod_func_cargo)
REFERENCES senado_dw.dm_func_cargo (sk_cod_func_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_dw.fato_despesas_senadores ADD CONSTRAINT dm_func_categoria_fato_despesas_senadores_fk
FOREIGN KEY (sk_cod_func_categoria)
REFERENCES senado_dw.dm_func_categoria (sk_cod_func_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_dw.fato_despesas_senadores ADD CONSTRAINT dm_tipo_despesas_fato_despesas_senadores_fk
FOREIGN KEY (sk_cod_tipo_despesas)
REFERENCES senado_dw.dm_tipo_despesas (sk_cod_tipo_despesas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_dw.fato_despesas_senadores ADD CONSTRAINT dm_grupo_despesas_fato_despesas_senadores_fk
FOREIGN KEY (sk_cod_despesa)
REFERENCES senado_dw.dm_grupo_despesas (sk_cod_despesa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE senado_dw.fato_despesas_senadores ADD CONSTRAINT dm_senadores_fato_despesas_senadores_fk
FOREIGN KEY (sk_cod_senador)
REFERENCES senado_dw.dm_senadores (sk_cod_senador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
