CREATE TABLE cards
(
    id          VARCHAR(255)     NOT NULL,
    local_id    INTEGER,
    name        VARCHAR(255)     NOT NULL,
    image_url   VARCHAR(255),
    illustrator VARCHAR(255),
    rarity      VARCHAR(255)     NOT NULL,
    price       DOUBLE PRECISION NOT NULL,
    category    VARCHAR(255)     NOT NULL,
    set_id      VARCHAR(255)     NOT NULL,
    CONSTRAINT pk_card PRIMARY KEY (id)
);

CREATE TABLE energies
(
    card_id VARCHAR(255) NOT NULL,
    effect  VARCHAR(255) NOT NULL,
    type    VARCHAR(255) NOT NULL,
    CONSTRAINT pk_energy PRIMARY KEY (card_id)
);

CREATE TABLE orders
(
    id         UUID                        NOT NULL,
    order_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    user_id    UUID,
    CONSTRAINT pk_order PRIMARY KEY (id)
);

CREATE TABLE order_items
(
    id       UUID    NOT NULL,
    quantity INTEGER NOT NULL,
    order_id UUID,
    card_id  VARCHAR(255),
    CONSTRAINT pk_orderitem PRIMARY KEY (id)
);

CREATE TABLE pokemons
(
    card_id     VARCHAR(255) NOT NULL,
    dex_id      INTEGER      NOT NULL,
    hp          INTEGER      NOT NULL,
    types       VARCHAR(255),
    stage       VARCHAR(255) NOT NULL,
    description TEXT,
    level       INTEGER      NOT NULL,
    CONSTRAINT pk_pokemon PRIMARY KEY (card_id)
);

CREATE TABLE series
(
    id       VARCHAR(255) NOT NULL,
    name     VARCHAR(255) NOT NULL,
    logo_url VARCHAR(255),
    CONSTRAINT pk_serie PRIMARY KEY (id)
);

CREATE TABLE sets
(
    id           VARCHAR(255)                NOT NULL,
    name         VARCHAR(255)                NOT NULL,
    logo_url     VARCHAR(255),
    release_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    serie_id     VARCHAR(255)                NOT NULL,
    CONSTRAINT pk_set PRIMARY KEY (id)
);

CREATE TABLE trainers
(
    card_id VARCHAR(255) NOT NULL,
    effect  VARCHAR(255) NOT NULL,
    type    VARCHAR(255) NOT NULL,
    CONSTRAINT pk_trainer PRIMARY KEY (card_id)
);

CREATE TABLE users
(
    id            UUID         NOT NULL,
    name          VARCHAR(255) NOT NULL,
    username      VARCHAR(255) NOT NULL,
    email         VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role          VARCHAR(255) NOT NULL,
    address       VARCHAR(255),
    phone_number  VARCHAR(50),
    birth_date    DATE,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

ALTER TABLE users
    ADD CONSTRAINT uc_user_email UNIQUE (email);

ALTER TABLE users
    ADD CONSTRAINT uc_user_username UNIQUE (username);

ALTER TABLE cards
    ADD CONSTRAINT FK_CARD_ON_SET FOREIGN KEY (set_id) REFERENCES sets (id);

ALTER TABLE energies
    ADD CONSTRAINT FK_ENERGY_ON_CARD FOREIGN KEY (card_id) REFERENCES cards (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDERITEM_ON_CARD FOREIGN KEY (card_id) REFERENCES cards (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDERITEM_ON_ORDER FOREIGN KEY (order_id) REFERENCES orders (id);

ALTER TABLE orders
    ADD CONSTRAINT FK_ORDER_ON_USER FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE pokemons
    ADD CONSTRAINT FK_POKEMON_ON_CARD FOREIGN KEY (card_id) REFERENCES cards (id);

ALTER TABLE sets
    ADD CONSTRAINT FK_SET_ON_SERIE FOREIGN KEY (serie_id) REFERENCES series (id);

ALTER TABLE trainers
    ADD CONSTRAINT FK_TRAINER_ON_CARD FOREIGN KEY (card_id) REFERENCES cards (id);
