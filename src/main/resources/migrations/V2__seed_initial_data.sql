-- SQL Seed gerado automaticamente a partir de sample.json
-- Baseado na lógica do JsonDatabaseSeeder.java
-- Gerado em: 2025-10-25T14:35:58.090016
-- CORRIGIDO: Usa nomes de tabelas no plural conforme V1__create_project_entities.sql

-- Limpar dados existentes (ordem correta para respeitar foreign keys)
DELETE
FROM energies;
DELETE
FROM trainers;
DELETE
FROM pokemons;
DELETE
FROM cards;
DELETE
FROM sets;
DELETE
FROM series;

-- Serie: Base
INSERT INTO series (id, name, logo_url)
VALUES ('base', 'Base', 'https://assets.tcgdex.net/en/base/base1/logo');

-- Set: Base Set
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('base1', 'Base Set', 'https://assets.tcgdex.net/en/base/base1/logo', NOW(), 'base');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-1', 1, 'Alakazam', 'https://assets.tcgdex.net/en/base/base1/1', 'Ken Sugimori', 'Rare', 3.39, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-1', 65, 80, 'Psychic', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-2', 2, 'Blastoise', 'https://assets.tcgdex.net/en/base/base1/2', 'Ken Sugimori', 'Rare', 10.12,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-2', 9, 100, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-3', 3, 'Chansey', 'https://assets.tcgdex.net/en/base/base1/3', 'Ken Sugimori', 'Rare', 5.41, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-3', 113, 120, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-4', 4, 'Charizard', 'https://assets.tcgdex.net/en/base/base1/4', 'Mitsuhiro Arita', 'Rare', 3.46,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-4', 6, 120, 'Fire', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-5', 5, 'Clefairy', 'https://assets.tcgdex.net/en/base/base1/5', 'Ken Sugimori', 'Rare', 2.73, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-5', 35, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-6', 6, 'Gyarados', 'https://assets.tcgdex.net/en/base/base1/6', 'Mitsuhiro Arita', 'Rare', 8.09,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-6', 130, 100, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-7', 7, 'Hitmonchan', 'https://assets.tcgdex.net/en/base/base1/7', 'Ken Sugimori', 'Rare', 3.32,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-7', 107, 70, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-8', 8, 'Machamp', 'https://assets.tcgdex.net/en/base/base1/8', 'Ken Sugimori', 'Rare', 4.19, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-8', 68, 100, 'Fighting', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-9', 9, 'Magneton', 'https://assets.tcgdex.net/en/base/base1/9', 'Keiji Kinebuchi', 'Rare', 8.02,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-9', 82, 60, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-10', 10, 'Mewtwo', 'https://assets.tcgdex.net/en/base/base1/10', 'Ken Sugimori', 'Rare', 6.54, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-10', 150, 60, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-11', 11, 'Nidoking', 'https://assets.tcgdex.net/en/base/base1/11', 'Ken Sugimori', 'Rare', 4.21,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-11', 34, 90, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-12', 12, 'Ninetales', 'https://assets.tcgdex.net/en/base/base1/12', 'Ken Sugimori', 'Rare', 7.27,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-12', 38, 80, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-13', 13, 'Poliwrath', 'https://assets.tcgdex.net/en/base/base1/13', 'Ken Sugimori', 'Rare', 4.29,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-13', 62, 90, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-14', 14, 'Raichu', 'https://assets.tcgdex.net/en/base/base1/14', 'Ken Sugimori', 'Rare', 9.81, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-14', 26, 80, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-15', 15, 'Venusaur', 'https://assets.tcgdex.net/en/base/base1/15', 'Mitsuhiro Arita', 'Rare', 10.12,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-15', 3, 100, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-16', 16, 'Zapdos', 'https://assets.tcgdex.net/en/base/base1/16', 'Ken Sugimori', 'Rare', 2.49, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-16', 145, 90, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-17', 17, 'Beedrill', 'https://assets.tcgdex.net/en/base/base1/17', 'Ken Sugimori', 'Rare', 6.68,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-17', 15, 80, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-18', 18, 'Dragonair', 'https://assets.tcgdex.net/en/base/base1/18', 'Mitsuhiro Arita', 'Rare', 4.92,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-18', 148, 80, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-19', 19, 'Dugtrio', 'https://assets.tcgdex.net/en/base/base1/19', 'Keiji Kinebuchi', 'Rare', 10.51,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-19', 51, 70, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-20', 20, 'Electabuzz', 'https://assets.tcgdex.net/en/base/base1/20', 'Ken Sugimori', 'Rare', 10.32,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-20', 125, 70, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-21', 21, 'Electrode', 'https://assets.tcgdex.net/en/base/base1/21', 'Keiji Kinebuchi', 'Rare', 9.37,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-21', 101, 80, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-22', 22, 'Pidgeotto', 'https://assets.tcgdex.net/en/base/base1/22', 'Ken Sugimori', 'Rare', 10.23,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-22', 17, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-23', 23, 'Arcanine', 'https://assets.tcgdex.net/en/base/base1/23', 'Ken Sugimori', 'Uncommon', 3.39,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-23', 59, 100, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-24', 24, 'Charmeleon', 'https://assets.tcgdex.net/en/base/base1/24', 'Mitsuhiro Arita', 'Uncommon', 6.51,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-24', 5, 80, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-25', 25, 'Dewgong', 'https://assets.tcgdex.net/en/base/base1/25', 'Mitsuhiro Arita', 'Uncommon', 10.75,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-25', 87, 80, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-26', 26, 'Dratini', 'https://assets.tcgdex.net/en/base/base1/26', 'Ken Sugimori', 'Uncommon', 7.8,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-26', 147, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-27', 27, 'Farfetch''d', 'https://assets.tcgdex.net/en/base/base1/27', 'Ken Sugimori', 'Uncommon', 7.89,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-27', 83, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-28', 28, 'Growlithe', 'https://assets.tcgdex.net/en/base/base1/28', 'Ken Sugimori', 'Uncommon', 1.41,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-28', 58, 60, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-29', 29, 'Haunter', 'https://assets.tcgdex.net/en/base/base1/29', 'Keiji Kinebuchi', 'Uncommon', 6.91,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-29', 93, 60, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-30', 30, 'Ivysaur', 'https://assets.tcgdex.net/en/base/base1/30', 'Ken Sugimori', 'Uncommon', 7.4,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-30', 2, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-31', 31, 'Jynx', 'https://assets.tcgdex.net/en/base/base1/31', 'Ken Sugimori', 'Uncommon', 6.76,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-31', 124, 70, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-32', 32, 'Kadabra', 'https://assets.tcgdex.net/en/base/base1/32', 'Ken Sugimori', 'Uncommon', 5.11,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-32', 64, 60, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-33', 33, 'Kakuna', 'https://assets.tcgdex.net/en/base/base1/33', 'Keiji Kinebuchi', 'Uncommon', 1.62,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-33', 14, 80, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-34', 34, 'Machoke', 'https://assets.tcgdex.net/en/base/base1/34', 'Ken Sugimori', 'Uncommon', 4.7,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-34', 67, 80, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-35', 35, 'Magikarp', 'https://assets.tcgdex.net/en/base/base1/35', 'Mitsuhiro Arita', 'Uncommon', 1.3,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-35', 129, 30, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-36', 36, 'Magmar', 'https://assets.tcgdex.net/en/base/base1/36', 'Ken Sugimori', 'Uncommon', 8.29,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-36', 126, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-37', 37, 'Nidorino', 'https://assets.tcgdex.net/en/base/base1/37', 'Mitsuhiro Arita', 'Uncommon', 10.03,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-37', 33, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-38', 38, 'Poliwhirl', 'https://assets.tcgdex.net/en/base/base1/38', 'Ken Sugimori', 'Uncommon', 1.18,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-38', 61, 60, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-39', 39, 'Porygon', 'https://assets.tcgdex.net/en/base/base1/39', 'Tomoaki Imakuni', 'Uncommon', 10.69,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-39', 137, 30, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-40', 40, 'Raticate', 'https://assets.tcgdex.net/en/base/base1/40', 'Ken Sugimori', 'Uncommon', 10.9,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-40', 20, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-41', 41, 'Seel', 'https://assets.tcgdex.net/en/base/base1/41', 'Ken Sugimori', 'Uncommon', 4.78,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-41', 86, 60, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-42', 42, 'Wartortle', 'https://assets.tcgdex.net/en/base/base1/42', 'Ken Sugimori', 'Uncommon', 5.09,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-42', 8, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-43', 43, 'Abra', 'https://assets.tcgdex.net/en/base/base1/43', 'Mitsuhiro Arita', 'Common', 8.9,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-43', 63, 30, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-44', 44, 'Bulbasaur', 'https://assets.tcgdex.net/en/base/base1/44', 'Mitsuhiro Arita', 'Common', 3.9,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-44', 1, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-45', 45, 'Caterpie', 'https://assets.tcgdex.net/en/base/base1/45', 'Ken Sugimori', 'Common', 2.97,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-45', 10, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-46', 46, 'Charmander', 'https://assets.tcgdex.net/en/base/base1/46', 'Mitsuhiro Arita', 'Common', 10.27,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-46', 4, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-47', 47, 'Diglett', 'https://assets.tcgdex.net/en/base/base1/47', 'Keiji Kinebuchi', 'Common', 8.83,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-47', 50, 30, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-48', 48, 'Doduo', 'https://assets.tcgdex.net/en/base/base1/48', 'Mitsuhiro Arita', 'Common', 4.92,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-48', 84, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-49', 49, 'Drowzee', 'https://assets.tcgdex.net/en/base/base1/49', 'Ken Sugimori', 'Common', 8.36,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-49', 96, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-50', 50, 'Gastly', 'https://assets.tcgdex.net/en/base/base1/50', 'Keiji Kinebuchi', 'Common', 2.73,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-50', 92, 30, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-51', 51, 'Koffing', 'https://assets.tcgdex.net/en/base/base1/51', 'Mitsuhiro Arita', 'Common', 10.41,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-51', 109, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-52', 52, 'Machop', 'https://assets.tcgdex.net/en/base/base1/52', 'Mitsuhiro Arita', 'Common', 10.82,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-52', 66, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-53', 53, 'Magnemite', 'https://assets.tcgdex.net/en/base/base1/53', 'Keiji Kinebuchi', 'Common', 1.15,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-53', 81, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-54', 54, 'Metapod', 'https://assets.tcgdex.net/en/base/base1/54', 'Ken Sugimori', 'Common', 8.05,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-54', 11, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-55', 55, 'Nidoran♂', 'https://assets.tcgdex.net/en/base/base1/55', 'Ken Sugimori', 'Common', 1.51,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-55', 32, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-56', 56, 'Onix', 'https://assets.tcgdex.net/en/base/base1/56', 'Ken Sugimori', 'Common', 2.55, 'POKEMON',
        'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-56', 95, 90, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-57', 57, 'Pidgey', 'https://assets.tcgdex.net/en/base/base1/57', 'Ken Sugimori', 'Common', 5.93,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-57', 16, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-58', 58, 'Pikachu', 'https://assets.tcgdex.net/en/base/base1/58', 'Mitsuhiro Arita', 'Common', 8.71,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-58', 25, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-59', 59, 'Poliwag', 'https://assets.tcgdex.net/en/base/base1/59', 'Ken Sugimori', 'Common', 10.92,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-59', 60, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-60', 60, 'Ponyta', 'https://assets.tcgdex.net/en/base/base1/60', 'Ken Sugimori', 'Common', 4.83,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-60', 77, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-61', 61, 'Rattata', 'https://assets.tcgdex.net/en/base/base1/61', 'Mitsuhiro Arita', 'Common', 3.42,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-61', 19, 30, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-62', 62, 'Sandshrew', 'https://assets.tcgdex.net/en/base/base1/62', 'Ken Sugimori', 'Common', 1.21,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-62', 27, 40, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-63', 63, 'Squirtle', 'https://assets.tcgdex.net/en/base/base1/63', 'Mitsuhiro Arita', 'Common', 8.6,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-63', 7, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-64', 64, 'Starmie', 'https://assets.tcgdex.net/en/base/base1/64', 'Keiji Kinebuchi', 'Common', 9.51,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-64', 121, 60, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-65', 65, 'Staryu', 'https://assets.tcgdex.net/en/base/base1/65', 'Keiji Kinebuchi', 'Common', 1.74,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-65', 120, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-66', 66, 'Tangela', 'https://assets.tcgdex.net/en/base/base1/66', 'Mitsuhiro Arita', 'Common', 2.55,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-66', 114, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-67', 67, 'Voltorb', 'https://assets.tcgdex.net/en/base/base1/67', 'Keiji Kinebuchi', 'Common', 7.53,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-67', 100, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-68', 68, 'Vulpix', 'https://assets.tcgdex.net/en/base/base1/68', 'Ken Sugimori', 'Common', 10.89,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-68', 37, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-69', 69, 'Weedle', 'https://assets.tcgdex.net/en/base/base1/69', 'Mitsuhiro Arita', 'Common', 9.05,
        'POKEMON', 'base1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('base1-69', 13, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-70', 70, 'Clefairy Doll', 'https://assets.tcgdex.net/en/base/base1/70', 'Keiji Kinebuchi', 'Rare', 1.43,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-70', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-71', 71, 'Computer Search', 'https://assets.tcgdex.net/en/base/base1/71', 'Keiji Kinebuchi', 'Rare', 7.8,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-71', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-72', 72, 'Devolution Spray', 'https://assets.tcgdex.net/en/base/base1/72', 'Keiji Kinebuchi', 'Rare',
        9.63, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-72', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-73', 73, 'Impostor Professor Oak', 'https://assets.tcgdex.net/en/base/base1/73', 'Ken Sugimori', 'Rare',
        4.25, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-73', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-74', 74, 'Item Finder', 'https://assets.tcgdex.net/en/base/base1/74', 'Keiji Kinebuchi', 'Rare', 9.75,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-74', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-75', 75, 'Lass', 'https://assets.tcgdex.net/en/base/base1/75', 'Ken Sugimori', 'Rare', 10.98, 'TRAINER',
        'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-75', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-76', 76, 'Pokémon Breeder', 'https://assets.tcgdex.net/en/base/base1/76', 'Ken Sugimori', 'Rare', 5.53,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-76', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-77', 77, 'Pokémon Trader', 'https://assets.tcgdex.net/en/base/base1/77', 'Ken Sugimori', 'Rare', 2.49,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-77', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-78', 78, 'Scoop Up', 'https://assets.tcgdex.net/en/base/base1/78', 'Keiji Kinebuchi', 'Rare', 10.95,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-78', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-79', 79, 'Super Energy Removal', 'https://assets.tcgdex.net/en/base/base1/79', 'Keiji Kinebuchi', 'Rare',
        10.11, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-79', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-80', 80, 'Defender', 'https://assets.tcgdex.net/en/base/base1/80', 'Keiji Kinebuchi', 'Uncommon', 1.55,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-80', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-81', 81, 'Energy Retrieval', 'https://assets.tcgdex.net/en/base/base1/81', 'Keiji Kinebuchi', 'Uncommon',
        9.55, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-81', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-82', 82, 'Full Heal', 'https://assets.tcgdex.net/en/base/base1/82', 'Keiji Kinebuchi', 'Uncommon', 7.9,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-82', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-83', 83, 'Maintenance', 'https://assets.tcgdex.net/en/base/base1/83', 'Keiji Kinebuchi', 'Uncommon',
        5.09, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-83', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-84', 84, 'PlusPower', 'https://assets.tcgdex.net/en/base/base1/84', 'Keiji Kinebuchi', 'Uncommon', 8.59,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-84', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-85', 85, 'Pokémon Center', 'https://assets.tcgdex.net/en/base/base1/85', 'Keiji Kinebuchi', 'Uncommon',
        7.3, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-85', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-86', 86, 'Pokémon Flute', 'https://assets.tcgdex.net/en/base/base1/86', 'Keiji Kinebuchi', 'Uncommon',
        4.85, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-86', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-87', 87, 'Pokédex', 'https://assets.tcgdex.net/en/base/base1/87', 'Keiji Kinebuchi', 'Uncommon', 2.14,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-87', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-88', 88, 'Professor Oak', 'https://assets.tcgdex.net/en/base/base1/88', 'Ken Sugimori', 'Uncommon', 8.57,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-88', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-89', 89, 'Revive', 'https://assets.tcgdex.net/en/base/base1/89', 'Keiji Kinebuchi', 'Uncommon', 9.8,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-89', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-90', 90, 'Super Potion', 'https://assets.tcgdex.net/en/base/base1/90', 'Keiji Kinebuchi', 'Uncommon',
        6.74, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-90', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-91', 91, 'Bill', 'https://assets.tcgdex.net/en/base/base1/91', 'Ken Sugimori', 'Common', 6.41, 'TRAINER',
        'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-91', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-92', 92, 'Energy Removal', 'https://assets.tcgdex.net/en/base/base1/92', 'Keiji Kinebuchi', 'Common',
        3.07, 'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-92', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-93', 93, 'Gust of Wind', 'https://assets.tcgdex.net/en/base/base1/93', 'Keiji Kinebuchi', 'Common', 5.84,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-93', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-94', 94, 'Potion', 'https://assets.tcgdex.net/en/base/base1/94', 'Keiji Kinebuchi', 'Common', 10.1,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-94', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-95', 95, 'Switch', 'https://assets.tcgdex.net/en/base/base1/95', 'Keiji Kinebuchi', 'Common', 5.69,
        'TRAINER', 'base1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('base1-95', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-96', 96, 'Double Colorless Energy', 'https://assets.tcgdex.net/en/base/base1/96', 'Keiji Kinebuchi',
        'Uncommon', 3.01, 'ENERGY', 'base1');
INSERT INTO energies (card_id, effect, type)
VALUES ('base1-96', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-97', 97, 'Fighting Energy', 'https://assets.tcgdex.net/en/base/base1/97', 'Keiji Kinebuchi', 'Common',
        1.35, 'ENERGY', 'base1');
INSERT INTO energies (card_id, effect, type)
VALUES ('base1-97', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-98', 98, 'Fire Energy', 'https://assets.tcgdex.net/en/base/base1/98', 'Keiji Kinebuchi', 'Common', 2.62,
        'ENERGY', 'base1');
INSERT INTO energies (card_id, effect, type)
VALUES ('base1-98', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-99', 99, 'Grass Energy', 'https://assets.tcgdex.net/en/base/base1/99', 'Keiji Kinebuchi', 'Common', 3.25,
        'ENERGY', 'base1');
INSERT INTO energies (card_id, effect, type)
VALUES ('base1-99', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-100', 100, 'Lightning Energy', 'https://assets.tcgdex.net/en/base/base1/100', 'Keiji Kinebuchi',
        'Common', 6.23, 'ENERGY', 'base1');
INSERT INTO energies (card_id, effect, type)
VALUES ('base1-100', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-101', 101, 'Psychic Energy', 'https://assets.tcgdex.net/en/base/base1/101', 'Keiji Kinebuchi', 'Common',
        3.15, 'ENERGY', 'base1');
INSERT INTO energies (card_id, effect, type)
VALUES ('base1-101', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('base1-102', 102, 'Water Energy', 'https://assets.tcgdex.net/en/base/base1/102', 'Keiji Kinebuchi', 'Common',
        2.53, 'ENERGY', 'base1');
INSERT INTO energies (card_id, effect, type)
VALUES ('base1-102', 'Provides energy', 'Normal');


-- Serie: Miscellaneous
INSERT INTO series (id, name, logo_url)
VALUES ('misc', 'Miscellaneous', NULL);

-- Set: Jumbo cards
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('jumbo', 'Jumbo cards', NULL, NOW(), 'misc');


-- Serie: Gym
INSERT INTO series (id, name, logo_url)
VALUES ('gym', 'Gym', 'https://assets.tcgdex.net/en/gym/gym1/logo');

-- Set: Gym Heroes
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('gym1', 'Gym Heroes', 'https://assets.tcgdex.net/en/gym/gym1/logo', NOW(), 'gym');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-1', 1, 'Blaine''s Moltres', 'https://assets.tcgdex.net/en/gym/gym1/1', 'Ken Sugimori', 'Rare Holo', 8.4,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-1', 146, 90, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-2', 2, 'Brock''s Rhydon', 'https://assets.tcgdex.net/en/gym/gym1/2', 'Ken Sugimori', 'Rare Holo', 2.13,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-2', 112, 80, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-3', 3, 'Erika''s Clefable', 'https://assets.tcgdex.net/en/gym/gym1/3', 'Atsuko Nishida', 'Rare Holo',
        8.93, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-3', 36, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-4', 4, 'Erika''s Dragonair', 'https://assets.tcgdex.net/en/gym/gym1/4', 'Atsuko Nishida', 'Rare Holo',
        6.06, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-4', 148, 80, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-5', 5, 'Erika''s Vileplume', 'https://assets.tcgdex.net/en/gym/gym1/5', 'Ken Sugimori', 'Rare Holo', 1.17,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-5', 45, 80, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-6', 6, 'Lt. Surge''s Electabuzz', 'https://assets.tcgdex.net/en/gym/gym1/6', 'Ken Sugimori', 'Rare Holo',
        6.97, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-6', 125, 70, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-7', 7, 'Lt. Surge''s Fearow', 'https://assets.tcgdex.net/en/gym/gym1/7', 'Ken Sugimori', 'Rare Holo', 3.3,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-7', 22, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-8', 8, 'Lt. Surge''s Magneton', 'https://assets.tcgdex.net/en/gym/gym1/8', 'Ken Sugimori', 'Rare Holo',
        4.08, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-8', 82, 70, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-9', 9, 'Misty''s Seadra', 'https://assets.tcgdex.net/en/gym/gym1/9', 'Atsuko Nishida', 'Rare Holo', 5.83,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-9', 117, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-10', 10, 'Misty''s Tentacruel', 'https://assets.tcgdex.net/en/gym/gym1/10', 'Ken Sugimori', 'Rare Holo',
        2.83, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-10', 73, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-11', 11, 'Rocket''s Hitmonchan', 'https://assets.tcgdex.net/en/gym/gym1/11', 'Ken Sugimori', 'Rare Holo',
        9.83, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-11', 107, 60, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-12', 12, 'Rocket''s Moltres', 'https://assets.tcgdex.net/en/gym/gym1/12', 'Ken Sugimori', 'Rare Holo',
        3.07, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-12', 146, 60, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-13', 13, 'Rocket''s Scyther', 'https://assets.tcgdex.net/en/gym/gym1/13', 'Ken Sugimori', 'Rare Holo',
        6.19, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-13', 123, 60, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-14', 14, 'Sabrina''s Gengar', 'https://assets.tcgdex.net/en/gym/gym1/14', 'Ken Sugimori', 'Rare Holo',
        1.37, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-14', 94, 80, 'Psychic', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-15', 15, 'Brock', 'https://assets.tcgdex.net/en/gym/gym1/15', 'Ken Sugimori', 'Rare Holo', 2.5, 'TRAINER',
        'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-15', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-16', 16, 'Erika', 'https://assets.tcgdex.net/en/gym/gym1/16', 'Ken Sugimori', 'Rare Holo', 4.4, 'TRAINER',
        'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-16', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-17', 17, 'Lt. Surge', 'https://assets.tcgdex.net/en/gym/gym1/17', 'Ken Sugimori', 'Rare Holo', 4.22,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-17', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-18', 18, 'Misty', 'https://assets.tcgdex.net/en/gym/gym1/18', 'Ken Sugimori', 'Rare Holo', 5.85,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-18', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-19', 19, 'The Rocket''s Trap', 'https://assets.tcgdex.net/en/gym/gym1/19', 'Ken Sugimori', 'Rare Holo',
        3.56, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-19', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-20', 20, 'Brock''s Golem', 'https://assets.tcgdex.net/en/gym/gym1/20', 'Ken Sugimori', 'Rare Holo', 10.91,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-20', 76, 90, 'Fighting', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-21', 21, 'Brock''s Onix', 'https://assets.tcgdex.net/en/gym/gym1/21', 'Benimaru Itoh', 'Rare Holo', 1.29,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-21', 95, 70, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-22', 22, 'Brock''s Rhyhorn', 'https://assets.tcgdex.net/en/gym/gym1/22', 'Ken Sugimori', 'Rare Holo',
        4.22, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-22', 111, 60, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-23', 23, 'Brock''s Sandslash', 'https://assets.tcgdex.net/en/gym/gym1/23', 'Ken Sugimori', 'Rare Holo',
        3.17, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-23', 28, 60, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-24', 24, 'Brock''s Zubat', 'https://assets.tcgdex.net/en/gym/gym1/24', 'Ken Sugimori', 'Rare Holo', 5.1,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-24', 41, 30, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-25', 25, 'Erika''s Clefairy', 'https://assets.tcgdex.net/en/gym/gym1/25', 'Ken Sugimori', 'Rare Holo',
        2.61, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-25', 35, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-26', 26, 'Erika''s Victreebel', 'https://assets.tcgdex.net/en/gym/gym1/26', 'Ken Sugimori', 'Rare Holo',
        8.82, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-26', 71, 80, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-27', 27, 'Lt. Surge''s Electabuzz', 'https://assets.tcgdex.net/en/gym/gym1/27', 'Ken Sugimori',
        'Rare Holo', 3.83, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-27', 125, 60, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-28', 28, 'Lt. Surge''s Raichu', 'https://assets.tcgdex.net/en/gym/gym1/28', 'Ken Sugimori', 'Rare Holo',
        9.98, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-28', 26, 70, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-29', 29, 'Misty''s Cloyster', 'https://assets.tcgdex.net/en/gym/gym1/29', 'Ken Sugimori', 'Rare Holo',
        3.55, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-29', 91, 60, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-30', 30, 'Misty''s Goldeen', 'https://assets.tcgdex.net/en/gym/gym1/30', 'Ken Sugimori', 'Rare Holo',
        2.23, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-30', 118, 30, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-31', 31, 'Misty''s Poliwrath', 'https://assets.tcgdex.net/en/gym/gym1/31', 'Ken Sugimori', 'Rare Holo',
        6.12, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-31', 62, 90, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-32', 32, 'Misty''s Tentacool', 'https://assets.tcgdex.net/en/gym/gym1/32', 'Ken Sugimori', 'Rare Holo',
        1.17, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-32', 72, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-33', 33, 'Rocket''s Snorlax', 'https://assets.tcgdex.net/en/gym/gym1/33', 'Shin-ichi Yoshida',
        'Rare Holo', 8.67, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-33', 143, 90, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-34', 34, 'Sabrina''s Venomoth', 'https://assets.tcgdex.net/en/gym/gym1/34', 'Ken Sugimori', 'Rare Holo',
        8.85, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-34', 49, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-35', 35, 'Blaine''s Growlithe', 'https://assets.tcgdex.net/en/gym/gym1/35', 'Ken Sugimori', 'Uncommon',
        2.25, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-35', 58, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-36', 36, 'Blaine''s Kangaskhan', 'https://assets.tcgdex.net/en/gym/gym1/36', 'Ken Sugimori', 'Uncommon',
        8.45, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-36', 115, 80, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-37', 37, 'Blaine''s Magmar', 'https://assets.tcgdex.net/en/gym/gym1/37', 'Ken Sugimori', 'Uncommon', 3.57,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-37', 126, 60, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-38', 38, 'Brock''s Geodude', 'https://assets.tcgdex.net/en/gym/gym1/38', 'Atsuko Nishida', 'Uncommon',
        2.67, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-38', 74, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-39', 39, 'Brock''s Golbat', 'https://assets.tcgdex.net/en/gym/gym1/39', 'Ken Sugimori', 'Uncommon', 4.72,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-39', 42, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-40', 40, 'Brock''s Graveler', 'https://assets.tcgdex.net/en/gym/gym1/40', 'Ken Sugimori', 'Uncommon',
        9.24, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-40', 75, 70, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-41', 41, 'Brock''s Lickitung', 'https://assets.tcgdex.net/en/gym/gym1/41', 'Ken Sugimori', 'Uncommon',
        6.79, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-41', 108, 80, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-42', 42, 'Erika''s Dratini', 'https://assets.tcgdex.net/en/gym/gym1/42', 'Ken Sugimori', 'Uncommon', 7.64,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-42', 147, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-43', 43, 'Erika''s Exeggcute', 'https://assets.tcgdex.net/en/gym/gym1/43', 'Atsuko Nishida', 'Uncommon',
        6.62, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-43', 102, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-44', 44, 'Erika''s Exeggutor', 'https://assets.tcgdex.net/en/gym/gym1/44', 'Ken Sugimori', 'Uncommon',
        8.99, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-44', 103, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-45', 45, 'Erika''s Gloom', 'https://assets.tcgdex.net/en/gym/gym1/45', 'Ken Sugimori', 'Uncommon', 2.0,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-45', 44, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-46', 46, 'Erika''s Gloom', 'https://assets.tcgdex.net/en/gym/gym1/46', 'Ken Sugimori', 'Uncommon', 1.34,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-46', 44, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-47', 47, 'Erika''s Oddish', 'https://assets.tcgdex.net/en/gym/gym1/47', 'Atsuko Nishida', 'Uncommon',
        3.41, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-47', 43, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-48', 48, 'Erika''s Weepinbell', 'https://assets.tcgdex.net/en/gym/gym1/48', 'Atsuko Nishida', 'Uncommon',
        2.76, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-48', 70, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-49', 49, 'Erika''s Weepinbell', 'https://assets.tcgdex.net/en/gym/gym1/49', 'Ken Sugimori', 'Uncommon',
        10.36, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-49', 70, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-50', 50, 'Lt. Surge''s Magnemite', 'https://assets.tcgdex.net/en/gym/gym1/50', 'Atsuko Nishida',
        'Uncommon', 5.49, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-50', 81, 30, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-51', 51, 'Lt. Surge''s Raticate', 'https://assets.tcgdex.net/en/gym/gym1/51', 'Ken Sugimori', 'Uncommon',
        4.31, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-51', 20, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-52', 52, 'Lt. Surge''s Spearow', 'https://assets.tcgdex.net/en/gym/gym1/52', 'Ken Sugimori', 'Uncommon',
        10.28, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-52', 21, 30, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-53', 53, 'Misty''s Poliwhirl', 'https://assets.tcgdex.net/en/gym/gym1/53', 'Ken Sugimori', 'Uncommon',
        8.92, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-53', 61, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-54', 54, 'Misty''s Psyduck', 'https://assets.tcgdex.net/en/gym/gym1/54', 'Atsuko Nishida', 'Uncommon',
        2.4, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-54', 54, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-55', 55, 'Misty''s Seaking', 'https://assets.tcgdex.net/en/gym/gym1/55', 'Ken Sugimori', 'Uncommon', 4.54,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-55', 119, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-56', 56, 'Misty''s Starmie', 'https://assets.tcgdex.net/en/gym/gym1/56', 'Ken Sugimori', 'Uncommon', 8.39,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-56', 121, 80, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-57', 57, 'Misty''s Tentacool', 'https://assets.tcgdex.net/en/gym/gym1/57', 'Ken Sugimori', 'Uncommon',
        8.73, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-57', 72, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-58', 58, 'Sabrina''s Haunter', 'https://assets.tcgdex.net/en/gym/gym1/58', 'Atsuko Nishida', 'Uncommon',
        9.72, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-58', 93, 50, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-59', 59, 'Sabrina''s Jynx', 'https://assets.tcgdex.net/en/gym/gym1/59', 'Atsuko Nishida', 'Uncommon',
        10.29, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-59', 124, 60, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-60', 60, 'Sabrina''s Slowbro', 'https://assets.tcgdex.net/en/gym/gym1/60', 'Ken Sugimori', 'Uncommon',
        4.5, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-60', 80, 70, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-61', 61, 'Blaine''s Charmander', 'https://assets.tcgdex.net/en/gym/gym1/61', 'Ken Sugimori', 'Common',
        4.71, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-61', 4, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-62', 62, 'Blaine''s Growlithe', 'https://assets.tcgdex.net/en/gym/gym1/62', 'Atsuko Nishida', 'Common',
        5.99, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-62', 58, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-63', 63, 'Blaine''s Ponyta', 'https://assets.tcgdex.net/en/gym/gym1/63', 'Ken Sugimori', 'Common', 10.6,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-63', 77, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-64', 64, 'Blaine''s Tauros', 'https://assets.tcgdex.net/en/gym/gym1/64', 'Ken Sugimori', 'Common', 5.26,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-64', 128, 70, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-65', 65, 'Blaine''s Vulpix', 'https://assets.tcgdex.net/en/gym/gym1/65', 'Ken Sugimori', 'Common', 6.14,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-65', 37, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-66', 66, 'Brock''s Geodude', 'https://assets.tcgdex.net/en/gym/gym1/66', 'Ken Sugimori', 'Common', 9.17,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-66', 74, 40, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-67', 67, 'Brock''s Mankey', 'https://assets.tcgdex.net/en/gym/gym1/67', 'Atsuko Nishida', 'Common', 3.31,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-67', 56, 40, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-68', 68, 'Brock''s Mankey', 'https://assets.tcgdex.net/en/gym/gym1/68', 'Ken Sugimori', 'Common', 4.2,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-68', 56, 40, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-69', 69, 'Brock''s Onix', 'https://assets.tcgdex.net/en/gym/gym1/69', 'Ken Sugimori', 'Common', 1.99,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-69', 95, 100, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-70', 70, 'Brock''s Rhyhorn', 'https://assets.tcgdex.net/en/gym/gym1/70', 'Ken Sugimori', 'Common', 6.93,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-70', 111, 70, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-71', 71, 'Brock''s Sandshrew', 'https://assets.tcgdex.net/en/gym/gym1/71', 'Ken Sugimori', 'Common', 2.31,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-71', 27, 40, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-72', 72, 'Brock''s Sandshrew', 'https://assets.tcgdex.net/en/gym/gym1/72', 'Ken Sugimori', 'Common', 8.54,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-72', 27, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-73', 73, 'Brock''s Vulpix', 'https://assets.tcgdex.net/en/gym/gym1/73', 'Ken Sugimori', 'Common', 4.58,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-73', 37, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-74', 74, 'Brock''s Zubat', 'https://assets.tcgdex.net/en/gym/gym1/74', 'Atsuko Nishida', 'Common', 5.74,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-74', 41, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-75', 75, 'Erika''s Bellsprout', 'https://assets.tcgdex.net/en/gym/gym1/75', 'Atsuko Nishida', 'Common',
        8.63, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-75', 69, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-76', 76, 'Erika''s Bellsprout', 'https://assets.tcgdex.net/en/gym/gym1/76', 'Ken Sugimori', 'Common',
        8.97, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-76', 69, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-77', 77, 'Erika''s Exeggcute', 'https://assets.tcgdex.net/en/gym/gym1/77', 'Ken Sugimori', 'Common',
        10.02, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-77', 102, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-78', 78, 'Erika''s Oddish', 'https://assets.tcgdex.net/en/gym/gym1/78', 'Ken Sugimori', 'Common', 3.76,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-78', 43, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-79', 79, 'Erika''s Tangela', 'https://assets.tcgdex.net/en/gym/gym1/79', 'Ken Sugimori', 'Common', 4.07,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-79', 114, 60, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-80', 80, 'Lt. Surge''s Magnemite', 'https://assets.tcgdex.net/en/gym/gym1/80', 'Ken Sugimori', 'Common',
        5.05, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-80', 81, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-81', 81, 'Lt. Surge''s Pikachu', 'https://assets.tcgdex.net/en/gym/gym1/81', 'Ken Sugimori', 'Common',
        7.25, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-81', 25, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-82', 82, 'Lt. Surge''s Rattata', 'https://assets.tcgdex.net/en/gym/gym1/82', 'Ken Sugimori', 'Common',
        3.8, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-82', 19, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-83', 83, 'Lt. Surge''s Spearow', 'https://assets.tcgdex.net/en/gym/gym1/83', 'Atsuko Nishida', 'Common',
        1.31, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-83', 21, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-84', 84, 'Lt. Surge''s Voltorb', 'https://assets.tcgdex.net/en/gym/gym1/84', 'Ken Sugimori', 'Common',
        7.19, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-84', 100, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-85', 85, 'Misty''s Goldeen', 'https://assets.tcgdex.net/en/gym/gym1/85', 'Atsuko Nishida', 'Common', 1.92,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-85', 118, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-86', 86, 'Misty''s Horsea', 'https://assets.tcgdex.net/en/gym/gym1/86', 'Ken Sugimori', 'Common', 9.47,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-86', 116, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-87', 87, 'Misty''s Poliwag', 'https://assets.tcgdex.net/en/gym/gym1/87', 'Ken Sugimori', 'Common', 3.09,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-87', 60, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-88', 88, 'Misty''s Seel', 'https://assets.tcgdex.net/en/gym/gym1/88', 'Atsuko Nishida', 'Common', 2.06,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-88', 86, 60, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-89', 89, 'Misty''s Shellder', 'https://assets.tcgdex.net/en/gym/gym1/89', 'Ken Sugimori', 'Common', 2.25,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-89', 90, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-90', 90, 'Misty''s Staryu', 'https://assets.tcgdex.net/en/gym/gym1/90', 'Ken Sugimori', 'Common', 1.17,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-90', 120, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-91', 91, 'Sabrina''s Abra', 'https://assets.tcgdex.net/en/gym/gym1/91', 'Ken Sugimori', 'Common', 9.5,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-91', 63, 40, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-92', 92, 'Sabrina''s Drowzee', 'https://assets.tcgdex.net/en/gym/gym1/92', 'Atsuko Nishida', 'Common',
        10.83, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-92', 96, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-93', 93, 'Sabrina''s Gastly', 'https://assets.tcgdex.net/en/gym/gym1/93', 'Ken Sugimori', 'Common', 1.05,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-93', 92, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-94', 94, 'Sabrina''s Mr. Mime', 'https://assets.tcgdex.net/en/gym/gym1/94', 'Ken Sugimori', 'Common',
        1.95, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-94', 122, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-95', 95, 'Sabrina''s Slowpoke', 'https://assets.tcgdex.net/en/gym/gym1/95', 'Ken Sugimori', 'Common',
        9.21, 'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-95', 79, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-96', 96, 'Sabrina''s Venonat', 'https://assets.tcgdex.net/en/gym/gym1/96', 'Ken Sugimori', 'Common', 7.09,
        'POKEMON', 'gym1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('gym1-96', 48, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-97', 97, 'Blaine''s Quiz #1', 'https://assets.tcgdex.net/en/gym/gym1/97', 'Ken Sugimori', 'Rare', 6.48,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-97', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-98', 98, 'Brock', 'https://assets.tcgdex.net/en/gym/gym1/98', 'Ken Sugimori', 'Rare', 8.11, 'TRAINER',
        'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-98', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-99', 99, 'Charity', 'https://assets.tcgdex.net/en/gym/gym1/99', 'Ken Sugimori', 'Rare', 4.03, 'TRAINER',
        'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-99', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-100', 100, 'Erika', 'https://assets.tcgdex.net/en/gym/gym1/100', 'Ken Sugimori', 'Rare', 6.52, 'TRAINER',
        'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-100', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-101', 101, 'Lt. Surge', 'https://assets.tcgdex.net/en/gym/gym1/101', 'Ken Sugimori', 'Rare', 8.44,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-101', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-102', 102, 'Misty', 'https://assets.tcgdex.net/en/gym/gym1/102', 'Ken Sugimori', 'Rare', 4.57, 'TRAINER',
        'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-102', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-103', 103, 'No Removal Gym', 'https://assets.tcgdex.net/en/gym/gym1/103', 'Keiji Kinebuchi', 'Rare', 4.88,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-103', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-104', 104, 'The Rocket''s Training Gym', 'https://assets.tcgdex.net/en/gym/gym1/104', 'Keiji Kinebuchi',
        'Rare', 10.72, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-104', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-105', 105, 'Blaine''s Last Resort', 'https://assets.tcgdex.net/en/gym/gym1/105', 'Ken Sugimori',
        'Uncommon', 5.32, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-105', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-106', 106, 'Brock''s Training Method', 'https://assets.tcgdex.net/en/gym/gym1/106', 'Ken Sugimori',
        'Uncommon', 1.77, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-106', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-107', 107, 'Celadon City Gym', 'https://assets.tcgdex.net/en/gym/gym1/107', 'Keiji Kinebuchi', 'Uncommon',
        3.59, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-107', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-108', 108, 'Cerulean City Gym', 'https://assets.tcgdex.net/en/gym/gym1/108', 'Keiji Kinebuchi',
        'Uncommon', 3.15, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-108', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-109', 109, 'Erika''s Maids', 'https://assets.tcgdex.net/en/gym/gym1/109', 'Ken Sugimori', 'Uncommon',
        5.83, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-109', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-110', 110, 'Erika''s Perfume', 'https://assets.tcgdex.net/en/gym/gym1/110', 'Ken Sugimori', 'Uncommon',
        1.87, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-110', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-111', 111, 'Good Manners', 'https://assets.tcgdex.net/en/gym/gym1/111', 'Ken Sugimori', 'Uncommon', 8.86,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-111', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-112', 112, 'Lt. Surge''s Treaty', 'https://assets.tcgdex.net/en/gym/gym1/112', 'Ken Sugimori', 'Uncommon',
        7.6, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-112', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-113', 113, 'Minion of Team Rocket', 'https://assets.tcgdex.net/en/gym/gym1/113', 'Ken Sugimori',
        'Uncommon', 6.37, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-113', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-114', 114, 'Misty''s Wrath', 'https://assets.tcgdex.net/en/gym/gym1/114', 'Ken Sugimori', 'Uncommon',
        10.15, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-114', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-115', 115, 'Pewter City Gym', 'https://assets.tcgdex.net/en/gym/gym1/115', 'Keiji Kinebuchi', 'Uncommon',
        10.17, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-115', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-116', 116, 'Recall', 'https://assets.tcgdex.net/en/gym/gym1/116', 'Sumiyoshi Kizuki', 'Uncommon', 2.95,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-116', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-117', 117, 'Sabrina''s ESP', 'https://assets.tcgdex.net/en/gym/gym1/117', 'Ken Sugimori', 'Uncommon',
        3.52, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-117', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-118', 118, 'Secret Mission', 'https://assets.tcgdex.net/en/gym/gym1/118', 'Ken Sugimori', 'Uncommon',
        2.15, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-118', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-119', 119, 'Tickling Machine', 'https://assets.tcgdex.net/en/gym/gym1/119', 'Sumiyoshi Kizuki',
        'Uncommon', 5.87, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-119', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-120', 120, 'Vermilion City Gym', 'https://assets.tcgdex.net/en/gym/gym1/120', 'Keiji Kinebuchi',
        'Uncommon', 7.83, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-120', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-121', 121, 'Blaine''s Gamble', 'https://assets.tcgdex.net/en/gym/gym1/121', 'Ken Sugimori', 'Common',
        9.62, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-121', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-122', 122, 'Energy Flow', 'https://assets.tcgdex.net/en/gym/gym1/122', 'Keiji Kinebuchi', 'Common', 6.97,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-122', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-123', 123, 'Misty''s Duel', 'https://assets.tcgdex.net/en/gym/gym1/123', 'Ken Sugimori', 'Common', 1.47,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-123', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-124', 124, 'Narrow Gym', 'https://assets.tcgdex.net/en/gym/gym1/124', 'Keiji Kinebuchi', 'Common', 6.12,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-124', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-125', 125, 'Sabrina''s Gaze', 'https://assets.tcgdex.net/en/gym/gym1/125', 'Ken Sugimori', 'Common', 5.22,
        'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-125', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-126', 126, 'Trash Exchange', 'https://assets.tcgdex.net/en/gym/gym1/126', 'Keiji Kinebuchi', 'Common',
        5.98, 'TRAINER', 'gym1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('gym1-126', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-127', 127, 'Fighting Energy', 'https://assets.tcgdex.net/en/gym/gym1/127', 'Keiji Kinebuchi', 'Common',
        1.79, 'ENERGY', 'gym1');
INSERT INTO energies (card_id, effect, type)
VALUES ('gym1-127', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-128', 128, 'Fire Energy', 'https://assets.tcgdex.net/en/gym/gym1/128', 'Keiji Kinebuchi', 'Common', 4.02,
        'ENERGY', 'gym1');
INSERT INTO energies (card_id, effect, type)
VALUES ('gym1-128', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-129', 129, 'Grass Energy', 'https://assets.tcgdex.net/en/gym/gym1/129', 'Keiji Kinebuchi', 'Common', 1.7,
        'ENERGY', 'gym1');
INSERT INTO energies (card_id, effect, type)
VALUES ('gym1-129', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-130', 130, 'Lightning Energy', 'https://assets.tcgdex.net/en/gym/gym1/130', 'Keiji Kinebuchi', 'Common',
        2.46, 'ENERGY', 'gym1');
INSERT INTO energies (card_id, effect, type)
VALUES ('gym1-130', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-131', 131, 'Psychic Energy', 'https://assets.tcgdex.net/en/gym/gym1/131', 'Keiji Kinebuchi', 'Common',
        10.28, 'ENERGY', 'gym1');
INSERT INTO energies (card_id, effect, type)
VALUES ('gym1-131', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('gym1-132', 132, 'Water Energy', 'https://assets.tcgdex.net/en/gym/gym1/132', 'Keiji Kinebuchi', 'Common', 1.51,
        'ENERGY', 'gym1');
INSERT INTO energies (card_id, effect, type)
VALUES ('gym1-132', 'Provides energy', 'Normal');


-- Serie: Neo
INSERT INTO series (id, name, logo_url)
VALUES ('neo', 'Neo', 'https://assets.tcgdex.net/en/neo/neo1/logo');

-- Set: Neo Genesis
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('neo1', 'Neo Genesis', 'https://assets.tcgdex.net/en/neo/neo1/logo', NOW(), 'neo');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-1', 1, 'Ampharos', 'https://assets.tcgdex.net/en/neo/neo1/1', 'Ken Sugimori', 'Rare', 3.03, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-1', 181, 80, 'Lightning', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-2', 2, 'Azumarill', 'https://assets.tcgdex.net/en/neo/neo1/2', 'Ken Sugimori', 'Rare', 10.09, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-2', 184, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-3', 3, 'Bellossom', 'https://assets.tcgdex.net/en/neo/neo1/3', 'Atsuko Nishida', 'Rare', 9.12, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-3', 182, 70, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-4', 4, 'Feraligatr', 'https://assets.tcgdex.net/en/neo/neo1/4', 'Ken Sugimori', 'Rare', 9.71, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-4', 160, 100, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-5', 5, 'Feraligatr', 'https://assets.tcgdex.net/en/neo/neo1/5', 'Ken Sugimori', 'Rare', 10.61, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-5', 160, 120, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-6', 6, 'Heracross', 'https://assets.tcgdex.net/en/neo/neo1/6', 'Ken Sugimori', 'Rare', 2.53, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-6', 214, 60, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-7', 7, 'Jumpluff', 'https://assets.tcgdex.net/en/neo/neo1/7', 'Atsuko Nishida', 'Rare', 5.1, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-7', 189, 70, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-8', 8, 'Kingdra', 'https://assets.tcgdex.net/en/neo/neo1/8', 'Ken Sugimori', 'Rare', 6.6, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-8', 230, 90, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-9', 9, 'Lugia', 'https://assets.tcgdex.net/en/neo/neo1/9', 'Hironobu Yoshida', 'Rare', 6.37, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-9', 249, 90, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-10', 10, 'Meganium', 'https://assets.tcgdex.net/en/neo/neo1/10', 'Ken Sugimori', 'Rare', 6.96, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-10', 154, 100, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-11', 11, 'Meganium', 'https://assets.tcgdex.net/en/neo/neo1/11', 'Ken Sugimori', 'Rare', 7.12, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-11', 154, 100, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-12', 12, 'Pichu', 'https://assets.tcgdex.net/en/neo/neo1/12', 'Ken Sugimori', 'Rare', 3.29, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-12', 172, 30, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-13', 13, 'Skarmory', 'https://assets.tcgdex.net/en/neo/neo1/13', 'Ken Sugimori', 'Rare', 4.9, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-13', 227, 60, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-14', 14, 'Slowking', 'https://assets.tcgdex.net/en/neo/neo1/14', 'Ken Sugimori', 'Rare', 2.71, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-14', 199, 80, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-15', 15, 'Steelix', 'https://assets.tcgdex.net/en/neo/neo1/15', 'Ken Sugimori', 'Rare', 9.4, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-15', 208, 110, 'Metal', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-16', 16, 'Togetic', 'https://assets.tcgdex.net/en/neo/neo1/16', 'Ken Sugimori', 'Rare', 10.54, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-16', 176, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-17', 17, 'Typhlosion', 'https://assets.tcgdex.net/en/neo/neo1/17', 'Shin-ichi Yoshida', 'Rare', 1.92,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-17', 157, 100, 'Fire', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-18', 18, 'Typhlosion', 'https://assets.tcgdex.net/en/neo/neo1/18', 'Ken Sugimori', 'Rare', 1.13,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-18', 157, 100, 'Fire', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-19', 19, 'Metal Energy', 'https://assets.tcgdex.net/en/neo/neo1/19', 'Milky Isobe', 'Rare', 3.46,
        'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-19', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-20', 20, 'Cleffa', 'https://assets.tcgdex.net/en/neo/neo1/20', 'Kagemaru Himeno', 'Rare', 1.64, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-20', 173, 30, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-21', 21, 'Donphan', 'https://assets.tcgdex.net/en/neo/neo1/21', 'Ken Sugimori', 'Rare', 4.63, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-21', 232, 70, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-22', 22, 'Elekid', 'https://assets.tcgdex.net/en/neo/neo1/22', 'Miki Tanaka', 'Rare', 10.38, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-22', 239, 30, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-23', 23, 'Magby', 'https://assets.tcgdex.net/en/neo/neo1/23', 'Ken Sugimori', 'Rare', 3.47, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-23', 240, 30, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-24', 24, 'Murkrow', 'https://assets.tcgdex.net/en/neo/neo1/24', 'Shin-ichi Yoshida', 'Rare', 8.21,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-24', 198, 50, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-25', 25, 'Sneasel', 'https://assets.tcgdex.net/en/neo/neo1/25', 'Ken Sugimori', 'Rare', 1.65, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-25', 215, 60, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-26', 26, 'Aipom', 'https://assets.tcgdex.net/en/neo/neo1/26', 'Hironobu Yoshida', 'Uncommon', 2.72,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-26', 190, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-27', 27, 'Ariados', 'https://assets.tcgdex.net/en/neo/neo1/27', 'Ken Sugimori', 'Uncommon', 3.37,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-27', 168, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-28', 28, 'Bayleef', 'https://assets.tcgdex.net/en/neo/neo1/28', 'Ken Sugimori', 'Uncommon', 6.65,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-28', 153, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-29', 29, 'Bayleef', 'https://assets.tcgdex.net/en/neo/neo1/29', 'Ken Sugimori', 'Uncommon', 1.4,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-29', 153, 80, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-30', 30, 'Clefairy', 'https://assets.tcgdex.net/en/neo/neo1/30', 'Sumiyoshi Kizuki', 'Uncommon', 7.53,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-30', 35, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-31', 31, 'Croconaw', 'https://assets.tcgdex.net/en/neo/neo1/31', 'Ken Sugimori', 'Uncommon', 7.88,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-31', 159, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-32', 32, 'Croconaw', 'https://assets.tcgdex.net/en/neo/neo1/32', 'Ken Sugimori', 'Uncommon', 3.93,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-32', 159, 80, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-33', 33, 'Electabuzz', 'https://assets.tcgdex.net/en/neo/neo1/33', 'Shin-ichi Yoshida', 'Uncommon', 7.06,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-33', 125, 70, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-34', 34, 'Flaaffy', 'https://assets.tcgdex.net/en/neo/neo1/34', 'Ken Sugimori', 'Uncommon', 3.46,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-34', 180, 60, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-35', 35, 'Furret', 'https://assets.tcgdex.net/en/neo/neo1/35', 'Ken Sugimori', 'Uncommon', 9.82,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-35', 162, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-36', 36, 'Gloom', 'https://assets.tcgdex.net/en/neo/neo1/36', 'Mitsuhiro Arita', 'Uncommon', 8.0,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-36', 44, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-37', 37, 'Granbull', 'https://assets.tcgdex.net/en/neo/neo1/37', 'Ken Sugimori', 'Uncommon', 6.02,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-37', 210, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-38', 38, 'Lanturn', 'https://assets.tcgdex.net/en/neo/neo1/38', 'Ken Sugimori', 'Uncommon', 4.38,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-38', 171, 70, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-39', 39, 'Ledian', 'https://assets.tcgdex.net/en/neo/neo1/39', 'Ken Sugimori', 'Uncommon', 7.79,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-39', 166, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-40', 40, 'Magmar', 'https://assets.tcgdex.net/en/neo/neo1/40', 'Naoyo Kimura', 'Uncommon', 2.82,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-40', 126, 70, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-41', 41, 'Miltank', 'https://assets.tcgdex.net/en/neo/neo1/41', 'Ken Sugimori', 'Uncommon', 3.61,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-41', 241, 70, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-42', 42, 'Noctowl', 'https://assets.tcgdex.net/en/neo/neo1/42', 'Ken Sugimori', 'Uncommon', 2.42,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-42', 164, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-43', 43, 'Phanpy', 'https://assets.tcgdex.net/en/neo/neo1/43', 'Ken Sugimori', 'Uncommon', 8.55,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-43', 231, 40, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-44', 44, 'Piloswine', 'https://assets.tcgdex.net/en/neo/neo1/44', 'Ken Sugimori', 'Uncommon', 4.36,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-44', 221, 80, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-45', 45, 'Quagsire', 'https://assets.tcgdex.net/en/neo/neo1/45', 'Atsuko Nishida', 'Uncommon', 7.33,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-45', 195, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-46', 46, 'Quilava', 'https://assets.tcgdex.net/en/neo/neo1/46', 'Ken Sugimori', 'Uncommon', 3.95,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-46', 156, 60, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-47', 47, 'Quilava', 'https://assets.tcgdex.net/en/neo/neo1/47', 'Ken Sugimori', 'Uncommon', 4.99,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-47', 156, 70, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-48', 48, 'Seadra', 'https://assets.tcgdex.net/en/neo/neo1/48', 'Shin-ichi Yoshida', 'Uncommon', 1.47,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-48', 117, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-49', 49, 'Skiploom', 'https://assets.tcgdex.net/en/neo/neo1/49', 'Atsuko Nishida', 'Uncommon', 4.94,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-49', 188, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-50', 50, 'Sunflora', 'https://assets.tcgdex.net/en/neo/neo1/50', 'Kagemaru Himeno', 'Uncommon', 2.35,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-50', 192, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-51', 51, 'Togepi', 'https://assets.tcgdex.net/en/neo/neo1/51', 'Naoyo Kimura', 'Uncommon', 7.5, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-51', 175, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-52', 52, 'Xatu', 'https://assets.tcgdex.net/en/neo/neo1/52', 'Ken Sugimori', 'Uncommon', 9.51, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-52', 178, 80, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-53', 53, 'Chikorita', 'https://assets.tcgdex.net/en/neo/neo1/53', 'Naoyo Kimura', 'Common', 3.17,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-53', 152, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-54', 54, 'Chikorita', 'https://assets.tcgdex.net/en/neo/neo1/54', 'Ken Sugimori', 'Common', 5.94,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-54', 152, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-55', 55, 'Chinchou', 'https://assets.tcgdex.net/en/neo/neo1/55', 'Ken Sugimori', 'Common', 4.22,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-55', 170, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-56', 56, 'Cyndaquil', 'https://assets.tcgdex.net/en/neo/neo1/56', 'Ken Sugimori', 'Common', 5.71,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-56', 155, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-57', 57, 'Cyndaquil', 'https://assets.tcgdex.net/en/neo/neo1/57', 'Shin-ichi Yoshida', 'Common', 2.25,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-57', 155, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-58', 58, 'Girafarig', 'https://assets.tcgdex.net/en/neo/neo1/58', 'Ken Sugimori', 'Common', 7.48,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-58', 203, 60, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-59', 59, 'Gligar', 'https://assets.tcgdex.net/en/neo/neo1/59', 'Hironobu Yoshida', 'Common', 5.59,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-59', 207, 60, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-60', 60, 'Hoothoot', 'https://assets.tcgdex.net/en/neo/neo1/60', 'Sumiyoshi Kizuki', 'Common', 8.75,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-60', 163, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-61', 61, 'Hoppip', 'https://assets.tcgdex.net/en/neo/neo1/61', 'Atsuko Nishida', 'Common', 7.59,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-61', 187, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-62', 62, 'Horsea', 'https://assets.tcgdex.net/en/neo/neo1/62', 'Miki Tanaka', 'Common', 3.68, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-62', 116, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-63', 63, 'Ledyba', 'https://assets.tcgdex.net/en/neo/neo1/63', 'Sumiyoshi Kizuki', 'Common', 4.59,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-63', 165, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-64', 64, 'Mantine', 'https://assets.tcgdex.net/en/neo/neo1/64', 'Ken Sugimori', 'Common', 9.43, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-64', 226, 60, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-65', 65, 'Mareep', 'https://assets.tcgdex.net/en/neo/neo1/65', 'Ken Sugimori', 'Common', 7.33, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-65', 179, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-66', 66, 'Marill', 'https://assets.tcgdex.net/en/neo/neo1/66', 'Atsuko Nishida', 'Common', 5.73,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-66', 183, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-67', 67, 'Natu', 'https://assets.tcgdex.net/en/neo/neo1/67', 'Ken Sugimori', 'Common', 2.19, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-67', 177, 30, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-68', 68, 'Oddish', 'https://assets.tcgdex.net/en/neo/neo1/68', 'Sumiyoshi Kizuki', 'Common', 10.2,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-68', 43, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-69', 69, 'Onix', 'https://assets.tcgdex.net/en/neo/neo1/69', 'Mitsuhiro Arita', 'Common', 3.87, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-69', 95, 60, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-70', 70, 'Pikachu', 'https://assets.tcgdex.net/en/neo/neo1/70', 'Naoyo Kimura', 'Common', 2.2, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-70', 25, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-71', 71, 'Sentret', 'https://assets.tcgdex.net/en/neo/neo1/71', 'Ken Sugimori', 'Common', 9.19, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-71', 161, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-72', 72, 'Shuckle', 'https://assets.tcgdex.net/en/neo/neo1/72', 'Ken Sugimori', 'Common', 5.39, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-72', 213, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-73', 73, 'Slowpoke', 'https://assets.tcgdex.net/en/neo/neo1/73', 'Tomokazu Komiya', 'Common', 1.15,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-73', 79, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-74', 74, 'Snubbull', 'https://assets.tcgdex.net/en/neo/neo1/74', 'Mitsuhiro Arita', 'Common', 10.43,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-74', 209, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-75', 75, 'Spinarak', 'https://assets.tcgdex.net/en/neo/neo1/75', 'Ken Sugimori', 'Common', 7.38,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-75', 167, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-76', 76, 'Stantler', 'https://assets.tcgdex.net/en/neo/neo1/76', 'Ken Sugimori', 'Common', 2.57,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-76', 234, 60, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-77', 77, 'Sudowoodo', 'https://assets.tcgdex.net/en/neo/neo1/77', 'Ken Sugimori', 'Common', 6.2,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-77', 185, 60, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-78', 78, 'Sunkern', 'https://assets.tcgdex.net/en/neo/neo1/78', 'Kagemaru Himeno', 'Common', 7.75,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-78', 191, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-79', 79, 'Swinub', 'https://assets.tcgdex.net/en/neo/neo1/79', 'Ken Sugimori', 'Common', 6.23, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-79', 220, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-80', 80, 'Totodile', 'https://assets.tcgdex.net/en/neo/neo1/80', 'Ken Sugimori', 'Common', 6.17,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-80', 158, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-81', 81, 'Totodile', 'https://assets.tcgdex.net/en/neo/neo1/81', 'Hironobu Yoshida', 'Common', 8.65,
        'POKEMON', 'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-81', 158, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-82', 82, 'Wooper', 'https://assets.tcgdex.net/en/neo/neo1/82', 'Miki Tanaka', 'Common', 4.83, 'POKEMON',
        'neo1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('neo1-82', 194, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-83', 83, 'Arcade Game', 'https://assets.tcgdex.net/en/neo/neo1/83', 'Unknown', 'Rare', 4.64, 'TRAINER',
        'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-83', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-84', 84, 'Ecogym', 'https://assets.tcgdex.net/en/neo/neo1/84', 'Unknown', 'Rare', 3.62, 'TRAINER',
        'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-84', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-85', 85, 'Energy Charge', 'https://assets.tcgdex.net/en/neo/neo1/85', 'Keiji Kinebuchi', 'Rare', 7.67,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-85', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-86', 86, 'Focus Band', 'https://assets.tcgdex.net/en/neo/neo1/86', 'Tomokazu Komiya', 'Rare', 3.69,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-86', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-87', 87, 'Mary', 'https://assets.tcgdex.net/en/neo/neo1/87', 'Ken Sugimori', 'Rare', 8.45, 'TRAINER',
        'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-87', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-88', 88, 'PokéGear', 'https://assets.tcgdex.net/en/neo/neo1/88', 'Unknown', 'Rare', 5.16, 'TRAINER',
        'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-88', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-89', 89, 'Super Energy Retrieval', 'https://assets.tcgdex.net/en/neo/neo1/89', 'Keiji Kinebuchi', 'Rare',
        8.2, 'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-89', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-90', 90, 'Time Capsule', 'https://assets.tcgdex.net/en/neo/neo1/90', 'Unknown', 'Rare', 2.99, 'TRAINER',
        'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-90', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-91', 91, 'Bill''s Teleporter', 'https://assets.tcgdex.net/en/neo/neo1/91', 'Keiji Kinebuchi', 'Uncommon',
        5.16, 'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-91', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-92', 92, 'Card-Flip Game', 'https://assets.tcgdex.net/en/neo/neo1/92', 'Unknown', 'Uncommon', 9.9,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-92', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-93', 93, 'Gold Berry', 'https://assets.tcgdex.net/en/neo/neo1/93', 'Unknown', 'Uncommon', 3.69, 'TRAINER',
        'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-93', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-94', 94, 'Miracle Berry', 'https://assets.tcgdex.net/en/neo/neo1/94', 'Unknown', 'Uncommon', 7.06,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-94', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-95', 95, 'New Pokédex', 'https://assets.tcgdex.net/en/neo/neo1/95', 'Keiji Kinebuchi', 'Uncommon', 4.35,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-95', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-96', 96, 'Professor Elm', 'https://assets.tcgdex.net/en/neo/neo1/96', 'Ken Sugimori', 'Uncommon', 4.37,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-96', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-97', 97, 'Sprout Tower', 'https://assets.tcgdex.net/en/neo/neo1/97', 'Unknown', 'Uncommon', 4.39,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-97', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-98', 98, 'Super Scoop Up', 'https://assets.tcgdex.net/en/neo/neo1/98', 'Keiji Kinebuchi', 'Uncommon',
        4.51, 'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-98', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-99', 99, 'Berry', 'https://assets.tcgdex.net/en/neo/neo1/99', 'Unknown', 'Common', 9.38, 'TRAINER',
        'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-99', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-100', 100, 'Double Gust', 'https://assets.tcgdex.net/en/neo/neo1/100', 'Tomokazu Komiya', 'Common', 2.15,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-100', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-101', 101, 'Moo-Moo Milk', 'https://assets.tcgdex.net/en/neo/neo1/101', 'Tomokazu Komiya', 'Common', 8.58,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-101', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-102', 102, 'Pokémon March', 'https://assets.tcgdex.net/en/neo/neo1/102', 'Tomokazu Komiya', 'Common',
        2.54, 'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-102', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-103', 103, 'Super Rod', 'https://assets.tcgdex.net/en/neo/neo1/103', 'Keiji Kinebuchi', 'Common', 9.2,
        'TRAINER', 'neo1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('neo1-103', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-104', 104, 'Darkness Energy', 'https://assets.tcgdex.net/en/neo/neo1/104', 'Milky Isobe', 'Rare', 9.0,
        'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-104', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-105', 105, 'Recycle Energy', 'https://assets.tcgdex.net/en/neo/neo1/105', 'Hideki Kazama', 'Rare', 8.34,
        'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-105', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-106', 106, 'Fighting Energy', 'https://assets.tcgdex.net/en/neo/neo1/106', 'Keiji Kinebuchi', 'Common',
        9.05, 'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-106', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-107', 107, 'Fire Energy', 'https://assets.tcgdex.net/en/neo/neo1/107', 'Keiji Kinebuchi', 'Common', 3.93,
        'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-107', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-108', 108, 'Grass Energy', 'https://assets.tcgdex.net/en/neo/neo1/108', 'Keiji Kinebuchi', 'Common', 5.09,
        'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-108', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-109', 109, 'Lightning Energy', 'https://assets.tcgdex.net/en/neo/neo1/109', 'Keiji Kinebuchi', 'Common',
        7.53, 'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-109', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-110', 110, 'Psychic Energy', 'https://assets.tcgdex.net/en/neo/neo1/110', 'Keiji Kinebuchi', 'Common',
        9.62, 'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-110', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('neo1-111', 111, 'Water Energy', 'https://assets.tcgdex.net/en/neo/neo1/111', 'Keiji Kinebuchi', 'Common', 6.72,
        'ENERGY', 'neo1');
INSERT INTO energies (card_id, effect, type)
VALUES ('neo1-111', 'Provides energy', 'Normal');


-- Serie: Legendary Collection
INSERT INTO series (id, name, logo_url)
VALUES ('lc', 'Legendary Collection', 'https://assets.tcgdex.net/en/lc/lc/logo');

-- Set: Legendary Collection
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('lc', 'Legendary Collection', 'https://assets.tcgdex.net/en/lc/lc/logo', NOW(), 'lc');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-1', 1, 'Alakazam', 'https://assets.tcgdex.net/en/lc/lc/1', 'Ken Sugimori', 'Rare', 10.6, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-1', 65, 80, 'Psychic', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-2', 2, 'Articuno', 'https://assets.tcgdex.net/en/lc/lc/2', 'Mitsuhiro Arita', 'Rare', 2.09, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-2', 144, 70, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-3', 3, 'Charizard', 'https://assets.tcgdex.net/en/lc/lc/3', 'Mitsuhiro Arita', 'Rare', 10.92, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-3', 6, 120, 'Fire', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-4', 4, 'Dark Blastoise', 'https://assets.tcgdex.net/en/lc/lc/4', 'Mitsuhiro Arita', 'Rare', 4.87, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-4', 9, 70, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-5', 5, 'Dark Dragonite', 'https://assets.tcgdex.net/en/lc/lc/5', 'Mitsuhiro Arita', 'Rare', 10.28,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-5', 149, 70, 'Colorless', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-6', 6, 'Dark Persian', 'https://assets.tcgdex.net/en/lc/lc/6', 'Shin-ichi Yoshida', 'Rare', 7.41, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-6', 53, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-7', 7, 'Dark Raichu', 'https://assets.tcgdex.net/en/lc/lc/7', 'Mitsuhiro Arita', 'Rare', 5.4, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-7', 26, 70, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-8', 8, 'Dark Slowbro', 'https://assets.tcgdex.net/en/lc/lc/8', 'Mitsuhiro Arita', 'Rare', 2.83, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-8', 80, 60, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-9', 9, 'Dark Vaporeon', 'https://assets.tcgdex.net/en/lc/lc/9', 'Mitsuhiro Arita', 'Rare', 7.44, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-9', 134, 60, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-10', 10, 'Flareon', 'https://assets.tcgdex.net/en/lc/lc/10', 'Kagemaru Himeno', 'Rare', 2.58, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-10', 136, 70, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-11', 11, 'Gengar', 'https://assets.tcgdex.net/en/lc/lc/11', 'Keiji Kinebuchi', 'Rare', 8.51, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-11', 94, 80, 'Psychic', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-12', 12, 'Gyarados', 'https://assets.tcgdex.net/en/lc/lc/12', 'Mitsuhiro Arita', 'Rare', 7.91, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-12', 130, 100, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-13', 13, 'Hitmonlee', 'https://assets.tcgdex.net/en/lc/lc/13', 'Ken Sugimori', 'Rare', 4.83, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-13', 106, 60, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-14', 14, 'Jolteon', 'https://assets.tcgdex.net/en/lc/lc/14', 'Kagemaru Himeno', 'Rare', 5.16, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-14', 135, 70, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-15', 15, 'Machamp', 'https://assets.tcgdex.net/en/lc/lc/15', 'Ken Sugimori', 'Rare', 2.23, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-15', 68, 100, 'Fighting', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-16', 16, 'Muk', 'https://assets.tcgdex.net/en/lc/lc/16', 'Mitsuhiro Arita', 'Rare', 5.53, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-16', 89, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-17', 17, 'Ninetales', 'https://assets.tcgdex.net/en/lc/lc/17', 'Ken Sugimori', 'Rare', 8.96, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-17', 38, 80, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-18', 18, 'Venusaur', 'https://assets.tcgdex.net/en/lc/lc/18', 'Mitsuhiro Arita', 'Rare', 2.61, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-18', 3, 100, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-19', 19, 'Zapdos', 'https://assets.tcgdex.net/en/lc/lc/19', 'Ken Sugimori', 'Rare', 2.77, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-19', 145, 90, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-20', 20, 'Beedrill', 'https://assets.tcgdex.net/en/lc/lc/20', 'Ken Sugimori', 'Rare', 3.57, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-20', 15, 80, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-21', 21, 'Butterfree', 'https://assets.tcgdex.net/en/lc/lc/21', 'Kagemaru Himeno', 'Rare', 6.5, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-21', 12, 70, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-22', 22, 'Electrode', 'https://assets.tcgdex.net/en/lc/lc/22', 'Mitsuhiro Arita', 'Rare', 7.01, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-22', 101, 90, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-23', 23, 'Exeggutor', 'https://assets.tcgdex.net/en/lc/lc/23', 'Kagemaru Himeno', 'Rare', 8.83, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-23', 103, 80, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-24', 24, 'Golem', 'https://assets.tcgdex.net/en/lc/lc/24', 'Kagemaru Himeno', 'Rare', 5.06, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-24', 76, 80, 'Fighting', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-25', 25, 'Hypno', 'https://assets.tcgdex.net/en/lc/lc/25', 'Ken Sugimori', 'Rare', 3.25, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-25', 97, 90, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-26', 26, 'Jynx', 'https://assets.tcgdex.net/en/lc/lc/26', 'Ken Sugimori', 'Rare', 4.85, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-26', 124, 70, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-27', 27, 'Kabutops', 'https://assets.tcgdex.net/en/lc/lc/27', 'Ken Sugimori', 'Rare', 8.13, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-27', 141, 60, 'Fighting', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-28', 28, 'Magneton', 'https://assets.tcgdex.net/en/lc/lc/28', 'Ken Sugimori', 'Rare', 10.2, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-28', 82, 80, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-29', 29, 'Mewtwo', 'https://assets.tcgdex.net/en/lc/lc/29', 'Christopher Rush', 'Rare', 5.25, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-29', 150, 60, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-30', 30, 'Moltres', 'https://assets.tcgdex.net/en/lc/lc/30', 'Mitsuhiro Arita', 'Rare', 5.97, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-30', 146, 70, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-31', 31, 'Nidoking', 'https://assets.tcgdex.net/en/lc/lc/31', 'Ken Sugimori', 'Rare', 10.9, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-31', 34, 90, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-32', 32, 'Nidoqueen', 'https://assets.tcgdex.net/en/lc/lc/32', 'Ken Sugimori', 'Rare', 6.35, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-32', 31, 90, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-33', 33, 'Pidgeot', 'https://assets.tcgdex.net/en/lc/lc/33', 'Kagemaru Himeno', 'Rare', 7.27, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-33', 18, 80, 'Colorless', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-34', 34, 'Pidgeotto', 'https://assets.tcgdex.net/en/lc/lc/34', 'Ken Sugimori', 'Rare', 2.16, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-34', 17, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-35', 35, 'Rhydon', 'https://assets.tcgdex.net/en/lc/lc/35', 'Kagemaru Himeno', 'Rare', 10.11, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-35', 112, 100, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-36', 36, 'Arcanine', 'https://assets.tcgdex.net/en/lc/lc/36', 'Ken Sugimori', 'Uncommon', 3.35, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-36', 59, 100, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-37', 37, 'Charmeleon', 'https://assets.tcgdex.net/en/lc/lc/37', 'Mitsuhiro Arita', 'Uncommon', 1.77,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-37', 5, 80, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-38', 38, 'Dark Dragonair', 'https://assets.tcgdex.net/en/lc/lc/38', 'Kagemaru Himeno', 'Uncommon', 9.81,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-38', 148, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-39', 39, 'Dark Wartortle', 'https://assets.tcgdex.net/en/lc/lc/39', 'Kagemaru Himeno', 'Uncommon', 5.42,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-39', 8, 60, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-40', 40, 'Dewgong', 'https://assets.tcgdex.net/en/lc/lc/40', 'Mitsuhiro Arita', 'Uncommon', 8.89, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-40', 87, 80, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-41', 41, 'Dodrio', 'https://assets.tcgdex.net/en/lc/lc/41', 'Mitsuhiro Arita', 'Uncommon', 7.28, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-41', 85, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-42', 42, 'Fearow', 'https://assets.tcgdex.net/en/lc/lc/42', 'Mitsuhiro Arita', 'Uncommon', 2.16, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-42', 22, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-43', 43, 'Golduck', 'https://assets.tcgdex.net/en/lc/lc/43', 'Kagemaru Himeno', 'Uncommon', 1.66, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-43', 55, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-44', 44, 'Graveler', 'https://assets.tcgdex.net/en/lc/lc/44', 'Kagemaru Himeno', 'Uncommon', 10.06,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-44', 75, 60, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-45', 45, 'Growlithe', 'https://assets.tcgdex.net/en/lc/lc/45', 'Ken Sugimori', 'Uncommon', 8.72, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-45', 58, 60, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-46', 46, 'Haunter', 'https://assets.tcgdex.net/en/lc/lc/46', 'Ken Sugimori', 'Uncommon', 4.92, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-46', 93, 50, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-47', 47, 'Ivysaur', 'https://assets.tcgdex.net/en/lc/lc/47', 'Ken Sugimori', 'Uncommon', 2.18, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-47', 2, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-48', 48, 'Kabuto', 'https://assets.tcgdex.net/en/lc/lc/48', 'Ken Sugimori', 'Uncommon', 2.41, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-48', 140, 30, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-49', 49, 'Kadabra', 'https://assets.tcgdex.net/en/lc/lc/49', 'Ken Sugimori', 'Uncommon', 8.41, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-49', 64, 60, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-50', 50, 'Kakuna', 'https://assets.tcgdex.net/en/lc/lc/50', 'Keiji Kinebuchi', 'Uncommon', 9.55, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-50', 14, 80, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-51', 51, 'Machoke', 'https://assets.tcgdex.net/en/lc/lc/51', 'Ken Sugimori', 'Uncommon', 3.63, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-51', 67, 80, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-52', 52, 'Magikarp', 'https://assets.tcgdex.net/en/lc/lc/52', 'Mitsuhiro Arita', 'Uncommon', 7.27,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-52', 129, 30, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-53', 53, 'Meowth', 'https://assets.tcgdex.net/en/lc/lc/53', 'Mitsuhiro Arita', 'Uncommon', 6.51, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-53', 52, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-54', 54, 'Metapod', 'https://assets.tcgdex.net/en/lc/lc/54', 'Ken Sugimori', 'Uncommon', 5.45, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-54', 11, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-55', 55, 'Nidorina', 'https://assets.tcgdex.net/en/lc/lc/55', 'Ken Sugimori', 'Uncommon', 9.43, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-55', 30, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-56', 56, 'Nidorino', 'https://assets.tcgdex.net/en/lc/lc/56', 'Mitsuhiro Arita', 'Uncommon', 2.32,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-56', 33, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-57', 57, 'Omanyte', 'https://assets.tcgdex.net/en/lc/lc/57', 'Kagemaru Himeno', 'Uncommon', 7.28, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-57', 138, 40, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-58', 58, 'Omastar', 'https://assets.tcgdex.net/en/lc/lc/58', 'Ken Sugimori', 'Uncommon', 3.23, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-58', 139, 70, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-59', 59, 'Primeape', 'https://assets.tcgdex.net/en/lc/lc/59', 'Kagemaru Himeno', 'Uncommon', 7.88,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-59', 57, 70, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-60', 60, 'Rapidash', 'https://assets.tcgdex.net/en/lc/lc/60', 'Mitsuhiro Arita', 'Uncommon', 1.52,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-60', 78, 70, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-61', 61, 'Raticate', 'https://assets.tcgdex.net/en/lc/lc/61', 'Ken Sugimori', 'Uncommon', 3.87, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-61', 20, 60, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-62', 62, 'Sandslash', 'https://assets.tcgdex.net/en/lc/lc/62', 'Ken Sugimori', 'Uncommon', 8.48, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-62', 28, 70, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-63', 63, 'Seadra', 'https://assets.tcgdex.net/en/lc/lc/63', 'Ken Sugimori', 'Uncommon', 10.99, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-63', 117, 60, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-64', 64, 'Snorlax', 'https://assets.tcgdex.net/en/lc/lc/64', 'Ken Sugimori', 'Uncommon', 2.18, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-64', 143, 90, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-65', 65, 'Tauros', 'https://assets.tcgdex.net/en/lc/lc/65', 'Kagemaru Himeno', 'Uncommon', 3.7, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-65', 128, 60, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-66', 66, 'Tentacruel', 'https://assets.tcgdex.net/en/lc/lc/66', 'Kagemaru Himeno', 'Uncommon', 3.05,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-66', 73, 60, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-67', 67, 'Abra', 'https://assets.tcgdex.net/en/lc/lc/67', 'Mitsuhiro Arita', 'Common', 1.76, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-67', 63, 30, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-68', 68, 'Bulbasaur', 'https://assets.tcgdex.net/en/lc/lc/68', 'Mitsuhiro Arita', 'Common', 6.5, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-68', 1, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-69', 69, 'Caterpie', 'https://assets.tcgdex.net/en/lc/lc/69', 'Ken Sugimori', 'Common', 3.95, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-69', 10, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-70', 70, 'Charmander', 'https://assets.tcgdex.net/en/lc/lc/70', 'Mitsuhiro Arita', 'Common', 6.03,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-70', 4, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-71', 71, 'Doduo', 'https://assets.tcgdex.net/en/lc/lc/71', 'Mitsuhiro Arita', 'Common', 3.47, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-71', 84, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-72', 72, 'Dratini', 'https://assets.tcgdex.net/en/lc/lc/72', 'Ken Sugimori', 'Common', 10.56, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-72', 147, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-73', 73, 'Drowzee', 'https://assets.tcgdex.net/en/lc/lc/73', 'Ken Sugimori', 'Common', 6.37, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-73', 96, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-74', 74, 'Eevee', 'https://assets.tcgdex.net/en/lc/lc/74', 'Kagemaru Himeno', 'Common', 6.72, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-74', 133, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-75', 75, 'Exeggcute', 'https://assets.tcgdex.net/en/lc/lc/75', 'Mitsuhiro Arita', 'Common', 10.09,
        'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-75', 102, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-76', 76, 'Gastly', 'https://assets.tcgdex.net/en/lc/lc/76', 'Keiji Kinebuchi', 'Common', 1.36, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-76', 92, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-77', 77, 'Geodude', 'https://assets.tcgdex.net/en/lc/lc/77', 'Kagemaru Himeno', 'Common', 5.81, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-77', 74, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-78', 78, 'Grimer', 'https://assets.tcgdex.net/en/lc/lc/78', 'Mitsuhiro Arita', 'Common', 10.58, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-78', 88, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-79', 79, 'Machop', 'https://assets.tcgdex.net/en/lc/lc/79', 'Mitsuhiro Arita', 'Common', 7.99, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-79', 66, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-80', 80, 'Magnemite', 'https://assets.tcgdex.net/en/lc/lc/80', 'Keiji Kinebuchi', 'Common', 3.86, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-80', 81, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-81', 81, 'Mankey', 'https://assets.tcgdex.net/en/lc/lc/81', 'Kagemaru Himeno', 'Common', 4.87, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-81', 56, 30, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-82', 82, 'Nidoran♀', 'https://assets.tcgdex.net/en/lc/lc/82', 'Ken Sugimori', 'Common', 9.98, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-82', 29, 60, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-83', 83, 'Nidoran♂', 'https://assets.tcgdex.net/en/lc/lc/83', 'Ken Sugimori', 'Common', 1.56, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-83', 32, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-84', 84, 'Onix', 'https://assets.tcgdex.net/en/lc/lc/84', 'Ken Sugimori', 'Common', 9.93, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-84', 95, 90, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-85', 85, 'Pidgey', 'https://assets.tcgdex.net/en/lc/lc/85', 'Ken Sugimori', 'Common', 5.62, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-85', 16, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-86', 86, 'Pikachu', 'https://assets.tcgdex.net/en/lc/lc/86', 'Ken Sugimori', 'Common', 8.18, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-86', 25, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-87', 87, 'Ponyta', 'https://assets.tcgdex.net/en/lc/lc/87', 'Ken Sugimori', 'Common', 6.38, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-87', 77, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-88', 88, 'Psyduck', 'https://assets.tcgdex.net/en/lc/lc/88', 'Kagemaru Himeno', 'Common', 1.81, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-88', 54, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-89', 89, 'Rattata', 'https://assets.tcgdex.net/en/lc/lc/89', 'Mitsuhiro Arita', 'Common', 5.94, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-89', 19, 30, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-90', 90, 'Rhyhorn', 'https://assets.tcgdex.net/en/lc/lc/90', 'Mitsuhiro Arita', 'Common', 5.83, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-90', 111, 70, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-91', 91, 'Sandshrew', 'https://assets.tcgdex.net/en/lc/lc/91', 'Ken Sugimori', 'Common', 5.2, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-91', 27, 40, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-92', 92, 'Seel', 'https://assets.tcgdex.net/en/lc/lc/92', 'Ken Sugimori', 'Common', 10.08, 'POKEMON', 'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-92', 86, 60, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-93', 93, 'Slowpoke', 'https://assets.tcgdex.net/en/lc/lc/93', 'Miki Tanaka', 'Common', 10.01, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-93', 79, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-94', 94, 'Spearow', 'https://assets.tcgdex.net/en/lc/lc/94', 'Mitsuhiro Arita', 'Common', 1.29, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-94', 21, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-95', 95, 'Squirtle', 'https://assets.tcgdex.net/en/lc/lc/95', 'Mitsuhiro Arita', 'Common', 6.51, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-95', 7, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-96', 96, 'Tentacool', 'https://assets.tcgdex.net/en/lc/lc/96', 'Kagemaru Himeno', 'Common', 5.75, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-96', 72, 30, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-97', 97, 'Voltorb', 'https://assets.tcgdex.net/en/lc/lc/97', 'Keiji Kinebuchi', 'Common', 6.49, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-97', 100, 40, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-98', 98, 'Vulpix', 'https://assets.tcgdex.net/en/lc/lc/98', 'Ken Sugimori', 'Common', 10.41, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-98', 37, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-99', 99, 'Weedle', 'https://assets.tcgdex.net/en/lc/lc/99', 'Mitsuhiro Arita', 'Common', 3.86, 'POKEMON',
        'lc');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('lc-99', 13, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-100', 100, 'Full Heal Energy', 'https://assets.tcgdex.net/en/lc/lc/100', 'Keiji Kinebuchi', 'Uncommon',
        1.96, 'ENERGY', 'lc');
INSERT INTO energies (card_id, effect, type)
VALUES ('lc-100', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-101', 101, 'Potion Energy', 'https://assets.tcgdex.net/en/lc/lc/101', 'Keiji Kinebuchi', 'Uncommon', 8.67,
        'ENERGY', 'lc');
INSERT INTO energies (card_id, effect, type)
VALUES ('lc-101', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-102', 102, 'Pokémon Breeder', 'https://assets.tcgdex.net/en/lc/lc/102', 'Ken Sugimori', 'Rare', 6.34,
        'TRAINER', 'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-102', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-103', 103, 'Pokémon Trader', 'https://assets.tcgdex.net/en/lc/lc/103', 'Ken Sugimori', 'Rare', 3.54,
        'TRAINER', 'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-103', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-104', 104, 'Scoop Up', 'https://assets.tcgdex.net/en/lc/lc/104', 'Keiji Kinebuchi', 'Rare', 9.41, 'TRAINER',
        'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-104', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-105', 105, 'The Boss''s Way', 'https://assets.tcgdex.net/en/lc/lc/105', 'Ken Sugimori', 'Uncommon', 9.27,
        'TRAINER', 'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-105', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-106', 106, 'Challenge!', 'https://assets.tcgdex.net/en/lc/lc/106', 'Kagemaru Himeno', 'Uncommon', 6.9,
        'TRAINER', 'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-106', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-107', 107, 'Energy Retrieval', 'https://assets.tcgdex.net/en/lc/lc/107', 'Keiji Kinebuchi', 'Uncommon',
        5.28, 'TRAINER', 'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-107', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-108', 108, 'Bill', 'https://assets.tcgdex.net/en/lc/lc/108', 'Ken Sugimori', 'Common', 10.49, 'TRAINER',
        'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-108', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-109', 109, 'Mysterious Fossil', 'https://assets.tcgdex.net/en/lc/lc/109', 'Keiji Kinebuchi', 'Common', 2.05,
        'TRAINER', 'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-109', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('lc-110', 110, 'Potion', 'https://assets.tcgdex.net/en/lc/lc/110', 'Keiji Kinebuchi', 'Common', 5.33, 'TRAINER',
        'lc');
INSERT INTO trainers (card_id, effect, type)
VALUES ('lc-110', 'No effect', 'Supporter');


-- Serie: E-Card
INSERT INTO series (id, name, logo_url)
VALUES ('ecard', 'E-Card', 'https://assets.tcgdex.net/en/ecard/ecard1/logo');

-- Set: Sample
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('sp', 'Sample', NULL, NOW(), 'ecard');


-- Serie: EX
INSERT INTO series (id, name, logo_url)
VALUES ('ex', 'EX', 'https://assets.tcgdex.net/en/ex/ex1/logo');

-- Set: Ruby & Sapphire
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('ex1', 'Ruby & Sapphire', 'https://assets.tcgdex.net/en/ex/ex1/logo', NOW(), 'ex');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-1', 1, 'Aggron', 'https://assets.tcgdex.net/en/ex/ex1/1', 'Mitsuhiro Arita', 'Rare', 9.82, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-1', 306, 110, 'Metal', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-2', 2, 'Beautifly', 'https://assets.tcgdex.net/en/ex/ex1/2', 'Hajime Kusajima', 'Rare', 5.97, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-2', 267, 80, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-3', 3, 'Blaziken', 'https://assets.tcgdex.net/en/ex/ex1/3', 'Kouki Saitou', 'Rare', 3.18, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-3', 257, 100, 'Fire', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-4', 4, 'Camerupt', 'https://assets.tcgdex.net/en/ex/ex1/4', 'Ken Sugimori', 'Rare', 8.45, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-4', 323, 90, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-5', 5, 'Delcatty', 'https://assets.tcgdex.net/en/ex/ex1/5', 'Atsuko Nishida', 'Rare', 4.86, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-5', 301, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-6', 6, 'Dustox', 'https://assets.tcgdex.net/en/ex/ex1/6', 'Midori Harada', 'Rare', 5.91, 'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-6', 269, 90, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-7', 7, 'Gardevoir', 'https://assets.tcgdex.net/en/ex/ex1/7', 'Ken Sugimori', 'Rare', 8.06, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-7', 282, 100, 'Psychic', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-8', 8, 'Hariyama', 'https://assets.tcgdex.net/en/ex/ex1/8', 'Naoyo Kimura', 'Rare', 5.13, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-8', 297, 90, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-9', 9, 'Manectric', 'https://assets.tcgdex.net/en/ex/ex1/9', 'Mitsuhiro Arita', 'Rare', 1.15, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-9', 310, 70, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-10', 10, 'Mightyena', 'https://assets.tcgdex.net/en/ex/ex1/10', 'Atsuko Nishida', 'Rare', 1.81, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-10', 262, 70, 'Darkness', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-11', 11, 'Sceptile', 'https://assets.tcgdex.net/en/ex/ex1/11', 'Midori Harada', 'Rare', 2.35, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-11', 254, 120, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-12', 12, 'Slaking', 'https://assets.tcgdex.net/en/ex/ex1/12', 'Ken Sugimori', 'Rare', 4.88, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-12', 289, 120, 'Colorless', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-13', 13, 'Swampert', 'https://assets.tcgdex.net/en/ex/ex1/13', 'Mitsuhiro Arita', 'Rare', 3.52, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-13', 260, 110, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-14', 14, 'Wailord', 'https://assets.tcgdex.net/en/ex/ex1/14', 'Ken Sugimori', 'Rare', 10.6, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-14', 321, 120, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-15', 15, 'Blaziken', 'https://assets.tcgdex.net/en/ex/ex1/15', 'Ken Sugimori', 'Rare', 2.45, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-15', 257, 110, 'Fire', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-16', 16, 'Breloom', 'https://assets.tcgdex.net/en/ex/ex1/16', 'Ken Sugimori', 'Rare', 7.79, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-16', 286, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-17', 17, 'Donphan', 'https://assets.tcgdex.net/en/ex/ex1/17', 'Kagemaru Himeno', 'Rare', 6.91, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-17', 232, 80, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-18', 18, 'Nosepass', 'https://assets.tcgdex.net/en/ex/ex1/18', 'Mitsuhiro Arita', 'Rare', 9.68, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-18', 299, 60, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-19', 19, 'Pelipper', 'https://assets.tcgdex.net/en/ex/ex1/19', 'Kouki Saitou', 'Rare', 10.02, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-19', 279, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-20', 20, 'Sceptile', 'https://assets.tcgdex.net/en/ex/ex1/20', 'Ken Sugimori', 'Rare', 4.34, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-20', 254, 100, 'Grass', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-21', 21, 'Seaking', 'https://assets.tcgdex.net/en/ex/ex1/21', 'Hajime Kusajima', 'Rare', 5.2, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-21', 119, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-22', 22, 'Sharpedo', 'https://assets.tcgdex.net/en/ex/ex1/22', 'Hajime Kusajima', 'Rare', 1.93, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-22', 319, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-23', 23, 'Swampert', 'https://assets.tcgdex.net/en/ex/ex1/23', 'Ken Sugimori', 'Rare', 4.24, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-23', 260, 100, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-24', 24, 'Weezing', 'https://assets.tcgdex.net/en/ex/ex1/24', 'Atsuko Nishida', 'Rare', 6.21, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-24', 110, 80, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-25', 25, 'Aron', 'https://assets.tcgdex.net/en/ex/ex1/25', 'Midori Harada', 'Uncommon', 10.77, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-25', 304, 50, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-26', 26, 'Cascoon', 'https://assets.tcgdex.net/en/ex/ex1/26', 'Midori Harada', 'Uncommon', 4.42, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-26', 268, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-27', 27, 'Combusken', 'https://assets.tcgdex.net/en/ex/ex1/27', 'Kouki Saitou', 'Uncommon', 5.35,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-27', 256, 70, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-28', 28, 'Combusken', 'https://assets.tcgdex.net/en/ex/ex1/28', 'Ken Sugimori', 'Uncommon', 3.75,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-28', 256, 80, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-29', 29, 'Delcatty', 'https://assets.tcgdex.net/en/ex/ex1/29', 'Ken Sugimori', 'Uncommon', 9.2, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-29', 301, 80, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-30', 30, 'Electrike', 'https://assets.tcgdex.net/en/ex/ex1/30', 'Hajime Kusajima', 'Uncommon', 9.19,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-30', 309, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-31', 31, 'Grovyle', 'https://assets.tcgdex.net/en/ex/ex1/31', 'Midori Harada', 'Uncommon', 2.92, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-31', 253, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-32', 32, 'Grovyle', 'https://assets.tcgdex.net/en/ex/ex1/32', 'Ken Sugimori', 'Uncommon', 5.76, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-32', 253, 80, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-33', 33, 'Hariyama', 'https://assets.tcgdex.net/en/ex/ex1/33', 'Ken Sugimori', 'Uncommon', 7.93, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-33', 297, 80, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-34', 34, 'Kirlia', 'https://assets.tcgdex.net/en/ex/ex1/34', 'Ken Sugimori', 'Uncommon', 3.51, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-34', 281, 70, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-35', 35, 'Kirlia', 'https://assets.tcgdex.net/en/ex/ex1/35', 'Atsuko Nishida', 'Uncommon', 6.43, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-35', 281, 70, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-36', 36, 'Lairon', 'https://assets.tcgdex.net/en/ex/ex1/36', 'Ken Sugimori', 'Uncommon', 8.74, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-36', 305, 70, 'Metal', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-37', 37, 'Lairon', 'https://assets.tcgdex.net/en/ex/ex1/37', 'Mitsuhiro Arita', 'Uncommon', 1.2, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-37', 305, 80, 'Metal', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-38', 38, 'Linoone', 'https://assets.tcgdex.net/en/ex/ex1/38', 'Ken Sugimori', 'Uncommon', 9.48, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-38', 264, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-39', 39, 'Manectric', 'https://assets.tcgdex.net/en/ex/ex1/39', 'Ken Sugimori', 'Uncommon', 6.17,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-39', 310, 70, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-40', 40, 'Marshtomp', 'https://assets.tcgdex.net/en/ex/ex1/40', 'Mitsuhiro Arita', 'Uncommon', 4.45,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-40', 259, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-41', 41, 'Marshtomp', 'https://assets.tcgdex.net/en/ex/ex1/41', 'Ken Sugimori', 'Uncommon', 8.15,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-41', 259, 80, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-42', 42, 'Mightyena', 'https://assets.tcgdex.net/en/ex/ex1/42', 'Ken Sugimori', 'Uncommon', 4.46,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-42', 262, 70, 'Darkness', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-43', 43, 'Silcoon', 'https://assets.tcgdex.net/en/ex/ex1/43', 'Hajime Kusajima', 'Uncommon', 1.87,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-43', 266, 60, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-44', 44, 'Skitty', 'https://assets.tcgdex.net/en/ex/ex1/44', 'Midori Harada', 'Uncommon', 7.95, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-44', 300, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-45', 45, 'Slakoth', 'https://assets.tcgdex.net/en/ex/ex1/45', 'Kagemaru Himeno', 'Uncommon', 10.18,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-45', 287, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-46', 46, 'Swellow', 'https://assets.tcgdex.net/en/ex/ex1/46', 'Ken Sugimori', 'Uncommon', 1.46, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-46', 277, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-47', 47, 'Vigoroth', 'https://assets.tcgdex.net/en/ex/ex1/47', 'Kagemaru Himeno', 'Uncommon', 1.61,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-47', 288, 70, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-48', 48, 'Wailmer', 'https://assets.tcgdex.net/en/ex/ex1/48', 'Mitsuhiro Arita', 'Uncommon', 7.88,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-48', 320, 80, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-49', 49, 'Aron', 'https://assets.tcgdex.net/en/ex/ex1/49', 'Mitsuhiro Arita', 'Common', 4.95, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-49', 304, 40, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-50', 50, 'Aron', 'https://assets.tcgdex.net/en/ex/ex1/50', 'Ken Sugimori', 'Common', 8.7, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-50', 304, 50, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-51', 51, 'Carvanha', 'https://assets.tcgdex.net/en/ex/ex1/51', 'Hajime Kusajima', 'Common', 6.89,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-51', 318, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-52', 52, 'Electrike', 'https://assets.tcgdex.net/en/ex/ex1/52', 'Ken Sugimori', 'Common', 9.2, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-52', 309, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-53', 53, 'Electrike', 'https://assets.tcgdex.net/en/ex/ex1/53', 'Mitsuhiro Arita', 'Common', 8.67,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-53', 309, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-54', 54, 'Koffing', 'https://assets.tcgdex.net/en/ex/ex1/54', 'Atsuko Nishida', 'Common', 4.02, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-54', 109, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-55', 55, 'Goldeen', 'https://assets.tcgdex.net/en/ex/ex1/55', 'Hajime Kusajima', 'Common', 1.33, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-55', 118, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-56', 56, 'Makuhita', 'https://assets.tcgdex.net/en/ex/ex1/56', 'Ken Sugimori', 'Common', 8.5, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-56', 296, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-57', 57, 'Makuhita', 'https://assets.tcgdex.net/en/ex/ex1/57', 'Kagemaru Himeno', 'Common', 5.56,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-57', 296, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-58', 58, 'Makuhita', 'https://assets.tcgdex.net/en/ex/ex1/58', 'Naoyo Kimura', 'Common', 5.15, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-58', 296, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-59', 59, 'Mudkip', 'https://assets.tcgdex.net/en/ex/ex1/59', 'Mitsuhiro Arita', 'Common', 6.55, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-59', 258, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-60', 60, 'Mudkip', 'https://assets.tcgdex.net/en/ex/ex1/60', 'Ken Sugimori', 'Common', 4.71, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-60', 258, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-61', 61, 'Numel', 'https://assets.tcgdex.net/en/ex/ex1/61', 'Ken Sugimori', 'Common', 7.16, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-61', 322, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-62', 62, 'Phanpy', 'https://assets.tcgdex.net/en/ex/ex1/62', 'Kagemaru Himeno', 'Common', 6.98, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-62', 231, 50, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-63', 63, 'Poochyena', 'https://assets.tcgdex.net/en/ex/ex1/63', 'Ken Sugimori', 'Common', 7.47, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-63', 261, 40, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-64', 64, 'Poochyena', 'https://assets.tcgdex.net/en/ex/ex1/64', 'Atsuko Nishida', 'Common', 8.65,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-64', 261, 50, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-65', 65, 'Poochyena', 'https://assets.tcgdex.net/en/ex/ex1/65', 'Naoyo Kimura', 'Common', 6.76, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-65', 261, 50, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-66', 66, 'Ralts', 'https://assets.tcgdex.net/en/ex/ex1/66', 'Ken Sugimori', 'Common', 8.14, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-66', 280, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-67', 67, 'Ralts', 'https://assets.tcgdex.net/en/ex/ex1/67', 'Atsuko Nishida', 'Common', 1.15, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-67', 280, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-68', 68, 'Ralts', 'https://assets.tcgdex.net/en/ex/ex1/68', 'Kagemaru Himeno', 'Common', 9.41, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-68', 280, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-69', 69, 'Shroomish', 'https://assets.tcgdex.net/en/ex/ex1/69', 'Atsuko Nishida', 'Common', 10.13,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-69', 285, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-70', 70, 'Skitty', 'https://assets.tcgdex.net/en/ex/ex1/70', 'Ken Sugimori', 'Common', 5.08, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-70', 300, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-71', 71, 'Skitty', 'https://assets.tcgdex.net/en/ex/ex1/71', 'Atsuko Nishida', 'Common', 7.53, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-71', 300, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-72', 72, 'Taillow', 'https://assets.tcgdex.net/en/ex/ex1/72', 'Kagemaru Himeno', 'Common', 7.62, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-72', 276, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-73', 73, 'Torchic', 'https://assets.tcgdex.net/en/ex/ex1/73', 'Ken Sugimori', 'Common', 6.66, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-73', 255, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-74', 74, 'Torchic', 'https://assets.tcgdex.net/en/ex/ex1/74', 'Kouki Saitou', 'Common', 1.37, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-74', 255, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-75', 75, 'Treecko', 'https://assets.tcgdex.net/en/ex/ex1/75', 'Midori Harada', 'Common', 2.41, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-75', 252, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-76', 76, 'Treecko', 'https://assets.tcgdex.net/en/ex/ex1/76', 'Ken Sugimori', 'Common', 3.47, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-76', 252, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-77', 77, 'Wingull', 'https://assets.tcgdex.net/en/ex/ex1/77', 'Kouki Saitou', 'Common', 6.35, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-77', 278, 40, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-78', 78, 'Wurmple', 'https://assets.tcgdex.net/en/ex/ex1/78', 'Hajime Kusajima', 'Common', 7.05, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-78', 265, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-79', 79, 'Zigzagoon', 'https://assets.tcgdex.net/en/ex/ex1/79', 'Atsuko Nishida', 'Common', 9.79,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-79', 263, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-80', 80, 'Energy Removal 2', 'https://assets.tcgdex.net/en/ex/ex1/80', 'Keiji Kinebuchi', 'Uncommon',
        10.67, 'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-80', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-81', 81, 'Energy Restore', 'https://assets.tcgdex.net/en/ex/ex1/81', 'Hideyuki Nakajima', 'Uncommon', 7.17,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-81', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-82', 82, 'Energy Switch', 'https://assets.tcgdex.net/en/ex/ex1/82', 'Ken Ikuji', 'Uncommon', 2.24,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-82', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-83', 83, 'Lady Outing', 'https://assets.tcgdex.net/en/ex/ex1/83', 'Ken Sugimori', 'Uncommon', 8.0,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-83', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-84', 84, 'Lum Berry', 'https://assets.tcgdex.net/en/ex/ex1/84', 'Kazuo Yazawa', 'Uncommon', 9.16,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-84', 'No effect', 'Tool');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-85', 85, 'Oran Berry', 'https://assets.tcgdex.net/en/ex/ex1/85', 'Kazuo Yazawa', 'Uncommon', 10.81,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-85', 'No effect', 'Tool');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-86', 86, 'Poké Ball', 'https://assets.tcgdex.net/en/ex/ex1/86', 'K. Hoshiba', 'Uncommon', 6.81, 'TRAINER',
        'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-86', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-87', 87, 'Pokémon Reversal', 'https://assets.tcgdex.net/en/ex/ex1/87', 'Hiromichi Sugiyama', 'Uncommon',
        10.22, 'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-87', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-88', 88, 'PokéNav', 'https://assets.tcgdex.net/en/ex/ex1/88', 'Katsura Tabata', 'Uncommon', 2.19,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-88', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-89', 89, 'Professor Birch', 'https://assets.tcgdex.net/en/ex/ex1/89', 'Ken Sugimori', 'Uncommon', 9.73,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-89', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-90', 90, 'Energy Search', 'https://assets.tcgdex.net/en/ex/ex1/90', 'Kai Ishikawa', 'Common', 4.03,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-90', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-91', 91, 'Potion', 'https://assets.tcgdex.net/en/ex/ex1/91', 'Keiji Kinebuchi', 'Common', 1.64, 'TRAINER',
        'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-91', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-92', 92, 'Switch', 'https://assets.tcgdex.net/en/ex/ex1/92', 'Hiromichi Sugiyama', 'Common', 9.6,
        'TRAINER', 'ex1');
INSERT INTO trainers (card_id, effect, type)
VALUES ('ex1-92', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-93', 93, 'Darkness Energy', 'https://assets.tcgdex.net/en/ex/ex1/93', 'Milky Isobe', 'Rare', 3.46,
        'ENERGY', 'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-93', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-94', 94, 'Metal Energy', 'https://assets.tcgdex.net/en/ex/ex1/94', 'Milky Isobe', 'Rare', 5.22, 'ENERGY',
        'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-94', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-95', 95, 'Rainbow Energy', 'https://assets.tcgdex.net/en/ex/ex1/95', 'Takumi Akabane', 'Rare', 8.15,
        'ENERGY', 'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-95', 'Provides energy', 'Special');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-96', 96, 'Chansey ex', 'https://assets.tcgdex.net/en/ex/ex1/96', 'Ryo Ueda', 'Rare', 7.33, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-96', 113, 120, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-97', 97, 'Electabuzz ex', 'https://assets.tcgdex.net/en/ex/ex1/97', 'Hikaru Koike', 'Rare', 3.65,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-97', 125, 90, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-98', 98, 'Hitmonchan ex', 'https://assets.tcgdex.net/en/ex/ex1/98', 'Hiromichi Sugiyama', 'Rare', 5.9,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-98', 107, 90, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-99', 99, 'Lapras ex', 'https://assets.tcgdex.net/en/ex/ex1/99', 'Hikaru Koike', 'Rare', 7.81, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-99', 131, 110, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-100', 100, 'Magmar ex', 'https://assets.tcgdex.net/en/ex/ex1/100', 'Hikaru Koike', 'Rare', 4.46, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-100', 126, 90, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-101', 101, 'Mewtwo ex', 'https://assets.tcgdex.net/en/ex/ex1/101', 'Katsura Tabata', 'Rare', 6.16,
        'POKEMON', 'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-101', 150, 100, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-102', 102, 'Scyther ex', 'https://assets.tcgdex.net/en/ex/ex1/102', 'Ryo Ueda', 'Rare', 3.12, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-102', 123, 80, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-103', 103, 'Sneasel ex', 'https://assets.tcgdex.net/en/ex/ex1/103', 'Ryo Ueda', 'Rare', 1.11, 'POKEMON',
        'ex1');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('ex1-103', 215, 80, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-104', 104, 'Grass Energy', 'https://assets.tcgdex.net/en/ex/ex1/104', 'Unknown', 'Common', 4.53, 'ENERGY',
        'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-104', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-105', 105, 'Fighting Energy', 'https://assets.tcgdex.net/en/ex/ex1/105', 'Unknown', 'Common', 10.99,
        'ENERGY', 'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-105', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-106', 106, 'Water Energy', 'https://assets.tcgdex.net/en/ex/ex1/106', 'Unknown', 'Common', 2.48, 'ENERGY',
        'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-106', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-107', 107, 'Psychic Energy', 'https://assets.tcgdex.net/en/ex/ex1/107', 'Unknown', 'Common', 3.35,
        'ENERGY', 'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-107', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-108', 108, 'Fire Energy', 'https://assets.tcgdex.net/en/ex/ex1/108', 'Unknown', 'Common', 2.66, 'ENERGY',
        'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-108', 'Provides energy', 'Normal');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('ex1-109', 109, 'Lightning Energy', 'https://assets.tcgdex.net/en/ex/ex1/109', 'Unknown', 'Common', 9.82,
        'ENERGY', 'ex1');
INSERT INTO energies (card_id, effect, type)
VALUES ('ex1-109', 'Provides energy', 'Normal');


-- Serie: POP
INSERT INTO series (id, name, logo_url)
VALUES ('pop', 'POP', 'https://assets.tcgdex.net/en/pop/pop1/logo');

-- Set: Nintendo Black Star Promos
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('np', 'Nintendo Black Star Promos', 'https://assets.tcgdex.net/en/pop/np/logo', NOW(), 'pop');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-1', 1, 'Kyogre ex', 'https://assets.tcgdex.net/en/pop/np/1', 'Hiromichi Sugiyama', 'Common', 10.48,
        'POKEMON', 'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-1', 382, 120, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-2', 2, 'Groudon ex', 'https://assets.tcgdex.net/en/pop/np/2', 'Kazuo Yazawa', 'Common', 3.09, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-2', 383, 120, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-3', 3, 'Treecko', 'https://assets.tcgdex.net/en/pop/np/3', 'Atsuko Nishida', 'Common', 2.62, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-3', 252, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-4', 4, 'Grovyle', 'https://assets.tcgdex.net/en/pop/np/4', 'Midori Harada', 'Common', 8.57, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-4', 253, 70, 'Grass', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-5', 5, 'Mudkip', 'https://assets.tcgdex.net/en/pop/np/5', 'Atsuko Nishida', 'Common', 2.46, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-5', 258, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-6', 6, 'Torchic', 'https://assets.tcgdex.net/en/pop/np/6', 'Atsuko Nishida', 'Common', 7.22, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-6', 255, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-7', 7, 'Treecko', 'https://assets.tcgdex.net/en/pop/np/7', 'Atsuko Nishida', 'Common', 6.59, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-7', 252, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-8', 8, 'Torchic', 'https://assets.tcgdex.net/en/pop/np/8', 'Atsuko Nishida', 'Common', 5.48, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-8', 255, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-9', 9, 'Combusken', 'https://assets.tcgdex.net/en/pop/np/9', 'Kouki Saitou', 'Common', 9.57, 'TRAINER',
        'np');
INSERT INTO trainers (card_id, effect, type)
VALUES ('np-9', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-10', 10, 'Mudkip', 'https://assets.tcgdex.net/en/pop/np/10', 'Atsuko Nishida', 'Common', 3.59, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-10', 258, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-11', 11, 'Marshtomp', 'https://assets.tcgdex.net/en/pop/np/11', 'Mitsuhiro Arita', 'Common', 3.93,
        'POKEMON', 'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-11', 259, 70, 'Water', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-12', 12, 'Pikachu', 'https://assets.tcgdex.net/en/pop/np/12', 'Kouki Saitou', 'Common', 10.54, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-12', 25, 50, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-13', 13, 'Meowth', 'https://assets.tcgdex.net/en/pop/np/13', 'Kouki Saitou', 'Common', 3.16, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-13', 52, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-14', 14, 'Latias', 'https://assets.tcgdex.net/en/pop/np/14', 'Ken Sugimori', 'Common', 9.14, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-14', 380, 70, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-15', 15, 'Latios', 'https://assets.tcgdex.net/en/pop/np/15', 'Ken Sugimori', 'Common', 8.5, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-15', 381, 80, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-16', 16, 'Treecko', 'https://assets.tcgdex.net/en/pop/np/16', 'Kagemaru Himeno', 'Common', 1.81, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-16', 252, 40, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-17', 17, 'Torchic', 'https://assets.tcgdex.net/en/pop/np/17', 'Kagemaru Himeno', 'Common', 5.85, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-17', 255, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-18', 18, 'Mudkip', 'https://assets.tcgdex.net/en/pop/np/18', 'Kagemaru Himeno', 'Common', 9.6, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-18', 258, 50, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-19', 19, 'Whismur', 'https://assets.tcgdex.net/en/pop/np/19', 'Kagemaru Himeno', 'Common', 4.4, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-19', 293, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-20', 20, 'Ludicolo', 'https://assets.tcgdex.net/en/pop/np/20', 'Kouki Saitou', 'Common', 11.0, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-20', 272, 90, 'Water', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-21', 21, 'Jirachi', 'https://assets.tcgdex.net/en/pop/np/21', 'Atsuko Nishida', 'Common', 8.2, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-21', 385, 50, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-22', 22, 'Beldum', 'https://assets.tcgdex.net/en/pop/np/22', 'Mitsuhiro Arita', 'Common', 4.99, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-22', 374, 50, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-23', 23, 'Metang', 'https://assets.tcgdex.net/en/pop/np/23', 'Mitsuhiro Arita', 'Common', 2.25, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-23', 375, 80, 'Metal', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-24', 24, 'Chimecho', 'https://assets.tcgdex.net/en/pop/np/24', 'Atsuko Nishida', 'Common', 6.39, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-24', 358, 70, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-25', 25, 'Flygon', 'https://assets.tcgdex.net/en/pop/np/25', 'Kouki Saitou', 'Common', 3.98, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-25', 330, 120, 'Colorless', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-26', 26, 'Tropical Wind', 'https://assets.tcgdex.net/en/pop/np/26', 'Sumiyoshi Kizuki', 'Common', 4.88,
        'TRAINER', 'np');
INSERT INTO trainers (card_id, effect, type)
VALUES ('np-26', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-27', 27, 'Tropical Tidal Wave', 'https://assets.tcgdex.net/en/pop/np/27', 'Unknown', 'Common', 3.64,
        'TRAINER', 'np');
INSERT INTO trainers (card_id, effect, type)
VALUES ('np-27', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-28', 28, 'Championship Arena', 'https://assets.tcgdex.net/en/pop/np/28', 'Ryo Ueda', 'Common', 3.55,
        'TRAINER', 'np');
INSERT INTO trainers (card_id, effect, type)
VALUES ('np-28', 'No effect', 'Stadium');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-29', 29, 'Celebi', 'https://assets.tcgdex.net/en/pop/np/29', 'Hajime Kusajima', 'Common', 2.28, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-29', 251, 50, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-30', 30, 'Suicune', 'https://assets.tcgdex.net/en/pop/np/30', 'Atsuko Nishida', 'Common', 1.55, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-30', 245, 70, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-31', 31, 'Moltres ex', 'https://assets.tcgdex.net/en/pop/np/31', 'Ken Ikuji', 'Common', 1.12, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-31', 146, 100, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-32', 32, 'Articuno ex', 'https://assets.tcgdex.net/en/pop/np/32', 'Nakaoka', 'Common', 10.23, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-32', 144, 100, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-33', 33, 'Zapdos ex', 'https://assets.tcgdex.net/en/pop/np/33', 'K. Hoshiba', 'Common', 10.97, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-33', 145, 100, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-34', 34, 'Typhlosion', 'https://assets.tcgdex.net/en/pop/np/34', 'Hajime Kusajima', 'Common', 5.4,
        'POKEMON', 'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-34', 157, 110, 'Fire', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-35', 35, 'Pikachu δ', 'https://assets.tcgdex.net/en/pop/np/35', 'Ryo Ueda', 'Common', 9.26, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-35', 25, 40, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-36', 36, 'Tropical Tidal Wave', 'https://assets.tcgdex.net/en/pop/np/36', 'Unknown', 'Common', 2.53,
        'TRAINER', 'np');
INSERT INTO trainers (card_id, effect, type)
VALUES ('np-36', 'No effect', 'Item');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-37', 37, 'Kyogre ex', 'https://assets.tcgdex.net/en/pop/np/37', 'Ryo Ueda', 'Common', 9.52, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-37', 382, 100, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-38', 38, 'Groudon ex', 'https://assets.tcgdex.net/en/pop/np/38', 'Ryo Ueda', 'Common', 2.25, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-38', 383, 100, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-39', 39, 'Rayquaza ex', 'https://assets.tcgdex.net/en/pop/np/39', 'Ryo Ueda', 'Common', 9.82, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-39', 384, 100, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('np-40', 40, 'Mew', 'https://assets.tcgdex.net/en/pop/np/40', 'Masakazu Fukuda', 'Common', 10.84, 'POKEMON',
        'np');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('np-40', 151, 50, 'Psychic', 'Basic', NULL, 1);


-- Serie: Trainer kits
INSERT INTO series (id, name, logo_url)
VALUES ('tk', 'Trainer kits', NULL);

-- Set: EX trainer Kit (Latias)
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('tk-ex-latia', 'EX trainer Kit (Latias)', NULL, NOW(), 'tk');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-1', 1, 'Bagon', NULL, 'Ken Sugimori', 'None', 4.34, 'POKEMON', 'tk-ex-latia');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('tk-ex-latia-1', 371, 40, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-2', 2, 'Combusken', NULL, 'Kouki Saitou', 'None', 2.73, 'POKEMON', 'tk-ex-latia');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('tk-ex-latia-2', 256, 70, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-3', 3, 'Delcatty', NULL, 'Midori Harada', 'None', 7.15, 'POKEMON', 'tk-ex-latia');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('tk-ex-latia-3', 301, 80, 'Colorless', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-4', 4, 'Latias', NULL, 'Nakaoka', 'None', 5.89, 'POKEMON', 'tk-ex-latia');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('tk-ex-latia-4', 380, 70, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-5', 5, 'Numel', NULL, 'Yuka Morii', 'None', 8.98, 'POKEMON', 'tk-ex-latia');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('tk-ex-latia-5', 322, 40, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-6', 6, 'Skitty', NULL, 'Atsuko Nishida', 'None', 6.83, 'POKEMON', 'tk-ex-latia');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('tk-ex-latia-6', 300, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-7', 7, 'Torchic', NULL, 'Hironobu Yoshida', 'None', 1.14, 'POKEMON', 'tk-ex-latia');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('tk-ex-latia-7', 255, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-8', 8, 'Potion', NULL, 'Keiji Kinebuchi', 'None', 9.53, 'TRAINER', 'tk-ex-latia');
INSERT INTO trainers (card_id, effect, type)
VALUES ('tk-ex-latia-8',
        'Remove 2 damage counters from 1 of your Pokémon (remove 1 damage counter if that Pokémon has only 1).',
        'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-9', 9, 'Energy Search', NULL, 'Kai Ishikawa', 'None', 8.74, 'TRAINER', 'tk-ex-latia');
INSERT INTO trainers (card_id, effect, type)
VALUES ('tk-ex-latia-9',
        'Search your deck for a basic Energy card, show it to your opponent, and put it into your hand. Shuffle your deck afterward.',
        'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('tk-ex-latia-10', 10, 'Fire Energy', NULL, '', 'None', 10.57, 'ENERGY', 'tk-ex-latia');
INSERT INTO energies (card_id, effect, type)
VALUES ('tk-ex-latia-10', 'Provides energy', 'Normal');


-- Serie: Diamond & Pearl
INSERT INTO series (id, name, logo_url)
VALUES ('dp', 'Diamond & Pearl', 'https://assets.tcgdex.net/en/dp/dp1/logo');

-- Set: DP Black Star Promos
INSERT INTO sets (id, name, logo_url, release_date, serie_id)
VALUES ('dpp', 'DP Black Star Promos', 'https://assets.tcgdex.net/en/dp/dpp/logo', NOW(), 'dp');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP01', 01, 'Turtwig', 'https://assets.tcgdex.net/en/dp/dpp/DP01', 'Masakazu Fukuda', 'Common', 4.01,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP01', 387, 60, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP02', 02, 'Chimchar', 'https://assets.tcgdex.net/en/dp/dpp/DP02', 'Kagemaru Himeno', 'Common', 8.33,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP02', 390, 50, 'Fire', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP03', 03, 'Piplup', 'https://assets.tcgdex.net/en/dp/dpp/DP03', 'Atsuko Nishida', 'Common', 8.97,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP03', 393, 60, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP04', 04, 'Pachirisu', 'https://assets.tcgdex.net/en/dp/dpp/DP04', 'Atsuko Nishida', 'Common', 3.37,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP04', 417, 70, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP05', 05, 'Tropical Wind', 'https://assets.tcgdex.net/en/dp/dpp/DP05', 'Sumiyoshi Kizuki', 'Common',
        1.41, 'TRAINER', 'dpp');
INSERT INTO trainers (card_id, effect, type)
VALUES ('dpp-DP05', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP06', 06, 'Buneary', 'https://assets.tcgdex.net/en/dp/dpp/DP06', 'Kagemaru Himeno', 'Common', 10.92,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP06', 427, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP07', 07, 'Cranidos', 'https://assets.tcgdex.net/en/dp/dpp/DP07', 'Mitsuhiro Arita', 'Common', 7.4,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP07', 408, 70, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP08', 08, 'Shieldon', 'https://assets.tcgdex.net/en/dp/dpp/DP08', 'Kouki Saitou', 'Common', 1.18,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP08', 410, 80, 'Metal', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP09', 09, 'Torterra', 'https://assets.tcgdex.net/en/dp/dpp/DP09', 'Shizurow', 'Common', 6.55, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP09', 389, 160, 'Grass', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP10', 10, 'Infernape', 'https://assets.tcgdex.net/en/dp/dpp/DP10', 'Shizurow', 'Common', 1.63,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP10', 392, 120, 'Fire', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP11', 11, 'Empoleon', 'https://assets.tcgdex.net/en/dp/dpp/DP11', 'Shizurow', 'Common', 3.27, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP11', 395, 140, 'Water', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP12', 12, 'Lucario', 'https://assets.tcgdex.net/en/dp/dpp/DP12', 'Ryo Ueda', 'Common', 1.94, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP12', 448, 110, 'Fighting', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP13', 13, 'Buizel', 'https://assets.tcgdex.net/en/dp/dpp/DP13', 'Mitsuhiro Arita', 'Common', 2.9,
        'TRAINER', 'dpp');
INSERT INTO trainers (card_id, effect, type)
VALUES ('dpp-DP13',
        'If Buizel has less Energy attached to it than the Defending Pokémon, this attack does 10 damage plus 10 more damage.',
        'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP14', 14, 'Chatot', 'https://assets.tcgdex.net/en/dp/dpp/DP14', 'Masakazu Fukuda', 'Common', 7.34,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP14', 441, 60, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP15', 15, 'Shinx', 'https://assets.tcgdex.net/en/dp/dpp/DP15', 'Kagemaru Himeno', 'Common', 1.44,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP15', 403, 60, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP16', 16, 'Pikachu', 'https://assets.tcgdex.net/en/dp/dpp/DP16', 'Sumiyoshi Kizuki', 'Common', 9.21,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP16', 25, 60, 'Lightning', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP17', 17, 'Dialga', 'https://assets.tcgdex.net/en/dp/dpp/DP17', 'Ryo Ueda', 'Common', 2.48, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP17', 483, 120, 'Metal', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP18', 18, 'Palkia', 'https://assets.tcgdex.net/en/dp/dpp/DP18', 'Ryo Ueda', 'Common', 5.42, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP18', 484, 120, 'Water', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP19', 19, 'Darkrai', 'https://assets.tcgdex.net/en/dp/dpp/DP19', 'Shizurow', 'Common', 5.02, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP19', 491, 100, 'Darkness', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP20', 20, 'Magmortar', 'https://assets.tcgdex.net/en/dp/dpp/DP20', 'Hiroaki Ito', 'Common', 3.53,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP20', 467, 100, 'Fire', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP21', 21, 'Raichu', 'https://assets.tcgdex.net/en/dp/dpp/DP21', 'Daisuke Ito', 'Common', 6.83,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP21', 26, 90, 'Lightning', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP22', 22, 'Mime Jr.', 'https://assets.tcgdex.net/en/dp/dpp/DP22', 'Mitsuhiro Arita', 'Common', 1.58,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP22', 439, 40, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP23', 23, 'Glameow', 'https://assets.tcgdex.net/en/dp/dpp/DP23', 'Mitsuhiro Arita', 'Common', 5.67,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP23', 431, 50, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP24', 24, 'Darkrai', 'https://assets.tcgdex.net/en/dp/dpp/DP24', 'Kouki Saitou', 'Common', 9.3,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP24', 491, 80, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP25', 25, 'Tropical Wind', 'https://assets.tcgdex.net/en/dp/dpp/DP25', 'Sumiyoshi Kizuki', 'Common',
        1.98, 'TRAINER', 'dpp');
INSERT INTO trainers (card_id, effect, type)
VALUES ('dpp-DP25', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP26', 26, 'Dialga', 'https://assets.tcgdex.net/en/dp/dpp/DP26', 'Kazuyuki Kano', 'Common', 6.12,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP26', 483, 90, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP27', 27, 'Palkia', 'https://assets.tcgdex.net/en/dp/dpp/DP27', 'Daisuke Ito', 'Common', 4.33,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP27', 484, 90, 'Water', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP28', 28, 'Mewtwo', 'https://assets.tcgdex.net/en/dp/dpp/DP28', 'Shizurow', 'Common', 6.12, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP28', 150, 120, 'Psychic', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP29', 29, 'Rhyperior', 'https://assets.tcgdex.net/en/dp/dpp/DP29', 'Ryo Ueda', 'Common', 5.89,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP29', 464, 170, 'Fighting', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP30', 30, 'Regigigas', 'https://assets.tcgdex.net/en/dp/dpp/DP30', 'Shizurow', 'Common', 9.53,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP30', 486, 150, 'Colorless', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP31', 31, 'Heatran', 'https://assets.tcgdex.net/en/dp/dpp/DP31', 'Shizurow', 'Common', 8.36, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP31', 485, 120, 'Fire', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP32', 32, 'Magnezone', 'https://assets.tcgdex.net/en/dp/dpp/DP32', 'Kent Kanetsuna', 'Common', 9.43,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP32', 462, 130, 'Metal', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP33', 33, 'Dusknoir', 'https://assets.tcgdex.net/en/dp/dpp/DP33', 'Kent Kanetsuna', 'Common', 4.78,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP33', 477, 130, 'Psychic', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP34', 34, 'Drifblim', 'https://assets.tcgdex.net/en/dp/dpp/DP34', 'Mitsuhiro Arita', 'Common', 10.42,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP34', 426, 80, 'Psychic', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP35', 35, 'Porygon-Z', 'https://assets.tcgdex.net/en/dp/dpp/DP35', 'Kagemaru Himeno', 'Common', 4.33,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP35', 474, 120, 'Colorless', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP36', 36, 'Gliscor', 'https://assets.tcgdex.net/en/dp/dpp/DP36', 'Kagemaru Himeno', 'Common', 4.84,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP36', 472, 90, 'Fighting', 'Stage1', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP37', 37, 'Dialga', 'https://assets.tcgdex.net/en/dp/dpp/DP37', 'Ryo Ueda', 'Common', 8.63, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP37', 483, 120, 'Metal', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP38', 38, 'Giratina', 'https://assets.tcgdex.net/en/dp/dpp/DP38', 'Shizurow', 'Common', 2.98, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP38', 487, 130, 'Psychic', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP39', 39, 'Shaymin', 'https://assets.tcgdex.net/en/dp/dpp/DP39', 'Shizurow', 'Common', 8.01, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP39', 492, 110, 'Grass', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP40', 40, 'Regigigas', 'https://assets.tcgdex.net/en/dp/dpp/DP40', 'Kagemaru Himeno', 'Common', 3.4,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP40', 486, 100, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP41', 41, 'Toxicroak G', 'https://assets.tcgdex.net/en/dp/dpp/DP41', 'Ryota Saito', 'Common', 5.07,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP41', 454, 90, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP42', 42, 'Carnivine G', 'https://assets.tcgdex.net/en/dp/dpp/DP42', 'Makoto Imai', 'Common', 2.58,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP42', 455, 80, 'Grass', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP43', 43, 'Probopass G', 'https://assets.tcgdex.net/en/dp/dpp/DP43', 'Ryota Saito', 'Common', 1.66,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP43', 476, 90, 'Fighting', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP44', 44, 'Magnezone', 'https://assets.tcgdex.net/en/dp/dpp/DP44', 'Kagemaru Himeno', 'Common', 5.12,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP44', 462, 130, 'Lightning', 'Stage2', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP45', 45, 'Charizard G', 'https://assets.tcgdex.net/en/dp/dpp/DP45', 'Wataru Kawahara', 'Common', 6.7,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP45', 6, 120, 'Fire', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP46', 46, 'Garchomp C', 'https://assets.tcgdex.net/en/dp/dpp/DP46', 'Shizurow', 'Common', 3.95,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP46', 445, 110, 'Colorless', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP47', 47, 'Rayquaza C', 'https://assets.tcgdex.net/en/dp/dpp/DP47', 'Unknown', 'Common', 8.11,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP47', 384, 120, 'Colorless', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP48', 48, 'Tropical Wind', 'https://assets.tcgdex.net/en/dp/dpp/DP48', 'Sumiyoshi Kizuki', 'Common',
        5.42, 'TRAINER', 'dpp');
INSERT INTO trainers (card_id, effect, type)
VALUES ('dpp-DP48', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP49', 49, 'Dialga', 'https://assets.tcgdex.net/en/dp/dpp/DP49', 'Kagemaru Himeno', 'Common', 10.85,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP49', 483, 100, 'Metal', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP50', 50, 'Arceus', 'https://assets.tcgdex.net/en/dp/dpp/DP50', 'Kunihiko Yuyama', 'Common', 5.95,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP50', 493, 90, 'Colorless', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP51', 51, 'Cresselia', 'https://assets.tcgdex.net/en/dp/dpp/DP51', 'Wataru Kawahara', 'Common', 2.08,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP51', 488, 90, 'Psychic', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP52', 52, 'Darkrai', 'https://assets.tcgdex.net/en/dp/dpp/DP52', 'Wataru Kawahara', 'Common', 8.01,
        'POKEMON', 'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP52', 491, 90, 'Darkness', 'Basic', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP53', 53, 'Arceus', 'https://assets.tcgdex.net/en/dp/dpp/DP53', 'Shizurow', 'Common', 7.91, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP53', 493, 120, 'Colorless', 'LEVEL-UP', NULL, 1);

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP54', 54, 'Beginning Door', 'https://assets.tcgdex.net/en/dp/dpp/DP54', 'Ryo Ueda', 'Common', 10.41,
        'TRAINER', 'dpp');
INSERT INTO trainers (card_id, effect, type)
VALUES ('dpp-DP54', 'No effect', 'Supporter');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP55', 55, 'Ultimate Zone', 'https://assets.tcgdex.net/en/dp/dpp/DP55', 'Yusuke Ishikawa', 'Common',
        2.65, 'TRAINER', 'dpp');
INSERT INTO trainers (card_id, effect, type)
VALUES ('dpp-DP55', 'No effect', 'Stadium');

INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id)
VALUES ('dpp-DP56', 56, 'Arceus', 'https://assets.tcgdex.net/en/dp/dpp/DP56', 'Ryo Ueda', 'Common', 6.44, 'POKEMON',
        'dpp');
INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level)
VALUES ('dpp-DP56', 493, 120, 'Colorless', 'LEVEL-UP', NULL, 1);


-- Seed concluído! Total de 10 séries importadas.
