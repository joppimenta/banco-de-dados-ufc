CREATE OR REPLACE FUNCTION verificaLance() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Valor <= (SELECT MAX(Valor) FROM Lance WHERE idLeilao = NEW.idLeilao) THEN
        RAISE EXCEPTION 'O valor do lance deve ser maior que o lance anterior.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerVerificaLance
BEFORE INSERT ON Lance
FOR EACH ROW
EXECUTE FUNCTION verificaLance();