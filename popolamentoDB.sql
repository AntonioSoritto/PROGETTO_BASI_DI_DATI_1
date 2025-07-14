-- ENUM 
CREATE TYPE stato_prenotazione AS ENUM ('IN_ATTESA', 'CONFERMATA', 'CANCELLATA');
CREATE TYPE stato_volo AS ENUM ('PROGRAMMATO', 'IN_RITARDO', 'ATTERRATO', 'DECOLLATO', 'CANCELLATO');
-- Utenti
INSERT INTO "utente" ("loginu", "nome", "password") VALUES
  ('clapton', 'Eric Clapton', 'blues12345'),
  ('hendrix', 'Jimi Hendrix', 'purpleHaze88'),
  ('ayoung', 'Angus Young', 'highVoltage90'),
  ('gilmour', 'David Gilmour', 'shineOn77'),
  ('frusciante', 'John Frusciante', 'californica8');

-- Passeggeri
INSERT INTO "passeggero" ("iddocumento", "nome", "cognome") VALUES
  ('DOC001', 'Eric', 'Clapton'),
  ('DOC002', 'Jimi', 'Hendrix'),
  ('DOC003', 'Angus', 'Young'),
  ('DOC004', 'David', 'Gilmour'),
  ('DOC005', 'John', 'Frusciante');

-- Amministratori
INSERT INTO "amministratore" ("logina", "password") VALUES
  ('admin_page', 'darkSideMoon!'),
  ('admin_jagger', 'rollingSt0nes!'),
  ('admin_knopfler', 'sultansSwing!');

-- Gate
INSERT INTO "gate" ("idgate") VALUES (101), (102), (103), (104), (105);

-- VoloOrigine 
INSERT INTO "voloorigine" (
  "idvoloorigine", "compagnia", "a_volo_origine", "a_volo_destinazione",
  "data_volo", "ora_volo_partenza", "ora_volo_arrivo", "ritardo", "stato"
) VALUES
  (1, 'RockAir', 'NAP', 'LHR', CURRENT_DATE + 1, '09:00', '11:00', INTERVAL '15 minutes', 'PROGRAMMATO'),
  (2, 'BluesJet', 'NAP', 'FCO', CURRENT_DATE + 2, '13:00', '14:30', INTERVAL '0 minutes', 'PROGRAMMATO'),
  (3, 'SoloFly', 'NAP', 'AMS', CURRENT_DATE + 1, '18:00', '20:30', INTERVAL '10 minutes', 'PROGRAMMATO');

-- VoloDestinazione 
INSERT INTO "volodestinazione" (
  "idvolodestinazione", "compagnia", "a_volo_origine", "a_volo_destinazione",
  "data_volo", "ora_volo_partenza", "ora_volo_arrivo", "ritardo", "stato"
) VALUES
  (1, 'RockAir', 'LHR', 'NAP', CURRENT_DATE + 1, '07:00', '08:45', INTERVAL '5 minutes', 'PROGRAMMATO'),
  (2, 'SoloFly', 'CDG', 'NAP', CURRENT_DATE + 2, '12:00', '13:30', INTERVAL '0 minutes', 'PROGRAMMATO');

-- VoloAtteso
INSERT INTO "voloatteso" ("idvolo", "idgate") VALUES
  (1, 101),
  (2, 102),
  (3, 103);

-- Amministra
INSERT INTO "amministra" ("logina", "idvolo") VALUES
  ('admin_page', 1),
  ('admin_jagger', 2),
  ('admin_knopfler', 3);

-- Prenotazioni
INSERT INTO "prenotazione" (
  "idprenotazione", "numerovolo", "posto", "bagaglio", "stato",
  "loginu", "iddocumento", "idvolo"
) VALUES
  (1, 1001, '12A', 1, 'CONFERMATA', 'clapton', 'DOC001', 1),
  (2, 1002, '7C', 2, 'IN_ATTESA', 'hendrix', 'DOC002', 2),
  (3, 1003, '1B', 0, 'CONFERMATA', 'ayoung', 'DOC003', 3),
  (4, 1001, '2F', 1, 'CONFERMATA', 'frusciante', 'DOC005', 1);

-- Sequence
CREATE SEQUENCE IF NOT EXISTS seq_volo_origine START WITH 4;
CREATE SEQUENCE IF NOT EXISTS seq_volo_destinazione START WITH 3;
CREATE SEQUENCE IF NOT EXISTS seq_prenotazione START WITH 5;